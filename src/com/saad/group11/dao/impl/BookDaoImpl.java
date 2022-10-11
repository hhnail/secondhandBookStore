package com.saad.group11.dao.impl;

import java.util.List;

import com.saad.group11.bean.BookList;
import com.saad.group11.bean.Client;
import com.saad.group11.bean.Page;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.dao.BaseDao;
import com.saad.group11.dao.BookDao;
import com.saad.group11.dao.BookListDao;
import com.saad.group11.dao.ClientDao;

public class BookDaoImpl extends BaseDao<StorePersonal> implements BookDao {

	BookListDao bookListDao = new BookListDaoImpl();
	ClientDao clientDao = new ClientDaoImpl();

	@Override
	public List<StorePersonal> getAllBooks() {
		String sql = "select * from storepersonal,booklist where booklist.ISBN = storepersonal.ISBN;";
		return this.getBeanList(sql);
	}


	/*
	 * 根据p_id获取书的信息
	 * 
	 * 
	 */
	@Override
	public StorePersonal getBookById(String bookId) {
		String sql = "select * from storepersonal where `p_id` = ?";
		return this.getBean(sql, bookId);
	}


	/**
	 * 获取该书库存（包括所有商家）
	 * 
	 * 
	 */
	@Override
	public int getStock(String ISBN) {
		String sql = "select count(1) from storepersonal where ISBN=?";
		return Integer.parseInt(this.getSingeValue(sql, ISBN)+"");
	}


	/*
	 * 获取分页后的book信息
	 * 
	 * 
	 */
	@Override
	public Page<StorePersonal> getBooksInPage(Page<StorePersonal> page) {
		String sql = "select count(1) from booklist,storepersonal where booklist.ISBN = storepersonal.ISBN;";//性能比count(*)高，也可以写count(1)
		Object tempTotalRecord = this.getSingeValue(sql);
		int totalRecord = Integer.parseInt(tempTotalRecord + "");
		page.setTotalRecord(totalRecord);
		System.out.println("test1 总页数" + page.getTotalPageNo());
		sql = "select * "
				+ "from booklist,storepersonal "
				+ "where booklist.ISBN = storepersonal.ISBN "
				+ "LIMIT ?,?";
		List<StorePersonal> list = this.getBeanList(sql, (page.getPageNo()-1)*Page.PAGE_SIZE , Page.PAGE_SIZE);

		//为每一个book set client和booklist
		for (StorePersonal book : list) {
			//			System.out.println(book);
			BookList bookList = bookListDao.getBookListByISBN(book.getISBN());
			Client client = clientDao.getClientById(book.getC_id());
			book.setBookList(bookList);
			book.setClient(client);
		}

		//将最后的、完整的list set 到 page中
		page.setList(list);
		System.out.println(page.getTotalPageNo());
		return page;
	}



	/*
	 * 获取价格区间的、分页后的 book信息
	 * state 为 待售：还没有卖出去的书
	 * 
	 * 
	 */

	@Override
	public Page<StorePersonal> getBooksInPageByPrice(Page<StorePersonal> page, double min_price, double max_price) {
		String sql = "SELECT count(1) "
				+ "FROM booklist,storepersonal "
				+ "where booklist.ISBN = storepersonal.ISBN "
				+ "and state = '待售' "
				+ "and "
				+ "price between ? and ? ";//性能比count(*)高，也可以写count(ISBN)...
		//		System.out.println(sql);//错误原因：storepersonal.ISBN"没有在后面加一个空格
		System.out.println("=======================test in 【BookDaoImpl.getBooksInPageByPrice】");
		System.out.println("max_price in 【BookDaoImpl】:" + max_price);
		Object tempTotalRecord = this.getSingeValue(sql, min_price, max_price);//between 先传较小值再传较大值
		int totalRecord = Integer.parseInt(tempTotalRecord + "");//将int类型的totalRecord转换为String类型
		System.out.println("！！ totalRecord：" + totalRecord);
		page.setTotalRecord(totalRecord);//为totalRecord赋值
		System.out.println(" 总页数" + page.getTotalPageNo());
		System.out.println("================== test over!!");

		/*
		 * limit不能从负数开始
		 * 那么如果getPageNo得到的是0，那么indexFrom（limit的第一个参数）就变成-4了
		 * 这样sql会报错，所以默认给他limit（0,4）
		 * 
		 */
		int indexFrom = (page.getPageNo()-1)*Page.PAGE_SIZE;//起始页，即从该条记录开始显示
		if(indexFrom<0) {
			indexFrom = 0;
		}


		sql = "select * "
				+ "from booklist,storepersonal "
				+ "where booklist.ISBN = storepersonal.ISBN "
				+ "and "
				+ "price between ? and ? "
				+ "LIMIT ?,?;";
		List<StorePersonal> list = this.getBeanList(sql, min_price, max_price, indexFrom, Page.PAGE_SIZE);
		/*
		 * 将list放到page中
		 * 此时的list里放的是book信息
		 * 但此时的book只有c_id和ISBN
		 * book的client、booklist对象都还没有赋值
		 */
		page.setList(list);	
		return page;
	}


