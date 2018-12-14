package data.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.entities.Book;
import data.entities.Preorder;
import data.entities.User;
import data.repositories.PreorderRepository;

@Service
public class PreorderService {

	@Autowired
	PreorderRepository repository;
	
	@Autowired
	BookService bookService;
	
	@Autowired
	UserService userService;
	
	public List<Preorder> findPreorderByBookId(long bookId){
		return repository.findByBookId(bookId);
	}
	
	public List<Preorder> findPreorderByUserId(long userId){
		return repository.findByUserId(userId);
	}
	
	public void savePreorder(Preorder preorder) {		
		repository.saveAndFlush(preorder);
	}
	
	public Preorder findPreorderById(long preorderId) {
		return repository.findByPreorderId(preorderId);
	}
	
	public List<Preorder> findAllPreorders(){
		return repository.findAll();
	}
	
	
	public Book getBookFromPreorder(Preorder preorder) {
		return bookService.getBookById(preorder.getBookId());
	}
	
	public User getUserFromPreorder(Preorder preorder) {
		return userService.findUserById(preorder.getUserId());
	}
	
	public void deletePreorder(Preorder preorder) {
		repository.delete(preorder);
	}
	
}
