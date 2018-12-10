package data.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import data.entities.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

	public List<Order> findByUserId(long userId);
	
}
