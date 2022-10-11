package com.saad.group11.service.impl;

import java.util.List;

import com.saad.group11.bean.BookList;
import com.saad.group11.bean.Client;
import com.saad.group11.bean.Page;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.dao.BookDao;
import com.saad.group11.dao.BookListDao;
import com.saad.group11.dao.ClientDao;
import com.saad.group11.dao.impl.BookDaoImpl;
import com.saad.group11.dao.impl.BookListDaoImpl;
import com.saad.group11.dao.impl.ClientDaoImpl;
import com.saad.group11.service.BookService;

public class BookServiceImpl implements BookService {
	BookDao bookDao = new BookDaoImpl();
	BookListDao bookListDao = new BookListDaoImpl();
	ClientDao clientDao = new ClientDaoImpl();


	/**
	 * 获取所有书
	 * 
	 * 
	 */
	@Override
	public List<StorePersonal> getAllBooks() {
		//1.调用dao层获取“数据库”books
		List<StorePersonal> books = bookDao.getAllBooks();

		//2.为book设置bookList
		for (StorePersonal book : books) {
			String ISBN = book.getISBN();
			book.setBookList(bookListDao.getBookListByISBN(ISBN));
		}

		//3.返回带bookList的book
		return books;
	}

	/**
	 * 获取所有书
	 * 
	 * 
	 */
	@Override
	public Page<StorePersonal> getAllBooksInPage(String pageNo) {
		Page<StorePersonal> pageTemp = new Page<StorePersonal>();
		//		System.out.println("=========test========= BookServiceImpl  getAllBooksInPage");

		//处理pageNo、min_price_end、max_price_end的问题
		int defaultPageNo = 1;

		//如果没输pageNo，取默认值
		if(pageNo!=null) {
			//如果pageNo非空，即输入了pageNo。
			try {
				defaultPageNo = Integer.parseInt(pageNo);
			} catch (Exception e) {
				System.out.println("BookServiceImpl getAllBooksInPage pageNo类型转换异常");
			}

		}

		//为page设置当前页面属性
		pageTemp.setPageNo(defaultPageNo);//page只有一个“当前页面”属性
		//		System.out.println("pageTemp pageNo:" + pageTemp.getPageNo());


		Page<StorePersonal> page = bookDao.getBooksInPage(pageTemp);//调用dao层，在service层处理，避免dao层互调
		//从包装page中，得到list集合，此时list中的信息是book，但是他们只有外码，还拿不到外码对应的对象的信息
		List<StorePersonal> list = page.getList();
		//为每一个book set client和booklist
		for (StorePersonal book : list) {
			BookList bookList = bookListDao.getBookListByISBN(book.getISBN());
			Client client = clientDao.getClientById(book.getC_id());
			book.setBookList(bookList);
			book.setClient(client);
			//			System.out.println("" + book.getPrice());;
		}
		//		System.out.println("lasted pageNo:" + page.getPageNo());
		//		System.out.println("===================  test over!!");
		//将最后的、完整的list set 到 page中
		page.setList(list);
		return page;
	}

	/**
	 * 根据客户id获取客户个人的书
	 * 
	 */
	@Override
	public Page<StorePersonal> getAllBooksInPage(String pageNo, String c_id) {
		Page<StorePersonal> pageTemp = new Page<StorePersonal>();
		System.out.println("=========test========= BookServiceImpl  getAllBooksInPage");
		//处理pageNo、min_price_end、max_price_end的问题
		int defaultPageNo = 1;
		//如果没输pageNo，取默认值
		if(pageNo!=null) {
			//如果pageNo非空，即输入了pageNo。
			try {
				defaultPageNo = Integer.parseInt(pageNo);
			} catch (Exception e) {
				System.out.println("BookServiceImpl getAllBooksInPage pageNo类型转换异常");
			}
		}

		//为page设置当前页面属性
		pageTemp.setPageNo(defaultPageNo);//page只有一个“当前页面”属性
		//		System.out.println("pageTemp pageNo:" + pageTemp.getPageNo());

		Page<StorePersonal> page = bookDao.getBooksInPage(pageTemp);//调用dao层，在service层处理，避免dao层互调
		List<StorePersonal> list = page.getList();

		//为每一个book set client和booklist
		for (StorePersonal book : list) {
			BookList bookList = bookListDao.getBookListByISBN(book.getISBN());
			Client client = clientDao.getClientById(book.getC_id());
			book.setBookList(bookList);
			book.setClient(client);
		}
		System.out.println("===================  test over!!");
		//将最后的、完整的list set 到 page中
		page.setList(list);
		return page;
	}

