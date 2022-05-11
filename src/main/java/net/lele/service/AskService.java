package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.lele.domain.Ask;
import net.lele.repository.AskRepository;

@Service
public class AskService {
	@Autowired
	AskRepository askRepository;

	public List<Ask> findAll() {
		return askRepository.findAll();
	}
	
	public Ask findById(int id) {
		return askRepository.findById(id);
	}
	
	public List<Ask> findByOrderByIdDesc(){
		return askRepository.findByOrderByIdDesc();
	}

	public List<Ask> findByUserUserId(String userId) {
		return askRepository.findByUserUserId(userId);
	}
	
	public List<Ask> findByUserUserIdOrderByIdDesc(String userId){
		return askRepository.findByUserUserIdOrderByIdDesc(userId);
	}

	public int countByUserUserId(String userId) {
		return askRepository.countByUserUserId(userId);
	}

	public void save(Ask ask) {
		Ask a = new Ask();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		a.setTitle(ask.getTitle());
		a.setUser(ask.getUser());
		a.setDetail(ask.getDetail());
		a.setWritedate(timestamp);

		askRepository.save(a);
	}

	public boolean hasErrors(Ask ask, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return true;
		return false;
	}
}
