package controllers;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import components.CurrentUserComponent;
import data.entities.Book;
import data.entities.Order;
import data.entities.User;
import data.repositories.CartRepository;
import data.repositories.OrderRepository;
import data.repositories.ReviewRepository;
import data.repositories.UserRepository;
import data.services.BookService;
import data.services.OrderService;
import data.services.UserService;

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
	
	@Autowired
	BookService bookService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	UserService userService;
	
	
	
	@GetMapping("/personal-page")
	public String goToPersonalPage(Model model) {
		
		/*List<Order> orders = orderService.findOrdersByUserId(currentUser.getUserId());
		Map<Order,List<Book>> orderAndBooksMap = new LinkedHashMap<>();
		
		orders.forEach(order -> {
			orderAndBooksMap.put(order, orderService.getBooksFromOrder(order));
		});*/
		
		LinkedHashMap<Order,List<Book>> orderAndBooksMap = userService.getUserOrders(userService.findUserById(currentUser.getUserId()));
		
		model.addAttribute("orderAndBooksMap", orderAndBooksMap);
		System.out.println(currentUser);
		System.out.println(orderAndBooksMap.size());
		
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
