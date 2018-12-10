package components;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import data.entities.Book;
import data.services.BookService;

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CurrentUserComponent {

	@Autowired
	BookService bookService;
	
	private boolean anonymUser = true;
	
	private long userId;
	
	private int totalItemsInCart = 0;
	
	private double totalSum = 0D;
	
	private String booksInCart = "";
	
	private List<Book> booksInCartList = new LinkedList<>();
	
	public List<Book> getBooksInCartList() {
		return booksInCartList;
	}

	public void setBooksInCartList(List<Book> booksInCartList) {
		this.booksInCartList = booksInCartList;
	}

	public boolean isAnonymUser() {
		return anonymUser;
	}

	public void setAnonymUser(boolean anonymUser) {
		this.anonymUser = anonymUser;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public int getTotalItemsInCart() {
		return totalItemsInCart;
	}

	public void setTotalItemsInCart(int totalItemsInCart) {
		this.totalItemsInCart = totalItemsInCart;
	}

	public double getTotalSum() {
		return totalSum;
	}

	public void setTotalSum(double totalSum) {
		this.totalSum = totalSum;
	}

	public String getBooksInCart() {
		return booksInCart;
	}

	public void setBooksInCart(String booksInCart) {
		this.booksInCart = booksInCart;
	}

	
	public CurrentUserComponent(boolean anonymUser, long userId, int totalItemsInCart, double totalSum,
			String booksInCart, List<Book> booksInCartList) {
		super();
		this.anonymUser = anonymUser;
		this.userId = userId;
		this.totalItemsInCart = totalItemsInCart;
		this.totalSum = totalSum;
		this.booksInCart = booksInCart;
		this.booksInCartList = booksInCartList;
	}

	public CurrentUserComponent() {
		super();
	}

	@Override
	public String toString() {
		return "CurrentUserComponent [anonymUser=" + anonymUser + ", userId=" + userId + ", totalItemsInCart="
				+ totalItemsInCart + ", totalSum=" + totalSum + ", booksInCart=" + booksInCart + ", booksInCartList="
				+ booksInCartList + "]";
	}
	
	
	
	public List<Book> parseBooksToList() {
		List<Book> booksInCartList = new LinkedList<>();
		for(String bookId : this.booksInCart.split("ID")) {
			if(!bookId.equals("")) {
				booksInCartList.add(bookService.getBookById(Long.parseLong(bookId)));
			}
		}
		this.setBooksInCartList(booksInCartList);
		return booksInCartList;
	}
	
	
	public void changeCurrentUserCart(List<Book> booksInCartList) {
		
		this.totalItemsInCart = 0;		
		this.totalSum = 0D;		
		this.booksInCart = "";
		
		for(Book book : booksInCartList) {
			this.totalItemsInCart++;
			this.totalSum += book.getPrice();
			this.booksInCart += "ID"+book.getBookId();
		}
		
	}
	
}
