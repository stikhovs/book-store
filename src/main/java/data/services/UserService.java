package data.services;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.entities.Book;
import data.entities.Order;
import data.entities.Preorder;
import data.entities.Review;
import data.entities.User;
import data.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository repository;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	PreorderService preorderService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	BookService bookService;
	
	public List<User> findAllUsers(){
		return repository.findAll();
	}
	
	public User findByEmail(String email) {
		return repository.findByEmail(email);
	}
	
	public User findUserById(long id) {
		return repository.findByUserId(id);
	}
	
	public List<User> findUserByPassword(String password) {
		if(password == null) password = "";
		return repository.findByPassword(password);
	}
	
	public User findUserByEmailAndPassword(String email, String password) {
		return repository.findByEmailAndPassword(email, password);
	}
	
	public LinkedHashMap<Order, List<Book>> getUserOrders(User user){
		List<Order> orders = orderService.findOrdersByUserId(user.getUserId());
		Map<Order,List<Book>> orderAndBooksMap = new LinkedHashMap<>();		
		orders.forEach(order -> {
			orderAndBooksMap.put(order, orderService.getBooksFromOrder(order));
		});
		return (LinkedHashMap<Order,List<Book>>)orderAndBooksMap;
	}
	
	public LinkedHashMap<Preorder, Book> getUserPreorders(User user) {
		List<Preorder> preorders = preorderService.findPreorderByUserId(user.getUserId());
		Map<Preorder, Book> preorderAndBooksMap = new LinkedHashMap<>();	
		preorders.forEach(preorder -> {
			preorderAndBooksMap.put(preorder, preorderService.getBookFromPreorder(preorder));
		});
		return (LinkedHashMap<Preorder, Book>)preorderAndBooksMap;		
	}
	
	
	public LinkedHashMap<Book, List<Review>> getUserReviews(User user){
		List<Review> reviews = reviewService.findReviewByUserId(user);		
		Map<Book, List<Review>> bookAndreviewsMap = new LinkedHashMap<>();
		reviews.forEach(review -> {
			bookAndreviewsMap.put(
					reviewService.findBookByReview(review), 
					reviewService.getAllReviewsAboutBookOfUser(
							reviewService.findBookByReview(review).
							getBookId(), user
							)
					);
		});
		return (LinkedHashMap<Book, List<Review>>) bookAndreviewsMap;
	}
		
}