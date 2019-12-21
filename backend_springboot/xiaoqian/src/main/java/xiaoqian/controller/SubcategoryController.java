package xiaoqian.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import xiaoqian.repository.ArticleRepository;
import xiaoqian.repository.SkillRepository;
import xiaoqian.repository.SubcategoryRepository;
import xiaoqian.repository.SupervisorRepository;
import xiaoqian.repository.UserRepository;

@Controller // This means that this class is a Controller
@RequestMapping(path="/subcategory") // This means URL's start with /demo (after Application path)
public class SubcategoryController {
	
	// This means to get the bean called userRepository
	// Which is auto-generated by Spring, we will use it to handle the data
	@Autowired 
	private SubcategoryRepository subcategoryRepository ;
 
	
}