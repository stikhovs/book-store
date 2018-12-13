package data.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "book_store.main_slider_books")
public class MainSliderBooksEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "slideid")
	private long slideId;
	
	@OneToOne
	@JoinColumn(name="bookid")
	private Book book;
	
	@Column(name = "background_path")
	private String backgroundPath;
	
	@Column(name="title_color")
	private String titleColor;
	
	@Column(name="author_color")
	private String authorColor;

	public long getSlideId() {
		return slideId;
	}

	public void setSlideId(long slideId) {
		this.slideId = slideId;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public String getBackgroundPath() {
		return backgroundPath;
	}

	public void setBackgroundPath(String backgroundPath) {
		this.backgroundPath = backgroundPath;
	}
	
	public String getTitleColor() {
		return titleColor;
	}

	public void setTitleColor(String titleColor) {
		this.titleColor = titleColor;
	}

	public String getAuthorColor() {
		return authorColor;
	}

	public void setAuthorColor(String authorColor) {
		this.authorColor = authorColor;
	}

	

	public MainSliderBooksEntity(Book book, String backgroundPath, String titleColor,
			String authorColor) {
		super();
		this.book = book;
		this.backgroundPath = backgroundPath;
		this.titleColor = titleColor;
		this.authorColor = authorColor;
	}

	public MainSliderBooksEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "MainSliderBooksEntity [slideId=" + slideId + ", book=" + book + ", backgroundPath=" + backgroundPath
				+ ", titleColor=" + titleColor + ", authorColor=" + authorColor + "]";
	}
	
	
	
}
