package xiaoqian.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import lombok.Data;
import xiaoqian.model.taskDetails.Comment_C_to_S;
import xiaoqian.model.taskDetails.Comment_C_to_U;
import xiaoqian.model.taskDetails.Feedback_C_to_S;
import xiaoqian.model.taskDetails.Feedback_C_to_U;
import xiaoqian.model.taskDetails.Feedback_S_to_U;
import xiaoqian.model.taskDetails.Rating_C_to_S;
import xiaoqian.model.taskDetails.Rating_C_to_U;

import javax.validation.constraints.Email;
import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Data    

@Entity
@Table(name = "task_CompanyUser")
public class Task_CompanyUser {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
	
    

    // One Task_CompanyUser One Comment_C_to_U 
    // The Column will be the ID of Comment_C_to_U Corresponding to the Task_CompanyUser
    // cascade = CascadeType.ALL: When Task_CompanyUser is deleted/updated --> correspondComment_C_to_U is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Comment_C_to_U_id", referencedColumnName = "id")   
    private Comment_C_to_U comment_C_to_U;
    
	
	
	
    
    // One Task_CompanyUser One Rating_C_to_U 
    // The Column will be the ID of Rating_C_to_U Corresponding to the Task_CompanyUser
    // cascade = CascadeType.ALL: When Task_CompanyUser is deleted/updated --> correspondRating_C_to_U is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Rating_C_to_U_id", referencedColumnName = "id")   
    private Rating_C_to_U rating_C_to_U;
    
	
    
    

    
    // One Task_CompanyUser One Feedback_C_to_U 
    // The Column will be the ID of Feedback_C_to_U Corresponding to the Task_CompanyUser
    // cascade = CascadeType.ALL: When Task_CompanyUser is deleted/updated --> correspondFeedback_C_to_U is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Feedback_C_to_U_id", referencedColumnName = "id")   
    private Feedback_C_to_U feedback_C_to_U;
    

	
 
    //--------------------Reversed Below------------------
    
	
	
	// ??????????? Do we add cascade.all
	// can not use Cascade --> That would mean, delete task_CompanyUser will also delete company
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "postingCompany_Id")
	private Company postingCompany;
		


	
	// ??????????? Do we add cascade.all
	// can not use Cascade --> That would mean, delete task_CompanyUser will also delete user
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userOnTheTask_Id")
	private User userOnTheTask;
		
	
	
	
		// A to B : B
	  	// Users Who favorite this task_CompanyUser
	 	@ManyToMany(fetch = FetchType.LAZY,
	 	cascade = {
	 	CascadeType.PERSIST,
	 	CascadeType.MERGE,
	 	CascadeType.REFRESH,
	     CascadeType.MERGE
	 	},
	 	mappedBy = "favorite_Task_CompanyUser")
	 	private Set<User> usersWhoFavorite = new HashSet<>();


	
	
	
}