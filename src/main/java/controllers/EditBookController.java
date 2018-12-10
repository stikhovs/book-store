package controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import components.BookEditComponent;
import components.FileBucketComponent;
import data.entities.Book;
import data.repositories.BookRepository;
import data.services.BookService;

@Controller
@PropertySource("classpath:img.properties")
public class EditBookController {

	@Autowired
	BookService bookService;
	
	@Autowired
	FileBucketComponent myFile;
	
	@Resource
	Environment env;
	
	@Autowired
	BookEditComponent bookEditComponent;
	
	@Autowired
	BookRepository bookRepository;
	
	
	@GetMapping("/catalog/{id}/book-edit")
	public String editBook(Model model, @PathVariable("id") long bookId) {
		
		Book book = bookService.getBookById(bookId);
		
		bookEditComponent.setBookCover(null);
		bookEditComponent.setBookId(bookId);
		bookEditComponent.setIsbn(book.getIsbn());
		bookEditComponent.setTitle(book.getTitle());
		
		model.addAttribute("book", bookEditComponent);
		
		return "book-edit";
	}
	
	@PostMapping("/catalog/book-edit")
	public String editBook(@ModelAttribute("book") BookEditComponent book, HttpServletRequest request) throws IOException {
		
		
		book.setBookId(bookEditComponent.getBookId());
		book.setIsbn(bookEditComponent.getIsbn());
		
		MultipartFile bookCover = book.getBookCover();
		
		String uploadRootPath = Paths.get(request.getServletContext().getRealPath(env.getProperty("img.rootPath"))).getParent().getParent() + env.getProperty("img.book.upload") + File.separator + book.getIsbn();
		File uploadRootDir = new File(uploadRootPath);// Create directory if it not exists.
		if (!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}
		
		FileCopyUtils.copy(bookCover.getBytes(),
				new File(uploadRootDir.getAbsolutePath() + File.separator +  bookCover.getOriginalFilename()));
		
		Book realBook = bookService.getBookById(book.getBookId());
		realBook.setCoverPath(book.getIsbn() + File.separator + bookCover.getOriginalFilename());
		
		System.out.println(realBook);
		
		bookRepository.saveAndFlush(realBook);
		
		return "redirect:/catalog/" + book.getBookId();
	}
	
}
