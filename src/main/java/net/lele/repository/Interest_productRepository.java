package net.lele.repository;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import net.lele.domain.Interest_product;

public interface Interest_productRepository extends JpaRepository<Interest_product, Integer> {
	int countByUserUserIdAndProductId(String uid, int pid);

	@Modifying
	@Transactional
	void deleteByProductIdAndUserUserId(int pid, String uid);

	List<Interest_product> findByUserUserId(String uid);

	int countByUserUserId(String uid);

	int countByProductId(int pid);

	@Query("SELECT new map(i.product.id as id, COUNT(i.product.id) as cnt) "
			+ "FROM Interest_product i GROUP BY i.product")
	List<Map<Integer, Integer>> countByproductidgroup();
	
	@Modifying
	@Transactional
	void deleteByProductId(int pid);
}
