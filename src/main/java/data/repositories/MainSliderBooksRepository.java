package data.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import data.entities.Book;
import data.entities.MainSliderBooksEntity;

@Repository
public interface MainSliderBooksRepository extends JpaRepository<MainSliderBooksEntity, Long> {

	public MainSliderBooksEntity findByBook(Book book);
	
}
