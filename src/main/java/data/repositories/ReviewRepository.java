package data.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import data.entities.Review;
import data.entities.User;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {

	public List<Review> findByBookId(long bookId);
	
	public List<Review> findByUser(User user);
	
}
