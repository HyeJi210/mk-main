package net.lele.controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

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
import org.springframework.beans.factory.annotation.Value;

import net.lele.domain.City;
import net.lele.domain.Interest_product;
import net.lele.domain.Search;
import net.lele.model.UserRegistrationModel;
import net.lele.service.CategoryService;
import net.lele.service.CityService;
import net.lele.service.CommentService;
import net.lele.service.Interest_productService;
import net.lele.service.NoticeService;
import net.lele.service.ProductService;
import net.lele.service.Product_imageService;
import net.lele.service.SearchService;
import net.lele.service.StateService;
import net.lele.service.UserService;
import net.lele.utils.WebCrawler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
public class ShopController {
	@Autowired
	UserService userService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;
	@Autowired
	Product_imageService product_imageService;
	@Autowired
	SearchService searchService;
	@Autowired
	Interest_productService ips;
	@Autowired
	NoticeService noticeService;
	@Autowired
	CommentService commentService;
	@Autowired
	StateService stateService;
	@Autowired
	CityService cityService;

	private static Logger logger = LoggerFactory.getLogger(ShopController.class);
    private static String driver = "com.mysql.jdbc.Driver";

    @Value("${spring.datasource.url}")
    private String url;

    @Value("${spring.datasource.username}")
    private String user;

    @Value("${spring.datasource.password}")
    private String password;

	@RequestMapping({ "/", "shop/index" })
	public String index(Model model) throws Exception {
		WebCrawler crawler = new WebCrawler();
		model.addAttribute("weather_info", crawler.getWeatherInfo());

		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("product", productService.findByProductlimit());
		model.addAttribute("product_image", product_imageService.findByProductidgroup());

		model.addAttribute("cnt", ips.countByproductidgroup());
		model.addAttribute("commentcnt", commentService.countByProductGroup());

		/* model.addAttribute("loca", usl.findAll()); */

		/* List<Object[]> results = ips.countByproductidgroup(); */
		/*
		 * for (Object[] result : results) { int id = ((Number) result[1]).intValue();
		 * int count = ((Number) result[1]).intValue(); model.addAttribute("cnt",
		 * result); }
		 */
		model.addAttribute("scnt", searchService.Searchcount());
		return "shop/index";
	}

	@RequestMapping("shop/login")
	public String login(Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		return "shop/login";
	}

	@RequestMapping(value = "shop/register", method = RequestMethod.GET)
	public String register(UserRegistrationModel userModel, Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		/*
		 * model.addAttribute("state", stateService.findAll());
		 * model.addAttribute("city", cityService.findAll());
		 */
		return "shop/register";
	}

	@RequestMapping(value = "shop/register", method = RequestMethod.POST)
	public String register(@Valid UserRegistrationModel userModel, BindingResult bindingResult, Model model)
			throws Exception {
		if (userService.hasErrors(userModel, bindingResult)) {
			model.addAttribute("category", categoryService.findAll());
			return "shop/register";
		}
		userService.save(userModel);
		return "redirect:index";
	}

	@RequestMapping("shop/category/{id}")
	public String category(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("idd", id);
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("product", productService.findByCategoryIdOrderByIdDesc(id));
		/*
		 * model.addAttribute("pcnt",
		 * ips.countByProductId(productService.findById(id)));
		 */
		/* model.addAttribute("test", commentService.countByProductgroup()); */
		
		model.addAttribute("cnt", ips.countByproductidgroup());
		model.addAttribute("commentcnt", commentService.countByProductGroup());
		model.addAttribute("product_image", product_imageService.findByProductidgroup());
		/* model.addAttribute("loca", usl.findAll()); */
		return "shop/category";
	}

	@RequestMapping("shop/product/{id}")
	public String product(@PathVariable("id") int id, Interest_product i, Model model) throws Exception {
		productService.clickupdate(id);
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();

		model.addAttribute("interest", ips.countByUserUserIdAndProductId(userId, id));
		model.addAttribute("pcnt", ips.countByProductId(id));
		model.addAttribute("idd", id);
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("p", productService.findById(id));
		model.addAttribute("pi", product_imageService.findByProductid(id));
		model.addAttribute("ccnt", commentService.countByProductId(id));
		return "shop/product";
	}

	@RequestMapping("shop/users/{id}")
	public String users(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("idd", id);
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("user", userService.findById(id));
		model.addAttribute("product", productService.findByUserIdOrderByIdDesc(id));
		model.addAttribute("pcount", productService.countByUserId(id));
		model.addAttribute("product_image", product_imageService.findByProductidgroup());
		model.addAttribute("commentcnt", commentService.countByProductGroup());
		model.addAttribute("cnt", ips.countByproductidgroup());
		/* model.addAttribute("loca", usl.findAll()); */
		return "shop/users";
	}

