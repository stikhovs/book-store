package data.services;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.entities.Book;
import data.entities.Order;
import data.repositories.OrderRepository;

@Service
public class OrderService {

	@Autowired
	OrderRepository repository;
	
	@Autowired
	BookService bookService;
	
	public List<Order> findOrdersByUserId(long userid){
		return repository.findByUserId(userid);
	}
	
	public List<Order> findAllOrders(){
		return repository.findAll();
	}
	
	public Order findOrderById(long orderId) {
		return repository.findByOrderId(orderId);
	}
	
	public void saveOrder(Order order) {
		repository.saveAndFlush(order);
	}
	
	public List<Book> getBooksFromOrder(Order order){
		List<Book> books = new LinkedList<>();
		for(String bookId : order.getBooks().split("ID")) {
			if(!bookId.equals("")) {
				Book book = bookService.getBookById(Long.parseLong(bookId));
				books.add(book);
			}
		}
		return books;
	}
	
	
	public double getTotalOrderPrice(Order order) {
		double totalOrderPrice = 0;
		for(Book b : getBooksFromOrder(order)) {
			totalOrderPrice += b.getPrice();
		}
		return totalOrderPrice;
	}
}
