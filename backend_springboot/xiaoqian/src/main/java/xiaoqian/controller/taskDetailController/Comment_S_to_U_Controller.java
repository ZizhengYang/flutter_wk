package xiaoqian.controller.taskDetailController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import xiaoqian.repository.ArticleRepository;
import xiaoqian.repository.SupervisorRepository;
import xiaoqian.repository.UserRepository;
import xiaoqian.repository.taskDetailRepository.Comment_C_to_S_Repository;
import xiaoqian.repository.taskDetailRepository.Comment_S_to_U_Repository;

@Controller // This means that this class is a Controller
@RequestMapping(path="/Comment_S_to_U") // This means URL's start with /demo (after Application path)
public class Comment_S_to_U_Controller {
	
	// This means to get the bean called userRepository
	// Which is auto-generated by Spring, we will use it to handle the data
	@Autowired 
	private Comment_S_to_U_Repository comment_S_to_U_Repository ;
 
	

	
}