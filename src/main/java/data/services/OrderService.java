package data.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.entities.Order;
import data.repositories.OrderRepository;

@Service
public class OrderService {

	@Autowired
	OrderRepository repository;
	
	public List<Order> findOrdersByUserId(long userid){
		return repository.findByUserId(userid);
	}
	
	public List<Order> findAllOrders(){
		return repository.findAll();
	}
	
}
