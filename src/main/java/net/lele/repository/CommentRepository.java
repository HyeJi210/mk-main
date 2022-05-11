package net.lele.repository;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import net.lele.domain.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
	int countByProductId(int pid);
	
	List<Comment> findByProductId(int pid);
	
	void deleteById(int id);
	
	@Modifying
	@Transactional
	void deleteByProductId(int id);
	
	@Query("select new map(c.product.id as id, count(c.product.id) as cnt)"
			+ "from Comment c GROUP BY c.product")
	List<Map<Integer, Integer>> countByProductGroup();
	
	/*
	 * @Query(nativeQuery = true,
	 * value="select new map(c.product.id) as cnt, p.id as id FROM Product p" +
	 * "left join Comment c ON p.id = c.product.id" + "GROUP BY p.id")
	 * List<Map<Integer, Integer>> countByProductgroup();
	 */
}
