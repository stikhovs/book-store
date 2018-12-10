package data.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.entities.Review;
import data.entities.User;
import data.repositories.ReviewRepository;

@Service
public class ReviewService {

	@Autowired
	ReviewRepository repository;
	
	@Autowired
	UserService userService;
	
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
}
