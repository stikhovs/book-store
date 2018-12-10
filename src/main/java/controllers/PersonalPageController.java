package controllers;

import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import components.CurrentUserComponent;
import data.entities.User;
import data.repositories.CartRepository;
import data.repositories.OrderRepository;
import data.repositories.ReviewRepository;
import data.repositories.UserRepository;

@Controller
public class PersonalPageController {

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	CartRepository cartRepository;
	
	@Autowired
	OrderRepository orderRepository;
	
	@Autowired
	ReviewRepository reviewRepository;
	
	@Autowired
	CurrentUserComponent currentUser;
	
	
	@GetMapping("/personal-page")
	public String goToPersonalPage() {
		return "personal-page";
	}
	
	@GetMapping("/delete-profile")
	public String deleteProfile(@ModelAttribute User user, HttpServletResponse response) {
		
		System.out.println(user);
		
		/*orderRepository.findByUserId(user.getUserId()).forEach(order -> {
			orderRepository.delete(order);
		});*/
		orderRepository.deleteAll(orderRepository.findByUserId(user.getUserId()));
		cartRepository.delete(cartRepository.findByUserId(user.getUserId()));
		reviewRepository.deleteAll(reviewRepository.findByUser(user));
		userRepository.delete(user);
		
		currentUser.setAnonymUser(true);
		Cookie[] cookies = { 
				new Cookie("booksInCart", ""),
				new Cookie("totalItemsInCart", "0"), 
				new Cookie("totalSum", "0"), 
				new Cookie("userId", ""),
		};

		Arrays.asList(cookies).forEach(cookie -> {
			System.out.println(cookie.getName() + ": " + cookie.getValue());
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
			//model.addAttribute(cookie.getName(), cookie.getValue());
		});
		currentUser.setUserId(0);
		
		return "redirect:/";
	}
	
}
