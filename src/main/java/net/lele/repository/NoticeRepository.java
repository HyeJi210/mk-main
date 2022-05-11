package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Integer> {
	List<Notice> findByOrderByIdDesc();
	
	Notice findById(int id);
}
