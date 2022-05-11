package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.State;
import net.lele.repository.StateRepository;

@Service
public class StateService {
	@Autowired
	StateRepository stateRepository;
	
	public List<State> findAll(){
		return stateRepository.findAll();
	}
}
