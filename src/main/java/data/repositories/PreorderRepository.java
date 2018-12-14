package data.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import data.entities.Preorder;

@Repository
public interface PreorderRepository extends JpaRepository<Preorder, Long> {

	public List<Preorder> findByBookId(long bookId);
	
	public List<Preorder> findByUserId(long userId);
	
	public Preorder findByPreorderId(long preorderId);
}
