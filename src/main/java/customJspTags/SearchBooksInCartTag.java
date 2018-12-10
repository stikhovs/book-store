package customJspTags;


import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import data.entities.Book;

public class SearchBooksInCartTag extends SimpleTagSupport {
	
	private long bookId;
	
	private List<Book> booksInCart;
	
	private String trueString = "";
	
	private String falseString = "";
	
	public long getBookId() {
		return bookId;
	}

	public String getTrueString() {
		return trueString;
	}

	public void setTrueString(String trueString) {
		this.trueString = trueString;
	}

	public String getFalseString() {
		return falseString;
	}

	public void setFalseString(String falseString) {
		this.falseString = falseString;
	}

	public void setBookId(long bookId) {
		this.bookId = bookId;
	}

	public List<Book> getBooksInCart() {
		return booksInCart;
	}

	public void setBooksInCart(List<Book> booksInCart) {
		this.booksInCart = booksInCart;
	}
	
	public SearchBooksInCartTag() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void doTag() throws JspException, IOException {		
		try {
						
			if(booksInCart != null && booksInCart.size() > 0) {
				for(Book bookInCart : booksInCart) {
					if(bookInCart.getBookId() == bookId) {
						getJspContext().getOut().print(trueString);
						return;
					}
				}
			}
			getJspContext().getOut().print(falseString);	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
