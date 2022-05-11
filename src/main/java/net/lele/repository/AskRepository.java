package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Ask;

public interface AskRepository extends JpaRepository<Ask, Integer> {
	List<Ask> findByUserUserId(String userId);
	
	int countByUserUserId(String userId);
	
	List<Ask> findByUserUserIdOrderByIdDesc(String userId);
	
	List<Ask> findByOrderByIdDesc();
	
	Ask findById(int id);
}
