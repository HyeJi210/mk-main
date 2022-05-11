package net.lele.controller;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import net.lele.domain.Ask;
import net.lele.domain.Category;
import net.lele.domain.City;
import net.lele.domain.Message;
import net.lele.domain.Product;
import net.lele.domain.Product_image;
import net.lele.domain.State;
import net.lele.domain.User;
import net.lele.repository.ProductRepository;
import net.lele.repository.UserRepository;
import net.lele.service.AskService;
import net.lele.service.CategoryService;
import net.lele.service.CityService;
import net.lele.service.CommentService;
import net.lele.service.Interest_productService;
import net.lele.service.MessageService;
import net.lele.service.ProductService;
import net.lele.service.Product_imageService;
import net.lele.service.StateService;
import net.lele.service.UserService;
import net.lele.utils.EncryptionUtils;
import net.lele.utils.UploadFileUtils;

@Controller
public class UserController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	Product_imageService product_imageService;
	@Autowired
	ProductService productService;
	@Autowired
	ProductRepository productrepository;
	@Autowired
	Interest_productService ips;
	@Autowired
	AskService askService;
	@Autowired
	StateService stateService;
	@Autowired
	CityService cityService;
	@Autowired
	UserService userService;
	@Autowired
	UserRepository userRepository;
	@Autowired
	MessageService messageService;
	@Autowired
	CommentService commentService;

	/* (각자) 파일 업로드 경로 변경 (0506)*/
	private String uploadPath = "C:/Users/test/Downloads/mk-main_220505_수정/mk-main/src/main/resources/static/images";

	@RequestMapping(value = "user/location")
	public String location(Model model) throws Exception {
		/*
		 * String userId =
		 * SecurityContextHolder.getContext().getAuthentication().getName();
		 */
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("state", stateService.findAll());
		return "user/location";
	}

	@RequestMapping("user/loca")
	@ResponseBody
	public List<City> loca(@RequestParam int state, Model model) {
		return cityService.findByStateId(state);
	}

	@RequestMapping(value = "user/location", method = RequestMethod.POST)
	public String location(HttpServletRequest request, Model model) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		User u = userService.findByUserId(userId);

		String s = request.getParameter("state");
		int state = Integer.parseInt(s);
		State ss = new State();
		ss.setId(state);

		String c = request.getParameter("city");
		int city = Integer.parseInt(c);
		City cc = new City();
		cc.setId(city);

		u.setState(ss);
		u.setCity(cc);
		userRepository.save(u);

		return "redirect:/shop/index";
	}

	@RequestMapping(value = "user/interest")
	public String interest(Model model) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		model.addAttribute("count", ips.countByUserUserId(userId));
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("interest", ips.findByUserUserId(userId));
		model.addAttribute("product_image", product_imageService.findByProductidgroup());
		
		model.addAttribute("cnt", ips.countByproductidgroup());
		model.addAttribute("commentcnt", commentService.countByProductGroup());
		return "user/interest";
	}

	@RequestMapping(value = "user/write")
	public String write(Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());

		return "user/write";
	}

	@RequestMapping(value = "user/fileinsert")
	public String fileinsert(HttpServletRequest request, MultipartHttpServletRequest mtfRequest, Model model)
			throws Exception {
		Product p = new Product();
		Product_image file = new Product_image();

		String ca = request.getParameter("category");
		int category = Integer.parseInt(ca);
		String us = request.getParameter("userid");
		int use = Integer.parseInt(us);

		Category cate = new Category();
		cate.setId(category);

		User u = new User();
		u.setId(use);

		p.setUser(u);
		p.setCategory(cate);
		p.setDetail(request.getParameter("detail"));
		p.setPrice(Integer.parseInt(request.getParameter("price")));
		p.setTitle(request.getParameter("title"));

		p.setId(productService.save(p));
		productrepository.flush();

		List<MultipartFile> fileList = mtfRequest.getFiles("files");

		String imgUploadPath = uploadPath;

		for (MultipartFile fi : fileList) {
			String sourceFileName = fi.getOriginalFilename();
			String fileName = null;
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			fileName = UploadFileUtils.fileUpload(imgUploadPath, sourceFileName, fi.getBytes(), ymdPath);

			file.setFilename(fileName);
			file.setProductid(p.getId());
			file.setFileOriName(sourceFileName);
			file.setFileurl(imgUploadPath);

			product_imageService.save(file);
		}

		/*
		 * String sourceFileName = files.getOriginalFilename(); String imgUploadPath =
		 * uploadPath; String ymdPath = UploadFileUtils.calcPath(imgUploadPath); String
		 * fileName = null;
		 * 
		 * fileName = UploadFileUtils.fileUpload(imgUploadPath, sourceFileName,
		 * files.getBytes(), ymdPath);
		 * 
		 * file.setFilename(fileName); file.setProductid(p.getId());
		 * file.setFileOriName(sourceFileName); file.setFileurl(imgUploadPath);
		 * 
		 * product_imageService.save(file);
		 */

		return "redirect:/shop/index";
	}

	@RequestMapping("user/asklist")
	public String asklist(Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		model.addAttribute("asklist", askService.findByUserUserIdOrderByIdDesc(userId));
		model.addAttribute("acnt", askService.countByUserUserId(userId));
		return "user/asklist";
	}

	@RequestMapping("user/ask")
	public String ask(Model model, Ask ask) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		return "user/ask";
	}

	@RequestMapping(value = "user/ask", method = RequestMethod.POST)
	public String ask(Model model, Ask ask, BindingResult bindingResult) throws Exception {
		askService.save(ask);
		return "redirect:/user/asklist";
	}

	@RequestMapping("user/askdetail/{id}")
	public String askdetail(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("ask", askService.findById(id));
		model.addAttribute("idd", id);
		return "user/askdetail";
	}

	@RequestMapping("user/message/{nickname}")
	public String message(@PathVariable("nickname") String nickname, Message message, Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("receiveU", userService.findByNickname(nickname));
		return "user/message";
	}

	@RequestMapping(value = "user/message/{nickname}", method = RequestMethod.POST)
	public String message(@PathVariable("nickname") String nickname, Model model, Message message) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		User sendU = userService.findByUserId(userId);
		User receU = userService.findByNickname(nickname);

		Message m = new Message();
		m.setSend(sendU);
		m.setReceive(receU);
		m.setTitle(message.getTitle());
		m.setDetail(message.getDetail());

		messageService.save(m);
		return "redirect:/user/msg/send";
	}

	@RequestMapping("user/msg/send")
	public String msgsend(Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		model.addAttribute("send", messageService.findBySendUserIdOrderByIdDesc(userId));
		model.addAttribute("cnt", messageService.countBySendUserId(userId));
		return "user/msg/send";
	}

	@RequestMapping("user/msg/receive")
	public String msgreceive(Model model) {
		model.addAttribute("category", categoryService.findAll());
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		model.addAttribute("receive", messageService.findByReceiveUserIdOrderByIdDesc(userId));
		model.addAttribute("cnt", messageService.countByReceiveUserId(userId));

		return "user/msg/receive";
	}

	@RequestMapping("user/msg/smsg/{id}")
	public String sendmsg(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("m", messageService.findById(id));

		return "user/msg/smsg";
	}

	@RequestMapping("user/msg/rmsg/{id}")
	public String recmsg(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("m", messageService.findById(id));

		return "user/msg/rmsg";
	}

	@RequestMapping(value = "user/changepw")
	public String change_pw(HttpServletRequest request, Model model) throws Exception {
	   
	   if( request.getParameter("passwd") != null ) {
			String userId = SecurityContextHolder.getContext().getAuthentication().getName();
			User u = userService.findByUserId(userId);
		
			String pw = request.getParameter("passwd");
			String enc_pw = EncryptionUtils.encryptMD5(pw);
	 
			u.setPassword(enc_pw);
			userRepository.save(u);
	   }
	   
	   return "user/changepw";
	}

}