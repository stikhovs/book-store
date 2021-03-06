package data.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "book_store.books")
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "book_id")
	private long bookId;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "author")
	private String author;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "isnewarrival")
	private boolean newArrival;
	
	@Column(name = "isbestseller")
	private boolean bestseller;
	
	@Column(name = "genre_one")
	private String genreOne;
	
	@Column(name = "genre_two")
	private String genreTwo;
	
	@Column(name = "pages")
	private int pages;
	
	@Column(name = "publisher")
	private String publisher;
	
	@Column(name = "publish_year")
	private int publishYear;
	
	@Column(name = "cover_type")
	private String coverType;
	
	@Column(name = "isbn")
	private String isbn;
	
	@Column(name = "price")
	private double price;
	
	@Column(name = "preorder")
	private boolean preOrder;
	
	@Column(name = "coverpath")
	private String coverPath;
	
	
	public long getBookId() {
		return bookId;
	}

	public void setBookId(long bookId) {
		this.bookId = bookId;
	}

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
	
	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(String title, String author, String description, boolean newArrival, boolean bestseller,
			String genreOne, String genreTwo, int pages, String publisher, int publishYear, String coverType,
			String isbn, double price, boolean preOrder, String coverPath) {
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
		this.coverPath = coverPath;
	}

	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", title=" + title + ", author=" + author + ", description=" + description
				+ ", newArrival=" + newArrival + ", bestseller=" + bestseller + ", genreOne=" + genreOne + ", genreTwo="
				+ genreTwo + ", pages=" + pages + ", publisher=" + publisher + ", publishYear=" + publishYear
				+ ", coverType=" + coverType + ", isbn=" + isbn + ", price=" + price + ", preOrder=" + preOrder
				+ ", coverPath=" + coverPath + "]";
	}
	
	
	
}
