package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Product;
import net.lele.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	ProductRepository productRepository;
	
	public void clickupdate(int id) {
		Product p = findById(id);
		int c = p.getClick();
		p.setClick(c+1);
		productRepository.save(p);
	}
	
	public void deleteById(int id) {
		productRepository.deleteById(id);
	}
	
	public Product findById(int id) {
		return productRepository.findById(id);
	}
	
	public int countByUserId(int id) {
		return productRepository.countByUserId(id);
	}
	
	public List<Product> findByUserId(int id){
		return productRepository.findByUserId(id);
	}
	
	public List<Product> findByOrderByClickDesc(){
		return productRepository.findTop12ByOrderByClickDesc();
	}
	
	public List<Product> findByTitleContains(String title){
		return productRepository.findByTitleContains(title);
	}
	
	public List<Product> findByUserIdOrderByIdDesc(int id){
		return productRepository.findByUserIdOrderByIdDesc(id);
	}
	
	public List<Product> findByProductlimit(){
		return productRepository.findByProductlimit();
	}
	
	public List<Product> findAll(){
		return productRepository.findAll();
	}
	
	public List<Product> findByCategoryId(int id){
		return productRepository.findByCategoryId(id);
	}
	
	public List<Product> findByCategoryIdOrderByIdDesc(int id){
		return productRepository.findByCategoryIdOrderByIdDesc(id);
	}
	
	public List<Product> findByUserStateName(String name){
		return productRepository.findByUserStateName(name);
	}
	
	public List<Product> findByUserCityName(String name){
		return productRepository.findByUserCityName(name);
	}
	
	@Transactional
	public int save(Product product) {
		Product p = new Product();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        
		p.setId(product.getId());
		p.setCategory(product.getCategory());
		p.setDetail(product.getDetail());
		p.setPrice(product.getPrice());
		p.setTitle(product.getTitle());
		p.setUser(product.getUser());
		p.setWritedate(timestamp);
		p.setClick(0);
		productRepository.save(p);
		
		int i = p.getId();
		
		return i;
	}
}
