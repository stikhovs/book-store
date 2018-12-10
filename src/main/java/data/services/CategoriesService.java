package data.services;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import data.entities.Book;
import data.repositories.BookRepository;

@Service
public class CategoriesService {

	@Autowired BookRepository repository;
	
	private List<String> showOuterCategories(){
		return repository.getDistinctGenreOne();
	}
	
	private List<String> showInnerCategories(String genreOne){
		return repository.getInnerGenreForEachOuterGenre(genreOne);
	}
	
	public Map<String, List<String>> showAllCategories(){
		Map<String, List<String>> categories = new LinkedHashMap<String, List<String>>();				
		showOuterCategories().forEach(genreOne -> {
			categories.put(genreOne, showInnerCategories(genreOne));			
		});
		return categories;
	}
	
	/*public Page<Book> getBooksByGenre(String genre, Pageable pageable, Sort sort){
		return repository.getBooksByGenre(genre, pageable);
	}*/
	
	public Page<Book> getBooksByGenre(String genre, Pageable pageable, Sort sort){
		return repository.findByGenreOneOrGenreTwo(genre, genre, pageable);
	}
	
	
	public List<Book> getAllBooks(){
		return repository.findAll();
	}
	
	public Page<Book> getAllBooks(Pageable pageable){
		return repository.findAll(pageable);
	}
	
	public Page<Book> getNewArrivals(boolean b, Pageable pageable){		
		return repository.findByNewArrival(b, pageable);
	}
	
	public Page<Book> getBestSellers(boolean b, Pageable pageable){
		return repository.findByBestseller(b, pageable);
	}
	
	public String getGenreOneByGenreTwo(String genreTwo) {
		return repository.getOuterGenreForInnerGenre(genreTwo);
	}
}
