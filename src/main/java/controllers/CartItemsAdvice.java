package controllers;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;

import components.CurrentUserComponent;
import data.entities.Book;
import data.entities.Cart;
import data.entities.User;
import data.repositories.CartRepository;
import data.services.BookService;
import data.services.CartService;
import data.services.UserService;

@ControllerAdvice
public class CartItemsAdvice {

	@Autowired
	BookService bookService;
	
	@Autowired
	CurrentUserComponent currentUser;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	CartRepository cartRepo;
	
	@ModelAttribute
	public void cartCookie(Model model, 
			@CookieValue(defaultValue = "0") String totalItemsInCart, 
			@CookieValue(defaultValue = "0") String totalSum,
			@CookieValue(defaultValue = "") String booksInCart,
			@CookieValue(defaultValue = "") String userId,
			HttpServletResponse response) {
		
		
		int totalItemsNumeric = Integer.parseInt(totalItemsInCart);
		double totalSumNumeric = Double.parseDouble(totalSum);		
				
		
		
		if(userId.isEmpty()) {
			
			currentUser.setTotalItemsInCart(totalItemsNumeric);
			currentUser.setTotalSum(totalSumNumeric);
			currentUser.setBooksInCart(booksInCart);
			
			model.addAttribute("totalItemsInCart",currentUser.getTotalItemsInCart());
			model.addAttribute("totalSum",currentUser.getTotalSum());
			model.addAttribute("booksInCart",currentUser.getBooksInCart());
			model.addAttribute("booksInCartList", currentUser.parseBooksToList());
			
			model.addAttribute("user", new User());
						
			System.out.println("АНОНИМ Товаров в корзине: " + currentUser.getTotalItemsInCart());
			System.out.println("АНОНИМ На сумму: " + currentUser.getTotalSum());
			System.out.println("АНОНИМ Книги: " + currentUser.getBooksInCart());
			
		}
		else {
			
			System.out.println("Пользователь авторизован");
			User user = userService.findUserById(Long.parseLong(userId));
			Cart cart = cartService.findCartByUserId(user.getUserId());
			
			currentUser.setAnonymUser(false);
			
			Cookie userIdCookie = new Cookie("userId", String.valueOf(user.getUserId()));
			userIdCookie.setMaxAge(60 * 60 * 24 * 30); // Cookie userId будет храниться 30 дней
			userIdCookie.setPath("/");
			response.addCookie(userIdCookie);
			
			System.out.println(cart);
			
			if(!cart.getBooks().equals(booksInCart)) {
				System.out.println("Корзины разные");
				
				Set<String> newCartSet = new LinkedHashSet<>();
				for(String bookId : cart.getBooks().split("ID")) {
					if(!bookId.equals("")) {
						newCartSet.add(bookId);
					}
				}
				for(String bookId : booksInCart.split("ID")) {
					if(!bookId.equals("")) {
						newCartSet.add(bookId);
					}
				}
				
				System.out.println("Получившееся множество: " + newCartSet);
				
								
				String newCart = "";
				for(String bookId : newCartSet) {
					newCart+="ID"+bookId;					
					
				}
				
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
				
				currentUser.setTotalItemsInCart(cart.getTotalItems());
				currentUser.setTotalSum(cart.getTotalSum());
				currentUser.setBooksInCart(cart.getBooks());
				
				
			}
			
			model.addAttribute("totalItemsInCart",currentUser.getTotalItemsInCart());
			model.addAttribute("totalSum",currentUser.getTotalSum());
			model.addAttribute("booksInCart",currentUser.getBooksInCart());
			model.addAttribute("booksInCartList", currentUser.parseBooksToList());
			/*System.out.println("Найденная корзина: " + cart);
			
			model.addAttribute("totalItemsInCart",cart.getTotalItems());
			model.addAttribute("totalSum",cart.getTotalSum());
			model.addAttribute("booksInCart",cart.getBooks());	
			
			System.out.println("totalItems: " + cart.getTotalItems());
			System.out.println("totalSum: " + cart.getTotalSum());
			System.out.println("booksInCart: " + cart.getBooks());*/
			
			model.addAttribute("user", user);
			
		}
		
		System.out.println("CURRENT USER: " + currentUser);
		model.addAttribute("currentUser", currentUser);
		
	
		System.out.println("----------------------------------");
				
		
	}
	
}
