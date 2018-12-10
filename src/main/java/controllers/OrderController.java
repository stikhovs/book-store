package controllers;

import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import components.CurrentUserComponent;
import data.entities.Cart;
import data.entities.Order;
import data.entities.User;
import data.repositories.OrderRepository;
import data.services.CartService;
import data.services.UserService;

@Controller
public class OrderController {

	@Autowired
	CurrentUserComponent currentUser;
	
	@Autowired
	UserService userService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	OrderRepository orderRepo;
		
		
	@GetMapping("/order")
	public String showOrder(Model model) {
		
//		Order orderDetails = new Order();		
//		
//		model.addAttribute("orderDetails", orderDetails);
		
		return "order";
	}
	
	@ModelAttribute("orderDetails")
	public Order createOrder() {
		return new Order();
	}
	
	@PostMapping("/order")
	public String makeOrder(@ModelAttribute("orderDetails") @Valid Order orderDetails, BindingResult result, HttpServletResponse response, Model model) {
		
		
		System.out.println(orderDetails);
		
		if(result.hasErrors()) {
			System.out.println("������ � ������");
			return "order";
		}
		
		User user = userService.findUserById(currentUser.getUserId());
		Cart cart = cartService.findCartByUserId(user.getUserId());
		
		orderDetails.setUserId(user.getUserId());
		orderDetails.setCartId(cart.getCartId());
		
		if(orderDetails.getAddress().isEmpty()) orderDetails.setAddress("no address");
		
		orderRepo.saveAndFlush(orderDetails);
		
		System.out.println(orderDetails);
		
		
		// ������� ������� ����� ���������� ������
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
		
						
		cartService.refreshCart(cart);
		
		
		
		return "final";
	}
	
	
}
