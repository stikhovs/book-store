package data.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import data.entities.Book;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {

	@Query(value = "SELECT * FROM book_store.books WHERE (title LIKE :search) OR (author LIKE :search) OR (isbn LIKE :search)", nativeQuery = true )
	public List<Book> searchBooks(@Param("search") String search );
	
	public Page<Book> findByTitleContainingIgnoreCaseOrAuthorContainingIgnoreCaseOrIsbnContaining(String title, String author, String isbn, Pageable pageable);
		
	@Query(value = "SELECT DISTINCT book_store.books.Genre_One FROM book_store.books", nativeQuery = true )
	public List<String> getDistinctGenreOne();
	
	@Query(value = "SELECT DISTINCT book_store.books.Genre_Two FROM book_store.books", nativeQuery = true )
	public List<String> getDistinctGenreTwo();
		
	@Query(value = "SELECT DISTINCT book_store.books.Genre_Two FROM book_store.books WHERE book_store.books.Genre_One = :genreOne", nativeQuery = true )
	public List<String> getInnerGenreForEachOuterGenre(@Param("genreOne") String genreOne);
	
	@Query(value = "SELECT DISTINCT book_store.books.Genre_One FROM book_store.books WHERE book_store.books.Genre_Two = :genreTwo", nativeQuery = true )
	public String getOuterGenreForInnerGenre(@Param("genreTwo") String genreTwo);
	
	@Query(value = "SELECT * FROM book_store.books WHERE (Genre_One LIKE :genre) OR (Genre_Two LIKE :genre) ", nativeQuery = true)
	public Page<Book> getBooksByGenre(@Param("genre") String genre, Pageable pageable);
	
	public Page<Book> findByGenreOneOrGenreTwo(String genreOne, String genreTwo, Pageable pageable);
	
	public Page<Book> findByNewArrival(boolean b, Pageable pageable);
	
	public Page<Book> findByBestseller(boolean b, Pageable pageable);
	
	
}
