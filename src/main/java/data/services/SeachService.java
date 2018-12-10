package data.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import data.entities.Book;
import data.repositories.BookRepository;

@Service
public class SeachService {

	@Autowired
	BookRepository repository;
	
	public Page<Book> findBooks(String search, Pageable pageable){
		return repository.findByTitleContainingOrAuthorContainingOrIsbnContaining(search, search, search, pageable);
	}
	
}
