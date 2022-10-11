package com.saad.group11.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/*
 * session钝化、活化  序列号对象
 * 需要实现Serializable接口
 */
public class Cart implements Serializable{
	private static final long serialVersionUID = 1L;

	private List<CartItem> cartItems = new ArrayList<CartItem>();//购物车项
	private int totalCount;//总数量
	private double totalPrice;//总价格


	/*
	 * 0.获取所有的购物车项（如果是用Map集合的话，不方便遍历，所以可以考虑写一个获取到List集合的方法）
	 * 1.加入购物车
	 * 2.删除购物车项
	 * 3.清空购物车
	 * 4.修改购物车项的数量
	 * 
	 * 5.根据ISBN获取购物车项
	 */


	/**
	 * 1.加入购物车
	 * 	本质：将book加入到cartItem中
	 * 	思路：判断购物车中是否加入过该book
	 * 		*买过，购买数量+1
	 * 		*没买过
	 * 			1.new CartItem
	 * 			2.setCount()&setBook()
	 * 			3.cartItems.add(cartItem);
	 * 
	 */
	public void addBookToCart(StorePersonal book) {
		/*
		 * ed1
		String indexBookISBN = book.getBookList().getISBN();
		System.out.println("=========test========= Cart  addBookToCart");
		System.out.println("将要加入购物车的书：" + book);
		for (CartItem cartItem : cartItems) {
			System.out.println("购物车里的书：" + cartItem.getBook());
			String CartItemISBN = cartItem.getBook().getBookList().getISBN();
			if(indexBookISBN !=null && indexBookISBN.equals(CartItemISBN)) {
				//如果已经在购物车里面了,数量+1
				System.out.println("Cart " + cartItem.getBook().getStock());
				int count = cartItem.getCount();
				cartItem.setCount(count+1);
				System.out.println("Cart " + cartItem.getBook().getStock());
				return;
			}
		}
		//如果没有return退出该函数，说明购物车没有这个ISBN的书，则新增购物车项
		cartItems.add(new CartItem(book));
		System.out.println("=========test over=========");
		 */
		String indexBookISBN = book.getBookList().getISBN();
		System.out.println("indexBookISBN" + indexBookISBN);
		CartItem cartItem = getCartItemByISBN(indexBookISBN);
		System.out.println(cartItem + "--------------------");
		if(cartItem!=null) {
			cartItem.getBook().add(book);
			return;
		}
		//如果没有return退出该函数，说明购物车没有这个ISBN的书，则新增购物车项
		cartItems.add(new CartItem(book));
	}

	/**
	 * 2.删除购物车项
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	public void deleteBookInCart(String ISBN) {
		//    遍历类型    临时变量     遍历的集合
		for (CartItem cartItem : cartItems) {

			if(cartItem.isExistByISBN(ISBN)) {
				System.out.println(cartItem);
				cartItems.remove(cartItem);
				break;
				/*
				 * break？
				 * 
				 * ConcurrentModificationException
				 * 并发异常 
					Concurrent   同时发生的
					Modification 修改
					Exception    例外情况 

				 * 我的猜测：可能是foreach循坏太快了，还来得及remove？
				 * 所以这里break一下，没想到真的就解决了
				 * 
				 * 而且删除购物项的时候，的确是一个一个删除的，删掉就break出循环，也是合情合理的
				 */
			}
		}
	}

	/**
	 * 3.清空购物车
	 * 
	 * 
	 */
	public void emptyCart() {
		cartItems.clear();
	}


	/**
	 * 4.修改购物项的数量
	 * 
	 */
	public void updateCartItemCount(String ISBN,String count) {
		//	    遍历类型    临时变量     遍历的集合
		for (CartItem cartItem : cartItems) {
			//实际的判断不只这么简单（p_id非空，count为非空数字等等），这里用前端的正则来处理试试
			if(cartItem.isExistByISBN(ISBN)) {
				try {
					cartItem.setCount(Integer.parseInt(count));
				}catch (NumberFormatException e){
					e.printStackTrace();
					System.out.println(":Cart +updateCartItemCount NumberFormatException");
				}
				break;
			}
		}
	}

	/**
	 * 5.根据ISBN获取购物车项
	 * 
	 * 
	 * 
	 */
	public CartItem getCartItemByISBN(String ISBN) {
		for (CartItem cartItem : cartItems) {

//			List<StorePersonal> book = cartItem.getBook();
//			for (StorePersonal storePersonal : book) {
//				System.out.println("getCartItemByISBN test!!" + storePersonal);
//			}

			System.out.println("tttttttttt");
			System.out.println(cartItem.getBook());

//			String cartItemISBN = "";
			System.out.println("tttttttttt");
			
			
//			if(cartItem.getBook().size()!=0) {
//				String cartItemISBN = cartItem.getBook().get(0).getBookList().getISBN();
//				if(cartItemISBN != null && cartItemISBN.equals(ISBN)){
//					return cartItem;
//				}
//			}
			
			String cartItemISBN = cartItem.getBook().get(0).getBookList().getISBN();
			if(cartItemISBN != null && cartItemISBN.equals(ISBN)){
				return cartItem;
			}
		}
		return null;
	}

	public boolean isExist(String p_id) {
		boolean flag = false;
		for (CartItem cartItem : cartItems) {
			for (StorePersonal book : cartItem.getBook()) {
				if(book.getP_id().equals(p_id)) {
					flag = true;
				}
			}
		}
		return flag;
	}

	public Cart() {
		super();
	}
	public Cart(List<CartItem> cartItems, int totalCount, double totalPrice) {
		super();
		this.cartItems = cartItems;
		this.totalCount = totalCount;
		this.totalPrice = totalPrice;
	}


	public List<CartItem> getCartItems() {
		return cartItems;
	}
	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	/**
	 * 计算购物车的项的数量
	 * 
	 * 
	 * 
	 * @return
	 */
	public int getTotalCount() {		
		int totalCount = 0;
		for (CartItem cartItem : cartItems) {
			totalCount += cartItem.getCount();
		}
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * 计算购物车总金额
	 * 
	 * 
	 * 
	 * @return
	 */
	public double getTotalPrice() {
		BigDecimal totalPrice = new BigDecimal("0");
		//		double totalPrice = 0.0;

		for (CartItem cartItem : cartItems) {
			BigDecimal price = new BigDecimal(cartItem.getPrice()+"");
			totalPrice = totalPrice.add(price);
		}
		return totalPrice.doubleValue();
	}



	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Cart [cartItems=" + cartItems + ", totalCount=" + totalCount + ", totalPrice=" + totalPrice + "]";
	}









}
