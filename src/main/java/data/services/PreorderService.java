package data.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.entities.Preorder;
import data.repositories.PreorderRepository;

@Service
public class PreorderService {

	@Autowired
	PreorderRepository repository;
	
	public List<Preorder> findPreorderByBookId(long bookId){
		return repository.findByBookId(bookId);
	}
	
	public List<Preorder> findPreorderByUserId(long userId){
		return repository.findByUserId(userId);
	}
	
	public void savePreorder(Preorder preorder) {		
		repository.saveAndFlush(preorder);
	}
	
}
