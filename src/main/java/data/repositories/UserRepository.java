package data.repositories;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import data.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	public User findByEmail(String email);
	
	public User findByUserId(long id);
	
	public List<User> findByPassword(String password);
	
	public User findByEmailAndPassword(String email, String password);
	
}
