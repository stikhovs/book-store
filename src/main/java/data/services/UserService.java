package data.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.entities.User;
import data.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository repository;
	
	public List<User> findAllUsers(){
		return repository.findAll();
	}
	
	public User findByEmail(String email) {
		return repository.findByEmail(email);
	}
	
	public User findUserById(long id) {
		return repository.findByUserId(id);
	}
	
	public List<User> findUserByPassword(String password) {
		if(password == null) password = "";
		return repository.findByPassword(password);
	}
	
	public User findUserByEmailAndPassword(String email, String password) {
		return repository.findByEmailAndPassword(email, password);
	}
		
}