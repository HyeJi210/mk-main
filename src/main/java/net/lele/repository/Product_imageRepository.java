package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import net.lele.domain.Product_image;

public interface Product_imageRepository extends JpaRepository<Product_image, Integer> {
	List<Product_image> findByProductid(int id);

	int countByProductid(int id);
	
	@Query(nativeQuery = true, value = "select * from Product_image p GROUP BY productid")
	List<Product_image> findByProductidgroup();
	
	@Modifying
	@Transactional
	void deleteByProductid(int pid);
}
