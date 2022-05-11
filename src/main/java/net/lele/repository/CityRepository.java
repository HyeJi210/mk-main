package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.City;

public interface CityRepository extends JpaRepository<City, Integer> {
	List<City> findByStateId(int id);
	
	List<City> findByStateName(String name);
}
