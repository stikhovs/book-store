package controllers;

import java.util.Arrays;
import java.util.function.Predicate;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import components.CurrentUserComponent;
import data.entities.Book;
import data.entities.Cart;
import data.repositories.CartRepository;
import data.services.BookService;
import data.services.CartService;
import data.services.UserService;

@Controller
public class CartController {
	
	@Autowired
	BookService bookService;
	
	@Autowired
	CurrentUserComponent currentUser;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	CartRepository cartRepo;

	@Autowired
	UserService userService;
	
	
	@GetMapping("cart")
	public String goCart() {
		
		return "cart";
	}
	
	@GetMapping(value = "cart", params = "deleteall")
	public String refreshCart(@RequestParam (value = "deleteall", defaultValue = "false") String deleteAll, HttpServletResponse response) {
		
		if(deleteAll.equals("true")) {
			Cookie[] cookies = { new Cookie("booksInCart", ""),
					new Cookie("totalItemsInCart", "0"), new Cookie("totalSum", "0"), };

			Arrays.asList(cookies).forEach(cookie -> {
				System.out.println(cookie.getName() + ": " + cookie.getValue());
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			});
			currentUser.setBooksInCart("");
			currentUser.setTotalSum(0);
			currentUser.setTotalItemsInCart(0);
			
			if(!currentUser.isAnonymUser()) {				
				Cart cart = cartService.findCartByUserId(currentUser.getUserId());
				cartService.refreshCart(cart);
			}
		}
		
		return "redirect:/cart";
	}
	
	@GetMapping(value = "cart", params = "deleteitem")
	public String deleteItem(@RequestParam(value = "deleteitem") String deleteItem, HttpServletResponse response) {
		
		long bookIdParam = Long.parseLong(deleteItem);
		
		Predicate<Book> bookPredicate = b -> b.getBookId() == bookIdParam;
		
		currentUser.getBooksInCartList().removeIf(bookPredicate);
		
		currentUser.changeCurrentUserCart(currentUser.getBooksInCartList());
		
		Cookie[] cookies = { 
				new Cookie("booksInCart", currentUser.getBooksInCart()),
				new Cookie("totalItemsInCart", String.valueOf(currentUser.getTotalItemsInCart())), 
				new Cookie("totalSum", String.valueOf(currentUser.getTotalSum())), 
				};
		Arrays.asList(cookies).forEach(cookie -> {
			cookie.setPath("/");
			response.addCookie(cookie);
		});
		
		if(!currentUser.isAnonymUser()) {				
			Cart cart = cartService.findCartByUserId(currentUser.getUserId());
			cartService.changeItemsInCart(cart, currentUser);
		}
		
		return "redirect:/cart";
	}
	
}
