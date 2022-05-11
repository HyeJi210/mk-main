package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Answer;
import net.lele.repository.AnswerRepository;

@Service
public class AnswerService {
	@Autowired
	AnswerRepository answerRepository;
	
	public List<Answer> findById(int id){
		return answerRepository.findById(id);
	}
	
	public List<Answer> findByAskId(int id){
		return answerRepository.findByAskId(id);
	}
	
	public void save(Answer a) {
		Answer an = new Answer();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		an.setAsk(a.getAsk());
		an.setContent(a.getContent());
		an.setWritedate(timestamp);
		
		answerRepository.save(an);
	}
	
	public void delete(int id) {
		answerRepository.deleteById(id);
	}
}
