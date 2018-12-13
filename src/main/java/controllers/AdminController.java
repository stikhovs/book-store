package controllers;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;

import components.BookAddComponent;
import components.BookEditComponent;
import components.MainSliderBookComponent;
import data.entities.Book;
import data.entities.MainSliderBooksEntity;
import data.repositories.BookRepository;
import data.repositories.MainSliderBooksRepository;
import data.services.BookService;
import data.services.MainSliderBooksService;
import data.services.OrderService;
import data.services.PreorderService;
import data.services.ReviewService;
import data.services.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	BookService bookService;

	@Autowired
	BookRepository bookRepository;

	@Autowired
	BookAddComponent bookAddComponent;

	@Autowired
	MainSliderBookComponent mainSliderBookComponent;

	@Autowired
	MainSliderBooksRepository mainSliderBooksRepository;

	@Autowired
	MainSliderBooksService mainSliderBooksService;

	@Autowired
	BookEditComponent bookEditComponent;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	PreorderService preorderService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	UserService userService;

	@GetMapping("/add-book")
	public String goAddBook(Model model) {

		model.addAttribute("book", bookAddComponent);

		return "add-book";
	}

	@PostMapping("/add-book")
	public String doAddBook(@ModelAttribute("book") BookAddComponent bookComponent) throws IOException {

		Book book = new Book();

		book.setTitle(bookComponent.getTitle());
		book.setAuthor(bookComponent.getAuthor());
		book.setDescription(bookComponent.getDescription());
		book.setNewArrival(bookComponent.isNewArrival());
		book.setBestseller(bookComponent.isBestseller());
		book.setGenreOne(bookComponent.getGenreOne());
		book.setGenreTwo(bookComponent.getGenreTwo());
		book.setPages(bookComponent.getPages());
		book.setPublisher(bookComponent.getPublisher());
		book.setPublishYear(bookComponent.getPublishYear());
		book.setCoverType(bookComponent.getCoverType());
		book.setIsbn(bookComponent.getIsbn());
		book.setPrice(bookComponent.getPrice());
		book.setPreOrder(bookComponent.isPreOrder());

		// Загрузка обложки на Amazon
		MultipartFile bookCover = bookComponent.getBookCover();

		File bookCoverFile = new File(bookCover.getOriginalFilename());
		bookCover.transferTo(bookCoverFile);

		AmazonS3 s3 = AmazonS3ClientBuilder.defaultClient();

		String fileKey = "bookCovers/" + book.getIsbn() + "/" + bookCover.getOriginalFilename();

		s3.putObject("stikhovs-book-store", fileKey, bookCoverFile);
		s3.setObjectAcl("stikhovs-book-store", fileKey, CannedAccessControlList.PublicRead);

		// Book realBook = bookService.getBookById(book.getBookId());
		book.setCoverPath(book.getIsbn() + File.separator + bookCover.getOriginalFilename());

		System.out.println(book);

		bookRepository.saveAndFlush(book);

		return "redirect:/catalog/" + book.getBookId();
	}

	@GetMapping("/book-list")
	public String goBookList(Model model) {
		model.addAttribute("booklist", bookService.getAll());
		return "book-list";
	}

	@GetMapping("/book-list/edit/{id}")
	public String goEditBook(Model model, @PathVariable("id") long bookId) {

		Book book = bookService.getBookById(bookId);
		bookEditComponent.copyFieldsFromBook(book);

		model.addAttribute("book", bookEditComponent);
		System.out.println(bookEditComponent);
		return "book-edit";
	}

	@PostMapping("/book-list/edit/{id}")
	public String doEditBook(@ModelAttribute("book") BookEditComponent bookEditComponent,
			@PathVariable("id") long bookId) {

		Book book = bookService.getBookById(bookId);

		book.setTitle(bookEditComponent.getTitle());
		book.setAuthor(bookEditComponent.getAuthor());
		book.setDescription(bookEditComponent.getDescription());
		book.setNewArrival(bookEditComponent.isNewArrival());
		book.setBestseller(bookEditComponent.isBestseller());
		book.setGenreOne(bookEditComponent.getGenreOne());
		book.setGenreTwo(bookEditComponent.getGenreTwo());
		book.setPages(bookEditComponent.getPages());
		book.setPublisher(bookEditComponent.getPublisher());
		book.setPublishYear(bookEditComponent.getPublishYear());
		book.setCoverType(bookEditComponent.getCoverType());
		book.setIsbn(bookEditComponent.getIsbn());
		book.setPrice(bookEditComponent.getPrice());
		book.setPreOrder(bookEditComponent.isPreOrder());

		try {
			// Загрузка обложки на Amazon
			MultipartFile bookCover = bookEditComponent.getBookCover();

			File bookCoverFile = new File(bookCover.getOriginalFilename());
			bookCover.transferTo(bookCoverFile);

			AmazonS3 s3 = AmazonS3ClientBuilder.defaultClient();

			String fileKey = "bookCovers/" + book.getIsbn() + "/" + bookCover.getOriginalFilename();

			s3.putObject("stikhovs-book-store", fileKey, bookCoverFile);
			s3.setObjectAcl("stikhovs-book-store", fileKey, CannedAccessControlList.PublicRead);

			// Book realBook = bookService.getBookById(book.getBookId());
			book.setCoverPath(book.getIsbn() + File.separator + bookCover.getOriginalFilename());
		} catch (IOException e) {
			System.out.println("Файл обложки пуст");
		}

		bookRepository.saveAndFlush(book);

		return "redirect:/admin/book-list";
	}

	@GetMapping("/book-list/edit/{id}/add-slide")
	public String goAddSlide(Model model, @PathVariable("id") long bookId) {

		model.addAttribute("slider", mainSliderBookComponent);
		model.addAttribute("book", bookService.getBookById(bookId));

		return "add-slide";
	}

	@PostMapping("/book-list/edit/{id}/add-slide")
	public String doAddSlide(@ModelAttribute("slider") MainSliderBookComponent slider, @PathVariable("id") long bookId)
			throws IOException {

		MainSliderBooksEntity sliderEntity = null;

		if (mainSliderBooksService.findSliderByBookId(bookId) != null) {
			sliderEntity = mainSliderBooksService.findSliderByBookId(bookId);
		} else {
			sliderEntity = new MainSliderBooksEntity();
		}

		// String newSliderCreationTime = slider.getDateOfCreation();
		String bookIsbn = bookService.getBookById(bookId).getIsbn();

		sliderEntity.setAuthorColor(slider.getAuthorColor());
		sliderEntity.setTitleColor(slider.getTitleColor());

		sliderEntity.setBook(bookService.getBookById(bookId));

		// Загрузка обложки на Amazon
		MultipartFile background = slider.getBookBackground();

		File backgroundFile = new File(background.getOriginalFilename());
		background.transferTo(backgroundFile);

		AmazonS3 s3 = AmazonS3ClientBuilder.defaultClient();

		String fileKey = "slider_background_path/" + bookIsbn + "/" + background.getOriginalFilename();

		s3.putObject("stikhovs-book-store", fileKey, backgroundFile);
		s3.setObjectAcl("stikhovs-book-store", fileKey, CannedAccessControlList.PublicRead);

		sliderEntity.setBackgroundPath(bookIsbn + "/" + background.getOriginalFilename());

		mainSliderBooksRepository.saveAndFlush(sliderEntity);

		return "redirect:/";
	}

	
	
	
	@GetMapping("/order-list")
	public String goOrderList(Model model) {
		model.addAttribute("orderlist", orderService.findAllOrders());
		return "order-list";
	}
	
	
	@GetMapping("/preorder-list")
	public String goPreorderList(Model model) {
		model.addAttribute("preorderlist", preorderService.findAllPreorders());
		return "preorder-list";
	}
	
	
	@GetMapping("/review-list")
	public String goReviewList(Model model) {
		model.addAttribute("reviewlist", reviewService.findAllReviews());
		return "review-list";
	}
	
	@GetMapping("/user-list")
	public String goUserList(Model model) {
		model.addAttribute("userlist", userService.findAllUsers());
		return "user-list";
	}
	
}