	@RequestMapping(value = "shop/search")
	public String search(@RequestParam("word") String word, Model model) throws Exception {
		if (word != "") {
			Search s = new Search();
			s.setName(word);
			searchService.save(s);
		}

		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("list", productService.findByTitleContains(word));
		model.addAttribute("product_image", product_imageService.findByProductidgroup());
		return "shop/search";
	}

	@RequestMapping(value = "shop/searchUser")
	public String searchUser(@RequestParam("word") String word, Model model) throws Exception {

		ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();

		if(word != "") {
			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url, user, password);

				if (!con.isClosed())
					System.out.println("Connect to database successfully.");

				Statement statement = con.createStatement();
				String sql = "select * from user where nickname like '%" + word + "%'";
				logger.info(sql);
				ResultSet rs = statement.executeQuery(sql);
				
				while (rs.next()) {
					ArrayList<String> line = new ArrayList<String>();

					Integer res_id = rs.getInt("id");
					line.add(Integer.toString(res_id));

					String res_name = rs.getString("nickname");
					line.add(res_name);

					String res_addr = rs.getString("address");
					line.add(res_addr);

					String info = String.format("%d %s %s\n", res_id, res_name, res_addr);
					
					list.add(line);
	
					logger.info(info);
				}
				rs.close();
				con.close();

			} catch (ClassNotFoundException e) {
				logger.error("Sorry, can`t find the Driver!");

			} catch (SQLException e) {
				logger.error(e.toString());
				ArrayList<String> line = new ArrayList<String>();
				String info = e.toString();
				line.add(info);
				list.add(line);
			}
		}

		model.addAttribute("list", list);
		
		return "shop/searchUser";
	}


	@RequestMapping(value = "shop/product/{id}", method = RequestMethod.POST)
	public String product(@PathVariable("id") int id, Model model, Interest_product i, BindingResult bindingResult)
			throws Exception {
		ips.save(i);
		return "redirect:/shop/product/{id}";
	}

	@RequestMapping(value = "shop/pdelete/{id}")
	public String pdelete(@PathVariable("id") int id, Model model) {
		ips.deleteByProductId(id);
		commentService.deleteByProductId(id);
		product_imageService.deleteByProductid(id);
		productService.deleteById(id);
		return "redirect:/shop/index";
	}

	@RequestMapping(value = "shop/delete/{id}")
	public String delete(@PathVariable("id") int id, Model model) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();

		ips.delete(id, userId);
		model.addAttribute("category", categoryService.findAll());
		return "redirect:/shop/product/{id}";
	}

	@RequestMapping("shop/notice")
	public String notice(Model model) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("notice", noticeService.findByOrderByIdDesc());
		return "shop/notice";
	}

	@RequestMapping("shop/noticedetail/{id}")
	public String noticedetail(@PathVariable("id") int id, Model model) throws Exception {
		noticeService.clickupdate(id);
		model.addAttribute("notice", noticeService.findById(id));
		model.addAttribute("category", categoryService.findAll());
		return "shop/noticedetail";
	}

	@RequestMapping("shop/hotproduct")
	public String hotproduct(Model model) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("state", stateService.findAll());
		model.addAttribute("product", productService.findByOrderByClickDesc());
		model.addAttribute("product_image", product_imageService.findByProductidgroup());
		model.addAttribute("cnt", ips.countByproductidgroup());
		model.addAttribute("commentcnt", commentService.countByProductGroup());
		model.addAttribute("scnt", searchService.Searchcount());
		/* model.addAttribute("loca", usl.findAll()); */

		model.addAttribute("state", stateService.findAll());

		return "shop/hotproduct";
	}

	@RequestMapping("shop/region/{state}")
	public String region(@PathVariable("state") String state, Model model) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("s", stateService.findAll());
		model.addAttribute("product", productService.findByUserStateName(state));
		model.addAttribute("product_image", product_imageService.findByProductidgroup());
		model.addAttribute("cnt", ips.countByproductidgroup());
		model.addAttribute("commentcnt", commentService.countByProductGroup());
		model.addAttribute("scnt", searchService.Searchcount());
		model.addAttribute("city", cityService.findByStateName(state));
		model.addAttribute("stst", state);
		return "shop/region";
	}
	
	@RequestMapping("shop/loca")
	@ResponseBody
	public List<City> loca(@RequestParam int state, Model model) {
		
		return cityService.findByStateId(state);
	}

	@RequestMapping("shop/region/{state}/{city}")
	public String region(@PathVariable("state") String state, @PathVariable("city") String city, Model model) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("s", stateService.findAll());
		model.addAttribute("product", productService.findByUserCityName(city));
		model.addAttribute("product_image", product_imageService.findByProductidgroup());
		model.addAttribute("cnt", ips.countByproductidgroup());
		model.addAttribute("commentcnt", commentService.countByProductGroup());
		model.addAttribute("scnt", searchService.Searchcount());
		model.addAttribute("city", cityService.findByStateName(state));
		model.addAttribute("stst", state);
		model.addAttribute("ctct",city);
		return "shop/region";
	}
}