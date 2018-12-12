package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import data.entities.Review;
import data.entities.User;
import data.repositories.ReviewRepository;
import data.services.BookService;

@Controller
public class ReviewController {

	@Autowired
	BookService bookService;
	
	@Autowired
	ReviewRepository reviewRepository;
	
	@GetMapping("catalog/{id}/review")
	public String goReview(Model model, @PathVariable("id") long bookid) {
		
		model.addAttribute("book",bookService.getBookById(bookid));
		model.addAttribute("review", new Review());
		
		return "review";
	}
	
	@PostMapping("catalog/{id}/review")
	public String leftReview(@ModelAttribute("review") @Valid Review review, BindingResult result, @PathVariable("id") long bookid, @ModelAttribute("user") User user, Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("book",bookService.getBookById(bookid));
			return "review";
		}
		
		review.setBookId(bookid);
		review.setReviewDate(review.createDate());
		review.setUser(user);
		
		review.setPermitted(true);
		
		reviewRepository.saveAndFlush(review);
		
		
		
		return "redirect:/catalog/"+bookid;
	}
	
}
