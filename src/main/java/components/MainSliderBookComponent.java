package components;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import data.entities.Book;

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MainSliderBookComponent {

	private Book book;
	
	private MultipartFile bookBackground;
	
	private String titleColor;
	
	private String authorColor;

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public MultipartFile getBookBackground() {
		return bookBackground;
	}

	public void setBookBackground(MultipartFile bookBackground) {
		this.bookBackground = bookBackground;
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

	
	
	public MainSliderBookComponent(Book book, MultipartFile bookBackground, String titleColor, String authorColor) {
		super();
		this.book = book;
		this.bookBackground = bookBackground;
		this.titleColor = titleColor;
		this.authorColor = authorColor;
	}

	public MainSliderBookComponent() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "MainSliderBookComponent [book=" + book + ", bookBackground=" + bookBackground + ", titleColor="
				+ titleColor + ", authorColor=" + authorColor + "]";
	}
	
	
	public String getDateOfCreation() {
		return String.valueOf(new Date().getTime());
	}
	
}
