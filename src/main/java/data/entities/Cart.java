package data.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name ="carts")
public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column( name = "cartid")
	private long cartId;
	
	@Column( name = "userid")
	private long userId;
	
	@Column( name = "totalitems")
	private int totalItems;
	
	@Column( name = "totalsum")
	private double totalSum;
	
	@Column( name = "books")
	private String books;

	public long getCartId() {
		return cartId;
	}

	public void setCartId(long cartId) {
		this.cartId = cartId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	public double getTotalSum() {
		return totalSum;
	}

	public void setTotalSum(double totalSum) {
		this.totalSum = totalSum;
	}

	public String getBooks() {
		return books;
	}

	public void setBooks(String books) {
		this.books = books;
	}

	public Cart(long userId, int totalItems, double totalSum, String books) {
		super();
		this.userId = userId;
		this.totalItems = totalItems;
		this.totalSum = totalSum;
		this.books = books;
	}

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", userId=" + userId + ", totalItems=" + totalItems + ", totalSum=" + totalSum
				+ ", books=" + books + "]";
	}
	
	
	
}
