package data.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "book_store.orders")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OrderID")
	private long orderId;

	@Column(name = "UserID")
	private long userId;

	@Column(name = "UserName")
	@NotEmpty(message = "Имя не может быть пустым")
	@Pattern(regexp = "[\\D]+", message = "Поле должно содержать только буквы")
	private String userName;

	@Column(name = "UserPhone")
	@NotEmpty(message = "Пожалуйста, укажите свой номер телефона")
	@Pattern(regexp = "^((8|\\+7)[\\- ]?)?(\\(?\\d{3}\\)?[\\- ]?)?[\\d\\- ]{7,10}$", message = "Пожалуйста, введите номер в верном формате")
	private String userPhone;

	@Column(name = "UserEmail")
	@NotEmpty(message = "Пожалуйста, укажите свой email")
	@Email(message = "Пожалуйста, укажите email в правильном формате")
	private String userEmail;

	@Column(name = "CartID")
	private long cartId;

	@Column(name = "isFinished")
	private boolean finished;

	@Column(name = "Address")
	@NotEmpty(message = "Пожалуйста, укажите адрес доставки")
	private String address;

	@Column(name = "books")
	private String books;

	@Column(name = "date")
	private String date;

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getCartId() {
		return cartId;
	}

	public void setCartId(long cartId) {
		this.cartId = cartId;
	}

	public boolean isFinished() {
		return finished;
	}

	public void setFinished(boolean finished) {
		this.finished = finished;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getBooks() {
		return books;
	}

	public void setBooks(String books) {
		this.books = books;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(long orderId, long userId, String userName, String userPhone, String userEmail, long cartId,
			boolean finished, String address, String books, String date) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.cartId = cartId;
		this.finished = finished;
		this.address = address;
		this.books = books;
		this.date = date;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", userName=" + userName + ", userPhone="
				+ userPhone + ", userEmail=" + userEmail + ", cartId=" + cartId + ", finished=" + finished
				+ ", address=" + address + ", books=" + books + ", date=" + date + "]";
	}

}