	/**
	 * 获取该书库存（包括所有商家）
	 * 
	 * 
	 */
	@Override
	public int getStock(String ISBN) {
		return bookDao.getStock(ISBN);
	}


	@Override
	public Page<StorePersonal> getBooksInPage(String pageNo) {
		Page<StorePersonal> page = new Page<StorePersonal>();
		int defaultPageNo = 1;
		try {
			defaultPageNo = Integer.parseInt(pageNo);
		} catch (NumberFormatException e) {
		}
		page.setPageNo(defaultPageNo);//目前为止，page只有一个“当前页面”属性
		return bookDao.getBooksInPage(page);
	}




	/*
	 * 
	 * 
	 */
	@Override
	public StorePersonal getBookById(String bookId) {
		//		System.out.println("=================== test getBookById【in BookServiceImpl】");

		//此时的书没有booklist和client
		StorePersonal book = bookDao.getBookById(bookId);

		//通过book的ISBN获取booklist并set
		String ISBN = book.getISBN();
		BookList bookList = bookListDao.getBookListByISBN(ISBN);
		book.setBookList(bookList);
		//		System.out.println(bookList);

		//通过c_id获取client并set
		String c_id = book.getC_id();
		Client client = clientDao.getClientById(c_id);
		book.setClient(client);

		System.out.println("BookServiceImpl client" + client);

		//		System.out.println("=================== test over【in BookServiceImpl】");
		return book;	
	}




	/*
	 * 带价格区间 查询book信息
	 * 改进后，非dao层互相调用，而是在service层处理业务逻辑
	 * 
	 */
	@Override
	public Page<StorePersonal> getBooksInPageByPrice(String pageNo, String min_price, String max_price) {
		Page<StorePersonal> pageTemp = new Page<StorePersonal>();
		System.out.println("=========test========= BookServiceImpl  getBooksInPageByPrice");

		//处理pageNo、min_price_end、max_price_end的问题
		int defaultPageNo = 1;
		double min_price_end = 0.0;
		double max_price_end = Double.MAX_VALUE;

		//如果没输pageNo，取默认值
		if(pageNo!=null) {
			//如果pageNo非空，即输入了pageNo。
			try {
				defaultPageNo = Integer.parseInt(pageNo);
			} catch (Exception e) {
				System.out.println("BookServiceImpl getBooksInPageByPrice pageNo类型转换异常");
			}

			//如果价格区间有null，则取默认值
			if(min_price!=null || max_price!=null) {
				//如果输入了价格区间，则转换为Double类型
				try {
					min_price_end = Double.parseDouble(min_price);
					max_price_end = Double.parseDouble(max_price);
				} catch (Exception e) {
					System.out.println("BookServiceImpl getBooksInPageByPrice 价格区间类型转换异常");
				}
			}

		}

		//		System.out.println("defaultPageNo:" + defaultPageNo);
		//		System.out.println("defaultPageNo:" + defaultPageNo);

		//为page设置当前页面属性
		pageTemp.setPageNo(defaultPageNo);//page只有一个“当前页面”属性
		//		System.out.println("pageTemp pageNo:" + pageTemp.getPageNo());

		//处理min_price_end和max_price_end 确保min<=max
		double temp = 0.0;
		if(min_price_end > max_price_end) {
			temp = min_price_end;
			min_price_end = max_price_end;
			max_price_end = temp;
		}

		//调用bookDao层，获取书本集合（包装成page）后返回
		//		System.out.println("min_price_end:" + min_price_end);
		//		System.out.println("max_price_end:" + max_price_end);
		//		System.out.println("pageTemp.pageNo：" + pageTemp.getPageNo());
		Page<StorePersonal> page = bookDao.getBooksInPageByPrice(pageTemp, min_price_end, max_price_end);//调用dao层，在service层处理，避免dao层互调
		//		System.out.println("page.totalPageNo：" + pageTemp.getTotalPageNo());
		//		System.out.println("page.pageNo：" + page.getPageNo());
		//		System.out.println("=== test over！！【in BookServiceImpl】");
		//从包装page中，得到list集合，此时list中的信息是book，但是他们只有外码，还拿不到外码对应的对象的信息
		List<StorePersonal> list = page.getList();
		//为每一个book set client和booklist
		for (StorePersonal book : list) {
			BookList bookList = bookListDao.getBookListByISBN(book.getISBN());
			Client client = clientDao.getClientById(book.getC_id());
			book.setBookList(bookList);
			book.setClient(client);
			//			System.out.println("" + book.getPrice());;
		}
		//		System.out.println("lasted pageNo:" + page.getPageNo());
		System.out.println("===================  test over!!");
		//将最后的、完整的list set 到 page中
		page.setList(list);
		return page;
	}



