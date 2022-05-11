package net.lele.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import net.lele.domain.Search;

public interface SearchRepository extends JpaRepository<Search, Integer> {

	@Query("SELECT new map(s.name as name, COUNT(s.name) as cnt) FROM Search s GROUP BY s.name ORDER BY cnt desc")
	List<Map<String, Integer>> Searchcount();

	/*
	 * @Query("SELECT new map(s.name as name, COUNT(s.name) as cnt) FROM Search s GROUP BY s.name"
	 * ) List<Map<String, Integer>> Searchcount(page);
	 * 
	 * Pageable page = PageRequest.of(0,5, Sort.by(Sort.Direction.DESC, "cnt"));
	 */
}
