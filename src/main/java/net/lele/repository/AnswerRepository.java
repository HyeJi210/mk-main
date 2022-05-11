package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Answer;

public interface AnswerRepository extends JpaRepository<Answer, Integer> {
	List<Answer> findById(int id);
	
	void deleteById(int id);
	
	List<Answer> findByAskId(int id);
}
