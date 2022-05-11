package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Message;
import net.lele.repository.MessageRepository;

@Service
public class MessageService {
	@Autowired
	MessageRepository messageRepository;
	
	public void save(Message m) {
		Message ms = new Message();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		ms.setReceive(m.getReceive());
		ms.setDetail(m.getDetail());
		ms.setSend(m.getSend());
		ms.setTitle(m.getTitle());
		ms.setWritedate(timestamp);
		
		messageRepository.save(ms);
	}
	
	public Message findById(int id) {
		return messageRepository.findById(id);
	}
	
	public List<Message> findBySendUserId(String userId){
		return messageRepository.findBySendUserId(userId);
	}
	
	public List<Message> findBySendUserIdOrderByIdDesc(String userId){
		return messageRepository.findBySendUserIdOrderByIdDesc(userId);
	}
	
	public List<Message> findByReceiveUserIdOrderByIdDesc(String userId){
		return messageRepository.findByReceiveUserIdOrderByIdDesc(userId);
	}
	
	public int countBySendUserId(String userId) {
		return messageRepository.countBySendUserId(userId);
	}
	
	public int countByReceiveUserId(String userId) {
		return messageRepository.countByReceiveUserId(userId);
	}
}
