package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.lele.domain.Notice;
import net.lele.repository.NoticeRepository;

@Service
public class NoticeService {
	@Autowired
	NoticeRepository noticeRepository;

	public List<Notice> findAll() {
		return noticeRepository.findAll();
	}

	public List<Notice> findByOrderByIdDesc() {
		return noticeRepository.findByOrderByIdDesc();
	}

	public void save(Notice n) {
		Notice nn = new Notice();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		nn.setTitle(n.getTitle());
		nn.setClick(0);
		nn.setDetail(n.getDetail());
		nn.setWritedate(timestamp);
		
		noticeRepository.save(nn);

	}
	
	public Notice findById(int id) {
		return noticeRepository.findById(id);
	}
	
	public boolean hasErrors(Notice notice, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return true;
		return false;
	}
	
	public void clickupdate(int id) {
		Notice n = findById(id);
		int c = n.getClick();
		n.setClick(c+1);
		noticeRepository.save(n);
	}
}
