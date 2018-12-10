package data.entities;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.springframework.beans.factory.annotation.Autowired;

import data.services.UserService;

@Entity
@Table (name = "reviews")
public class Review {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ReviewID")
	private long reviewId;

	@Column(name = "ReviewText")
	@NotEmpty(message = "Пожалуйста, оставьте свой отзыв")
	private String  reviewText;

	@Column(name = "BookID")
	private long bookId;

	@Column(name = "Positive")
	private boolean positive;

	@Column(name = "Permitted")
	private boolean permitted;

	/*@Column(name = "UserID")
	private long userId;*/
	
	@ManyToOne
	@JoinColumn(name = "UserID")
	private User user;

	@Column(name = "ReviewDate")
	private String reviewDate;
	
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public long getReviewId() {
		return reviewId;
	}

	public void setReviewId(long reviewId) {
		this.reviewId = reviewId;
	}

	public String getReviewText() {
		return reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public long getBookId() {
		return bookId;
	}

	public void setBookId(long bookId) {
		this.bookId = bookId;
	}

	public boolean isPositive() {
		return positive;
	}

	public void setPositive(boolean positive) {
		this.positive = positive;
	}

	public boolean isPermitted() {
		return permitted;
	}

	public void setPermitted(boolean permitted) {
		this.permitted = permitted;
	}

	/*public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}*/

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	

	public Review(long reviewId, @NotEmpty(message = "Пожалуйста, оставьте свой отзыв") String reviewText, long bookId,
			boolean positive, boolean permitted, User user, String reviewDate) {
		super();
		this.reviewId = reviewId;
		this.reviewText = reviewText;
		this.bookId = bookId;
		this.positive = positive;
		this.permitted = permitted;
		this.user = user;
		this.reviewDate = reviewDate;
	}

	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", reviewText=" + reviewText + ", bookId=" + bookId + ", positive="
				+ positive + ", permitted=" + permitted + ", user=" + user + ", reviewDate=" + reviewDate + "]";
	}

	public String createDate() {
		Date dateOfCreation = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("dd.MM.yyyy");
		return ft.format(dateOfCreation);
	}
	
	
	
}
