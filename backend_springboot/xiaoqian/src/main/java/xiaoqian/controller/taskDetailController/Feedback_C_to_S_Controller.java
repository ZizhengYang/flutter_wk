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
import xiaoqian.repository.taskDetailRepository.Comment_U_to_S_Repository;
import xiaoqian.repository.taskDetailRepository.Feedback_C_to_S_Repository;

@Controller // This means that this class is a Controller
@RequestMapping(path="/Feedback_C_to_S") // This means URL's start with /demo (after Application path)
public class Feedback_C_to_S_Controller {
	
	// This means to get the bean called userRepository
	// Which is auto-generated by Spring, we will use it to handle the data
	@Autowired 
	private Feedback_C_to_S_Repository feedback_C_to_S_Repository ;
 
	

	
}