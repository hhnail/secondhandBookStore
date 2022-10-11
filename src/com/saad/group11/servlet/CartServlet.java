package com.saad.group11.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saad.group11.bean.BookList;
import com.saad.group11.bean.Cart;
import com.saad.group11.bean.CartItem;
import com.saad.group11.bean.Client;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.service.BookListService;
import com.saad.group11.service.BookService;
import com.saad.group11.service.impl.BookListServiceImpl;
import com.saad.group11.service.impl.BookServiceImpl;

public class CartServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private BookService bookService = new BookServiceImpl();
	private BookListService bookListService = new BookListServiceImpl();




	/**
	 * 删除整个购物项
	 * 
	 * 
	 * 
	 */
	protected void deleteBookInCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		//取值bookId（p_id)
		String ISBN = request.getParameter("ISBN");

		//		System.out.println("CartServlet bookId:"+bookId);

		//调用Cart
		Cart cart = (Cart)session.getAttribute("cart");//前面add方法里把cart放到了session域中
		if(cart != null) {
			cart.deleteBookInCart(ISBN);
		}

		//跳转
		response.sendRedirect(request.getContextPath() + "/pages/cart/cart.jsp");

	}


	/**
	 * 清空购物车
	 * 
	 * 
	 * 
	 * 
	 */
	protected void empytCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");//前面add方法里把cart放到了session域中

		//调用Cart清空集合
		if(cart != null) {
			cart.emptyCart();
		}

		//		--把清空后的购物车放到session域中 
		//		× 这一步不用做，因为前面就拿到了session，然后直接就对session进行修改

		//跳转
		response.sendRedirect(request.getContextPath() + "/pages/cart/cart.jsp");
		//		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}


	/**
	 * 修改购物项的数量
	 * 
	 * 
	 */
	protected void updateCartItemCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//取值（bookId、count
		String bookId = request.getParameter("bookId");
		String count = request.getParameter("count");

		//调用Cart
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");//前面add方法里把cart放到了session域中

		//调用Cart清空集合
		if(cart != null) {
			cart.updateCartItemCount(bookId, count);;
		}


		//跳转
		response.sendRedirect(request.getContextPath() + "/pages/cart/cart.jsp");


	}


	/**
	 * 从书目详情页
	 * 添加book到购物车
	 * 
	 * 
	 */
	protected void addBookFromListToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.取值
		HttpSession session = request.getSession();
		String ISBN = request.getParameter("ISBN1");
		
		System.out.println("Cart addBookFromListToCart ISBN:" + ISBN);

		//		BookList detailBookList = bookListService.getBookListByISBN(ISBN);


		BookList detailBookList = bookListService.getBookListByISBN(ISBN);
		BookList List_detail=bookListService.getBookDetail(detailBookList ,ISBN);
		BookList List_Own=bookListService.getBookOwnFinal(detailBookList ,ISBN);


		request.setAttribute("detailBookList", detailBookList);

		//1.取值
		String[] bookId = request.getParameterValues("choiceBook");
		if(bookId!=null) {
			for (int i = 0; i < bookId.length; i++) {
				System.out.println(bookId[i]);

				//2.通过bookId获取Book（通过调用BookService中的方法）
				StorePersonal book = bookService.getBookById(bookId[i]);

				//3.调用Cart中的addBookToCart（注意：是Cart中的addBookToCart）
				//Cart存放到session域中
				Cart cart = (Cart)session.getAttribute("cart");
				if(cart == null) {
					cart = new Cart();
					session.setAttribute("cart", cart);
				}
//				cart.addBookToCart(book);
				
				if(!cart.isExist(bookId[i])) {
					cart.addBookToCart(book);
				}else {
					request.setAttribute("msg", "商品已在购物车内！");
				}
			}
		}
		request.getRequestDispatcher("/pages/user/detailPage.jsp").forward(request, response);
	}
	/**
	 * 添加book到购物车
	 * 
	 * 
	 * 
	 */
	protected void addBookToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//1.取值
		String bookId = request.getParameter("bookId");
		//2.通过bookId获取Book（通过调用BookService中的方法）
		StorePersonal book = bookService.getBookById(bookId);
		String ISBN = book.getISBN();

		//3.调用Cart中的addBookToCart（注意：是Cart中的addBookToCart）
		//Cart存放到session域中
		Cart cart = (Cart)session.getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		
		System.out.println("=================book"+book);
		cart.addBookToCart(book);

		//test1
		List<CartItem> cartItems = cart.getCartItems();
		for (CartItem cartItem : cartItems) {
			List<StorePersonal> book2 = cartItem.getBook();
			for (StorePersonal bookInItem : book2) {
				System.out.println(bookInItem);
			}
		}

		//4.验证库存
		CartItem bookInCart = cart.getCartItemByISBN(ISBN);

		int stock = book.getStock();//获取系统内该书的库存
		int count = bookInCart.getCount();
		if(count > stock) {
			session.setAttribute("msg", "库存不足！该书在您的购物车中已达系统最大库存");
			//将购买商品的数量，设置为最大库存
			bookInCart.setCount(stock);
		}else {
			//将书名存放到session域中
			/* 这一步是拿来做el判断的
			 * 如果是空，则不输出提示信息；否则输出“刚刚将XX加入购物车”
			 * 
			 */
			session.setAttribute("b_name", book.getBookList().getB_name());
		}


		//5.获取Referer，用于跳转
		//Referer：上一个页面的url，携带method和pageNo等参数
		String url = request.getHeader("Referer");
		response.sendRedirect(url);
		/*
		 * 这里如果要用Referer获取上一个页面的地址栏信息url
		 * 就不能用转发，而只能用重定向，
		 * 因为转发的根目录是当前项目，转发是基于当前路径的
		 */
	}
	
	protected void deleteBookInCartItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.取值
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		String p_id = request.getParameter("p_id");
		
		List<CartItem> cartItems = cart.getCartItems();
		for (CartItem cartItem : cartItems) {
			List<StorePersonal> books = cartItem.getBook();
			for (StorePersonal book : books) {
				if(p_id!=null && p_id.equals(book.getP_id())) {
					books.remove(book);
					break;
				}
			}
		}
		
		//跳转
		request.getRequestDispatcher("pages/cart/cart.jsp").forward(request, response);
		
		
		
	}
		
	


}
