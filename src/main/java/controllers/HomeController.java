package controllers;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import data.entities.MainSliderBooksEntity;
import data.services.BookService;
import data.services.MainSliderBooksService;
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
	
	@Autowired
	MainSliderBooksService mainSliderBooksService;
	
	@GetMapping("/")
	public String goHome(Model model) throws Exception {
		model.addAttribute("books",service.getAll());
		model.addAttribute("newArrivals",service.getNewArrivals());
		model.addAttribute("bestsellers",service.getBestsellers());
		model.addAttribute("preOrders", service.getPreOrders());
		
		List<MainSliderBooksEntity> slides = mainSliderBooksService.slideList();
		Collections.reverse(slides);
		
		model.addAttribute("mainSlider", slides);
				
		return "index";
	}
	
	@GetMapping("catalog/{id}")
	public String showCustomer(Model model, @PathVariable("id") long bookId) {
		
		model.addAttribute("bookInfo",service.getBookById(bookId));
		
		model.addAttribute("reviews", reviewService.getOnlyPermittedReviews(bookId));		
		
		return "book";
	}
}
