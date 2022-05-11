package net.lele.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Comment;
import net.lele.repository.CommentRepository;

@Service
public class CommentService {
	@Autowired
	CommentRepository commentRepository;
	
	public int countByProductId(int id) {
		return commentRepository.countByProductId(id);
	}
	
	public List<Map<Integer, Integer>> countByProductGroup(){
		return commentRepository.countByProductGroup();
	}
	
	public void deleteByProductId(int pid) {
		commentRepository.deleteByProductId(pid);
	}
	
	/*
	 * public List<Map<Integer, Integer>> countByProductgroup(){ return
	 * commentRepository.countByProductgroup(); }
	 */
	
	public List<Comment> findByProductId(int pid){
		return commentRepository.findByProductId(pid);
	}
	
	public int save(Comment c) {
		Comment co = new Comment();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		co.setContent(c.getContent());
		co.setProduct(c.getProduct());
		co.setUser(c.getUser());
		co.setWritedate(timestamp);
		
		commentRepository.save(co);
		
		int cc = co.getId();
		
		return cc;
	}
	
	public void delete(int id) {
		commentRepository.deleteById(id);
	}
}
