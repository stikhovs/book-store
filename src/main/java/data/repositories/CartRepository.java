package data.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import data.entities.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {

	
	public Cart findByUserId(long id);
	
}
