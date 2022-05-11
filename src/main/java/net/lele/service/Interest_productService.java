package net.lele.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Interest_product;
import net.lele.repository.Interest_productRepository;

@Service
public class Interest_productService {
	@Autowired
	Interest_productRepository ipr;

	public void deleteByProductId(int pid) {
		ipr.deleteByProductId(pid);
	}
	
	public List<Interest_product> findAll() {
		return ipr.findAll();
	}

	public int countByUserUserIdAndProductId(String uid, int pid) {
		return ipr.countByUserUserIdAndProductId(uid, pid);
	}
	
	public int countByProductId(int pid) {
		return ipr.countByProductId(pid);
	}
	
	public List<Map<Integer, Integer>> countByproductidgroup(){
		return ipr.countByproductidgroup();
	}

	/*
	 * public List<Interest_product> countByproductidgroup() {
	 * 
	 * 
	 * List<Interest_product> results = ipr.countByproductidgroup();
	 * 
	 * for (Interest_product result : results) { int id = (int) result[0]; int count
	 * = ((Number) result[1]).intValue(); }
	 * 
	 * 
	 * return ipr.countByproductidgroup(); }
	 */

	public int countByUserUserId(String uid) {
		return ipr.countByUserUserId(uid);
	}

	public void save(Interest_product i) {
		Interest_product ii = new Interest_product();
		ii.setProduct(i.getProduct());
		ii.setUser(i.getUser());
		ipr.save(ii);
	}

	public List<Interest_product> findByUserUserId(String uid) {
		return ipr.findByUserUserId(uid);
	}

	public void delete(int pid, String uid) {
		ipr.deleteByProductIdAndUserUserId(pid, uid);
	}
}
