package net.lele.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.lele.domain.Comment;
import net.lele.service.CommentService;
import net.lele.service.ProductService;
import net.lele.service.UserService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	CommentService commentService;
	@Autowired
	ProductService productService;
	@Autowired
	UserService userService;

	@RequestMapping("/list")
	@ResponseBody
	public List<Comment> CommentList(Model model, int id) throws Exception {

		return commentService.findByProductId(id);
	}

	@RequestMapping("/insert") // 댓글 작성
	@ResponseBody
	private int mCommentServiceInsert(@RequestParam int pid, @RequestParam String content, @RequestParam int uid)
			throws Exception {
		
		Comment comment = new Comment();
		comment.setProduct(productService.findById(pid));
		comment.setContent(content);
		comment.setUser(userService.findById(uid));
		
		commentService.save(comment);
		return 1;
	}
	
	@RequestMapping("/delete/{id}")
	@ResponseBody
	private int mCommentServiceDelete(@PathVariable int id) throws Exception {
		commentService.delete(id);
		return 1;
	}

}