	/**
	 * 添加书目
	 * 
	 * 
	 */
	@Override
	public void addBook(StorePersonal book) {
		bookDao.addBook(book);		
	}

	/*
	 * 根据ISBN编号删除书目信息
	 * 
	 * 
	 */
	@Override
	public void deleteBookByISBN(String ISBN) {
		bookDao.deleteBookByISBN(ISBN);		

	}


	/**
	 * 
	 * 
	 * 
	 */
	@Override
	public void setBookState(StorePersonal book, String state, String ISBN) {
		bookDao.setBookState(book, state, ISBN);;
	}



	@Override
	public void updateBook(StorePersonal book, String oldISBN) {
		// TODO 自动生成的方法存根

	}

	/**
	 * 
	 * 
	 */
	@Override
	public void addStorePersonal(StorePersonal storePersonal) {
		bookDao.addstorePersonalDao(storePersonal);
	}



	@Override
	public Page<StorePersonal> getBooksForClientInPage(String pageNo, String c_id) {
		Page<StorePersonal> pageTemp = new Page<StorePersonal>();
		//		System.out.println("=========test========= BookServiceImpl  getBooksForClientInPage");

		//处理pageNo、min_price_end、max_price_end的问题
		int defaultPageNo = 1;

		//如果没输pageNo，取默认值
		if(pageNo!=null) {
			//如果pageNo非空，即输入了pageNo。
			try {
				defaultPageNo = Integer.parseInt(pageNo);
			} catch (Exception e) {
				//				System.out.println("BookServiceImpl getBooksForClientInPage pageNo类型转换异常");
			}
		}

		//为page设置当前页面属性
		pageTemp.setPageNo(defaultPageNo);//page只有一个“当前页面”属性
		Page<StorePersonal> page = bookDao.getBooksForClientInPage(pageTemp, c_id);//调用dao层，在service层处理，避免dao层互调
		List<StorePersonal> list = page.getList();
		//为每一个book set client和booklist
		for (StorePersonal book : list) {
			BookList bookList = bookListDao.getBookListByISBN(book.getISBN());
			Client client = clientDao.getClientById(book.getC_id());
			book.setBookList(bookList);
			book.setClient(client);
		}
		//		System.out.println("===================  test over!!");
		//将最后的、完整的list set 到 page中
		page.setList(list);
		return page;
	}




	@Override
	public List<StorePersonal> getAllUnsetBooks() {
		return bookDao.getAllUnsetBooks();
	}

	@Override
	public void changeBookState(String p_id,String state) {
		bookDao.changeBookState(p_id,state);
	}

	@Override
	public List<StorePersonal> getStorePersonalbyC_id(String c_id){
		return bookDao.getStorePersonalbyC_id(c_id);
	}


	@Override
	public void deleteStorePersonal(String p_id) {
		bookDao.deleteStorePersonal(p_id);
	}

	
	@Override
	public void chageState(String p_id,String price,String des,String degree){
		bookDao.chageState(p_id,price,des,degree);
	}




}
