package components;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class BookAddComponent {

	private String title;
	
	private String author;
	
	private String description;
	
	private boolean newArrival;
	
	private boolean bestseller;
	
	private String genreOne;
	
	private String genreTwo;
	
	private int pages;
	
	private String publisher;
	
	private int publishYear;
	
	private String coverType;
	
	private String isbn;
	
	private double price;
	
	private boolean preOrder;
		
	private MultipartFile bookCover;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isNewArrival() {
		return newArrival;
	}

	public void setNewArrival(boolean newArrival) {
		this.newArrival = newArrival;
	}

	public boolean isBestseller() {
		return bestseller;
	}

	public void setBestseller(boolean bestseller) {
		this.bestseller = bestseller;
	}

	public String getGenreOne() {
		return genreOne;
	}

	public void setGenreOne(String genreOne) {
		this.genreOne = genreOne;
	}

	public String getGenreTwo() {
		return genreTwo;
	}

	public void setGenreTwo(String genreTwo) {
		this.genreTwo = genreTwo;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPublishYear() {
		return publishYear;
	}

	public void setPublishYear(int publishYear) {
		this.publishYear = publishYear;
	}

	public String getCoverType() {
		return coverType;
	}

	public void setCoverType(String coverType) {
		this.coverType = coverType;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isPreOrder() {
		return preOrder;
	}

	public void setPreOrder(boolean preOrder) {
		this.preOrder = preOrder;
	}

	public MultipartFile getBookCover() {
		return bookCover;
	}

	public void setBookCover(MultipartFile bookCover) {
		this.bookCover = bookCover;
	}

	public BookAddComponent(String title, String author, String description, boolean newArrival, boolean bestseller,
			String genreOne, String genreTwo, int pages, String publisher, int publishYear, String coverType,
			String isbn, double price, boolean preOrder, MultipartFile bookCover) {
		super();
		this.title = title;
		this.author = author;
		this.description = description;
		this.newArrival = newArrival;
		this.bestseller = bestseller;
		this.genreOne = genreOne;
		this.genreTwo = genreTwo;
		this.pages = pages;
		this.publisher = publisher;
		this.publishYear = publishYear;
		this.coverType = coverType;
		this.isbn = isbn;
		this.price = price;
		this.preOrder = preOrder;
		this.bookCover = bookCover;
	}

	public BookAddComponent() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BookAddComponent [title=" + title + ", author=" + author + ", description=" + description
				+ ", newArrival=" + newArrival + ", bestseller=" + bestseller + ", genreOne=" + genreOne + ", genreTwo="
				+ genreTwo + ", pages=" + pages + ", publisher=" + publisher + ", publishYear=" + publishYear
				+ ", coverType=" + coverType + ", isbn=" + isbn + ", price=" + price + ", preOrder=" + preOrder
				+ ", bookCover=" + bookCover + "]";
	}
	
	
}
