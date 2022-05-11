package net.lele.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.lele.domain.Answer;
import net.lele.service.AnswerService;
import net.lele.service.AskService;

@Controller
@RequestMapping("/answer")
public class AnswerController {
	@Autowired
	AnswerService answerService;
	@Autowired
	AskService askService;

	@RequestMapping("/list")
	@ResponseBody
	private List<Answer> mAnswerServiceList(Model model, int id) throws Exception {

		return answerService.findByAskId(id);
	}

	@RequestMapping("/insert")
	@ResponseBody
	private int mAnswerServiceInsert(@RequestParam int ask, @RequestParam String content) throws Exception {
		Answer answer = new Answer();
		answer.setAsk(askService.findById(ask));
		answer.setContent(content);
		
		answerService.save(answer);
		return 1;
	}
	
	@RequestMapping("/delete/{id}")
	@ResponseBody
	private int mCommentServiceDelete(@PathVariable int id) throws Exception {
		answerService.delete(id);
		return 1;
	}
}
