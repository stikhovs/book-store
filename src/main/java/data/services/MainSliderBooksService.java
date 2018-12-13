package data.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.entities.MainSliderBooksEntity;
import data.repositories.MainSliderBooksRepository;

@Service
public class MainSliderBooksService {

	@Autowired
	MainSliderBooksRepository repository;
	
	@Autowired
	BookService bookService;
	
	public MainSliderBooksEntity findSliderByBookId(long bookId) {
		return repository.findByBook(bookService.getBookById(bookId));
	}
	
	public List<MainSliderBooksEntity> slideList(){
		return repository.findAll();
	}
	
}
