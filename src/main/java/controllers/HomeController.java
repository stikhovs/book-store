package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;

import data.services.BookService;
import data.services.ReviewService;
import data.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	BookService service;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/")
	public String goHome(Model model) {
		model.addAttribute("books",service.getAll());
		model.addAttribute("newArrivals",service.getNewArrivals());
		model.addAttribute("bestsellers",service.getBestsellers());
		model.addAttribute("preOrders", service.getPreOrders());
				
		return "index";
	}
	
	@GetMapping("catalog/{id}")
	public String showCustomer(Model model, @PathVariable("id") long bookId) {
		
		model.addAttribute("bookInfo",service.getBookById(bookId));
		
		model.addAttribute("reviews", reviewService.findReviewByBookId(bookId));
		
		
		
		return "book";
	}
}
