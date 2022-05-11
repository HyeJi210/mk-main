package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.City;
import net.lele.repository.CityRepository;

@Service
public class CityService {
	@Autowired
	CityRepository cityRepository;
	
	public List<City> findAll(){
		return cityRepository.findAll();
	}
	
	public List<City> findByStateId(int id){
		return cityRepository.findByStateId(id);
	}
	
	public List<City> findByStateName(String name){
		return cityRepository.findByStateName(name);
	}
}
