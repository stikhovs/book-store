package data.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import components.CurrentUserComponent;
import data.entities.Cart;
import data.repositories.CartRepository;

@Service
public class CartService {

	@Autowired
	CartRepository repository;
	
	public Cart findCartByUserId(long userId) {
		return repository.findByUserId(userId);
	}
	
	public void refreshCart(Cart cart) {
		cart.setTotalItems(0);
		cart.setTotalSum(0);
		cart.setBooks("");
		repository.saveAndFlush(cart);
	}
	
	public void changeItemsInCart(Cart cart, CurrentUserComponent currentUser) {		
		cart.setTotalItems(currentUser.getTotalItemsInCart());
		cart.setTotalSum(currentUser.getTotalSum());
		cart.setBooks(currentUser.getBooksInCart());
		repository.saveAndFlush(cart);		
	}
	
	
}
