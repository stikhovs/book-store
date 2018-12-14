package data.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.entities.Book;
import data.entities.Review;
import data.entities.User;
import data.repositories.ReviewRepository;

@Service
public class ReviewService {

	@Autowired
	ReviewRepository repository;
	
	@Autowired
	UserService userService;
	
	@Autowired
	BookService bookService;
	
	public List<Review> findReviewByBookId(long bookId){
		return repository.findByBookId(bookId);
	}
	
	public List<Review> findReviewByUserId(User user){
		return repository.findByUser(user);
	}
	
	public String userName(long userId) {
		User user = userService.findUserById(userId);
		return user.getLastName() + " " + user.getFirstName();
	}
	
	public List<Review> findAllReviews(){
		return repository.findAll();
	}
	
	public Review findReviewByReviewId(long reviewId) {
		return repository.findByReviewId(reviewId);
	}
	
	public Book findBookByReview(Review review) {
		return bookService.getBookById(review.getBookId());
	}
	
	public void saveReview(Review review) {
		repository.saveAndFlush(review);
	}
	
	public List<Review> getOnlyPermittedReviews(long bookId){
		return repository.findByBookIdAndPermittedTrue(bookId);
	}
	
	public List<Review> getAllReviewsAboutBookOfUser(long bookId, User user){
		return repository.findByBookIdAndUser(bookId, user);
	}
	
}
