package data.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "book_store.preorders")
public class Preorder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "preorderid")
	private long preorderId;

	@Column(name = "bookid")
	private long bookId;

	@Column(name = "userid")
	private long userId;

	@Column(name = "comment")
	@Pattern(regexp = ".{0,500}", message = "Максимальное кол-во символов: 500")
	private String comment;

	public long getPreorderId() {
		return preorderId;
	}

	public void setPreorderId(long preorderId) {
		this.preorderId = preorderId;
	}

	public long getBookId() {
		return bookId;
	}

	public void setBookId(long bookId) {
		this.bookId = bookId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Preorder(long bookId, long userId, String comment) {
		super();
		this.bookId = bookId;
		this.userId = userId;
		this.comment = comment;
	}

	public Preorder() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Preorder [preorderId=" + preorderId + ", bookId=" + bookId + ", userId=" + userId + ", comment="
				+ comment + "]";
	}
	
	
	
}
