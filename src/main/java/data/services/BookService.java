package data.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.entities.Book;
import data.repositories.BookRepository;

@Service
public class BookService {

	@Autowired BookRepository repository;
	
	public List<Book> getAll() {
		return repository.findAll();
	}
	
	public List<Book> getNewArrivals() {
		List<Book> newArrivals = new ArrayList<>();
		repository.findAll().forEach(e -> {
			if(e.isNewArrival()) {
				newArrivals.add(e);
			}
		});
		return newArrivals;
	}
	
	public List<Book> getBestsellers() {
		List<Book> bestsellers = new ArrayList<>();
		repository.findAll().forEach(e -> {
			if(e.isBestseller()) {
				bestsellers.add(e);
			}
		});
		return bestsellers;
	}
	
	public List<Book> getPreOrders() {
		List<Book> preOrders = new ArrayList<>();
		repository.findAll().forEach(e -> {
			if(e.isPreOrder()) {
				preOrders.add(e);
			}
		});
		return preOrders;
	}
	
	public Book getBookById(long id) {
		return repository.getOne(id);
	}
	
	
}
