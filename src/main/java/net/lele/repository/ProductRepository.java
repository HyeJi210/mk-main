package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import net.lele.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	List<Product> findByCategoryId(int id);
	
	List<Product> findByCategoryIdOrderByIdDesc(int id);
	
	Product findById(int id);
	
	List<Product> findTop12ByOrderByClickDesc();
	
	List<Product> findByUserId(int id);
	
	List<Product> findByUserIdOrderByIdDesc(int id);
	
	List<Product> findByTitleContains(String title);
	
	List<Product> findByUserStateName(String name);
	
	List<Product> findByUserCityName(String name);
	
	int countByUserId(int id);
	
	void deleteById(int id);
	
	@Query(nativeQuery = true, value = "select * from Product p ORDER BY id desc Limit 8")
	List<Product> findByProductlimit();
}
