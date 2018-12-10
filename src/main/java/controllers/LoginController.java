package controllers;

import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import components.CurrentUserComponent;
import data.entities.Book;
import data.entities.Cart;
import data.entities.User;
import data.repositories.CartRepository;
import data.services.BookService;
import data.services.CartService;
import data.services.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;

	@Autowired
	CartService cartService;
	
	@Autowired
	BookService bookService;

	@Autowired
	CurrentUserComponent currentUser;
	
	@Autowired
	CartRepository cartRepo;

	@PostMapping("/logInUser")
	public String checkUser(@ModelAttribute("user") @Valid User user, HttpServletRequest request, HttpServletResponse response, BindingResult result) {

		
		
		if(user.getEmail().isEmpty()) {			
			System.out.println("EMAIL BLANK");
			result.rejectValue("email", "email.is.empty", "Это поле не может быть пустым");
		} else
		if(user.getPassword().isEmpty() || userService.findUserByPassword(user.getPassword()).isEmpty() == true) {
			result.rejectValue("password", "password.is.empty", "Неверный пароль");
		} else
		if(userService.findByEmail(user.getEmail()) == null) {
			result.rejectValue("email", "no.such.user", "Пользователя с таким email не существует");
		}
		
		if(result.hasErrors()) {
			result.getAllErrors().forEach(e -> System.out.println(e));
			return "redirect:/";
		}
		
		user = userService.findUserByEmailAndPassword(user.getEmail(), user.getPassword());
		
		System.out.println(user);
		
		Cart cart = cartService.findCartByUserId(user.getUserId());

		if (user != null) {
			currentUser.setAnonymUser(false);
			currentUser.setUserId(user.getUserId());
			
			
			if(!cart.getBooks().equals(currentUser.getBooksInCart())) {
				
				System.out.println("Корзины разные");
				String newCart = cart.getBooks() + currentUser.getBooksInCart();
				cart.setBooks(newCart);
				
				double newSum = 0D;
				int newTotalItems = 0;
				
				for(String bookId : newCart.split("ID")) {
					if(!bookId.equals("")) {
						Book book = bookService.getBookById(Long.parseLong(bookId));
						newSum += book.getPrice();
						newTotalItems++;						
					}
				}
				
				cart.setTotalSum(newSum);
				cart.setTotalItems(newTotalItems);
				
				cart = cartRepo.saveAndFlush(cart);
			}
			
			currentUser.setTotalItemsInCart(cart.getTotalItems());
			currentUser.setTotalSum(cart.getTotalSum());
			currentUser.setBooksInCart(cart.getBooks());
			
			Cookie userIdCookie = new Cookie("userId", String.valueOf(user.getUserId()));
			userIdCookie.setMaxAge(300);
			userIdCookie.setPath("/");
			response.addCookie(userIdCookie);

			System.out.println(user.getEmail());
			
		}
		//System.out.println(cart);
		return "redirect:/";

	}

	@GetMapping("/logout")
	public String logout(HttpServletResponse response) {
		// Cookie cookie = new Cookie("loggedUser", "");

		currentUser.setAnonymUser(true);
		
				
		/*currentUser.setBooksInCartFromCookie("");
		currentUser.setTotalItemsInCart(0);
		currentUser.setTotalSum(0);*/
		
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

		return "redirect:/";
	}

}
