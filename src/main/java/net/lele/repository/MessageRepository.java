package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Message;

public interface MessageRepository extends JpaRepository<Message, Integer> {
	List<Message> findBySendUserId(String userId);
	
	List<Message> findBySendUserIdOrderByIdDesc(String userId);
	
	List<Message> findByReceiveUserIdOrderByIdDesc(String userId);
	
	int countBySendUserId(String userId);
	
	int countByReceiveUserId(String userId);
	
	Message findById(int id);
}