	/*
	 * 添加图书
	 * 
	 * 
	 */
	@Override
	public void addBook(StorePersonal book) {
		//		String sql = "insert into booklist(`ISBN`,`b_name`,`author`,`publisher`,`b_date`) values(?,?,?,?,?)";
		//		System.out.println(book.getISBN());
		//		this.update(sql, bookList.getISBN(),bookList.getB_name(),bookList.getAuthor(),bookList.getPublisher(),bookList.getB_date());
	}

	/*
	 * 
	 */
	@Override
	public void deleteBookByISBN(String ISBN) {
		String sql = "delete from booklist where `ISBN` = ?";
		this.update(sql, ISBN);
	}



	/**
	 * 根据ISBN设置书的state
	 * 
	 */
	@Override
	public void setBookState(StorePersonal book, String state, String ISBN) {
		String sql = "update storepersonal set state=? where `ISBN` = ?";
		this.update(sql,state,ISBN);
	}


	/**
	 * 上架图书
	 * 
	 * 
	 */
	public void addstorePersonalDao(StorePersonal storePersonal) {
		String sql = "insert into storepersonal values(null,?,?,?,?,?,?)";
		this.update(sql,storePersonal.getPrice(),
				storePersonal.getDegree(),
				storePersonal.getDes(),
				"待审核",
				storePersonal.getBookList().getISBN(),
				storePersonal.getClient().getC_id()
				);
	}



	@Override
	public Page<StorePersonal> getBooksForClientInPage(Page<StorePersonal> page, String c_id) {
		String sql = "SELECT count(1) "
				+ "FROM booklist,storepersonal "
				+ "where booklist.ISBN = storepersonal.ISBN "
				+ "and state = '待售' "
				+ "and c_id = ?";
		Object tempTotalRecord = this.getSingeValue(sql, c_id);
		int totalRecord = Integer.parseInt(tempTotalRecord + "");//将int类型的totalRecord转换为String类型
		page.setTotalRecord(totalRecord);//为totalRecord赋值
		System.out.println(" 总页数" + page.getTotalPageNo());

		/*
		 * limit不能从负数开始
		 * 那么如果getPageNo得到的是0，那么indexFrom（limit的第一个参数）就变成-4了
		 * 这样sql会报错，所以默认给他limit（0,4）
		 * 
		 */
		int indexFrom = (page.getPageNo()-1)*Page.PAGE_SIZE;//起始页，即从该条记录开始显示
		if(indexFrom<0) {
			indexFrom = 0;
		}

		sql = "select * "
				+ "from booklist,storepersonal "
				+ "where booklist.ISBN = storepersonal.ISBN "
				+ "and state = '待售' "
				+ "and c_id = ? "
				+ "LIMIT ?,?;";
		List<StorePersonal> list = this.getBeanList(sql, c_id, indexFrom, Page.PAGE_SIZE);
		/*
		 * 将list放到page中
		 * 此时的list里放的是book信息
		 * 但此时的book只有c_id和ISBN
		 * book的client、booklist对象都还没有赋值
		 */
		page.setList(list);	
		System.out.println("================== test over!!");
		return page;
	}

	@Override
	public  List<StorePersonal>  getBookDetail(String ISBN){
		String sql="select * from client join storepersonal where client.c_id=storepersonal.c_id and storepersonal.state='待售' and storepersonal.ISBN='"+ISBN+"'";
		System.out.println(sql);
		System.out.println("OO"+this.getBeanList(sql));
		return this.getBeanList(sql);
	}


	@Override
	public List<StorePersonal> getAllUnsetBooks(){
		String sql="select * from `storepersonal` where state='待审核'";
		return this.getBeanList(sql);
	}


	@Override
	public void changeBookState(String p_id,String state) {
		String sql="update storepersonal set state='"+state+"'where p_id='"+p_id+"'";
		System.out.println(sql);
		this.update(sql);
	}


	@Override
	public List<StorePersonal> getStorePersonalbyC_id(String c_id) {
		String sql="select * from storepersonal where c_id='"+c_id+"';";
		if("admin".equals(c_id)) {
			sql = "select * from storepersonal";
		}
		System.out.println(sql);
		return this.getBeanList(sql);
	}

	@Override
	public void deleteStorePersonal(String p_id) {
		String sql="delete from storepersonal where p_id ='"+p_id+"';";
		System.out.println(sql);
		this.update(sql);
	}
	
	
	@Override
	public void chageState(String p_id,String price,String des,String degree){
		String sql="update storepersonal set state='待审核' ,  price='"+price+ "' , des='"+des+"', degree='"+degree+"' where p_id='"+p_id+"' ";
		System.out.println(sql);
		this.update(sql);
	}



}
