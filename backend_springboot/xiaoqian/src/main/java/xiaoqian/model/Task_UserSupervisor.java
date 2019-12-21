package xiaoqian.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import lombok.Data;
import xiaoqian.model.taskDetails.Comment_S_to_U;
import xiaoqian.model.taskDetails.Comment_U_to_S;
import xiaoqian.model.taskDetails.Feedback_S_to_U;
import xiaoqian.model.taskDetails.Feedback_U_to_S;
import xiaoqian.model.taskDetails.Rating_S_to_U;
import xiaoqian.model.taskDetails.Rating_U_to_S;

import javax.validation.constraints.Email;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


@Data    

@Entity
@Table(name = "task_UserSupervisor")
public class Task_UserSupervisor {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
 

 	// One task_UserSupervisor One Comment_U_to_S 
    // The Column will be the ID of Comment_U_to_S Corresponding to the task_UserSupervisor
    // cascade = CascadeType.ALL: When task_UserSupervisor is deleted/updated --> correspondComment_U_to_S is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Comment_U_to_S_id", referencedColumnName = "id")   
    private Comment_U_to_S comment_U_to_S;

    
    
 	// One task_UserSupervisor One Comment_S_to_U 
    // The Column will be the ID of Comment_S_to_U Corresponding to the task_UserSupervisor
    // cascade = CascadeType.ALL: When task_UserSupervisor is deleted/updated --> correspondComment_S_to_U is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Comment_S_to_U_id", referencedColumnName = "id")   
    private Comment_S_to_U comment_S_to_U;

    
	// One task_UserSupervisor One Rating_U_to_S 
    // The Column will be the ID of Rating_U_to_S Corresponding to the task_UserSupervisor
    // cascade = CascadeType.ALL: When task_UserSupervisor is deleted/updated --> correspondRating_U_to_S is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Rating_U_to_S_id", referencedColumnName = "id")   
    private Rating_U_to_S rating_U_to_S;
    
    

    
    // One task_UserSupervisor One Rating_S_to_U 
    // The Column will be the ID of Rating_S_to_U Corresponding to the task_UserSupervisor
    // cascade = CascadeType.ALL: When task_UserSupervisor is deleted/updated --> correspondRating_S_to_U is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Rating_S_to_U_id", referencedColumnName = "id")   
    private Rating_S_to_U rating_S_to_U;
    
    
	
	
    // One task_UserSupervisor One Feedback_U_to_S 
    // The Column will be the ID of Feedback_U_to_S Corresponding to the task_UserSupervisor
    // cascade = CascadeType.ALL: When task_UserSupervisor is deleted/updated --> correspondFeedback_U_to_S is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Feedback_U_to_S_id", referencedColumnName = "id")   
    private Feedback_U_to_S feedback_U_to_S;
    

    
    // One task_UserSupervisor One Feedback_S_to_U 
    // The Column will be the ID of Feedback_S_to_U Corresponding to the task_UserSupervisor
    // cascade = CascadeType.ALL: When task_UserSupervisor is deleted/updated --> correspondFeedback_S_to_U is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Feedback_S_to_U_id", referencedColumnName = "id")   
    private Feedback_S_to_U feedback_S_to_U;
    
	
    // Task's required skills
    // Many to many
    // Don't want delete cascade
    // That way, if task is deleted, related rows in task and middle table is deleted 
    // but not the skill table 
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
            	CascadeType.DETACH,
                CascadeType.PERSIST,
                CascadeType.REFRESH,
                CascadeType.MERGE
            })
    @JoinTable(name = "task_UserSupervisor_required_skills",
            joinColumns = { @JoinColumn(name = "task_UserSupervisor_id") },
            inverseJoinColumns = { @JoinColumn(name = "skill_id") })
    private Set<Skill> requiredSkills = new HashSet<>();
    
    
    
    // Task's related subcategories
    // Many to many
    // Don't want delete cascade
    // That way, if task is deleted, related rows in task and middle table is deleted 
    // but not the subcategory table 
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
            	CascadeType.DETACH,
                CascadeType.PERSIST,
                CascadeType.REFRESH,
                CascadeType.MERGE
            })
    @JoinTable(name = "task_UserSupervisor_related_subcategory",
            joinColumns = { @JoinColumn(name = "task_UserSupervisor_id") },
            inverseJoinColumns = { @JoinColumn(name = "subcategory_id") })
    private Set<Subcategory> listOfRelatedSubcategory = new HashSet<>();
    
	
    
    
 

	
	
	// -------------------------------------------------------- REVERSED Below !!!!!!
	
	
	// ??????????? Do we add cascade.all
	// can not use Cascade --> That would mean, delete task_UserSupervisor will also delete user
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userOnTheTask_Id")
    private User userOnTheTask;
	
	
	// ??????????? Do we add cascade.all
	// can not use Cascade --> That would mean, delete task_UserSupervisor will also delete superviosr
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SupervisorOnTheTask_Id")
	private Supervisor SupervisorOnTheTask;
		
	
	
	// ??????????? Do we add cascade.all
	// can not use Cascade --> That would mean, delete Task_UserSupervisor will also delete Task_CompanySupervisor
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "paretnt_Task_CompanySupervisor")
	private Task_CompanySupervisor FromParent_TaskCompanySupervisor;
		
	
	
	
	// Users Who favorite this task_UserSupervisor
	@ManyToMany(fetch = FetchType.LAZY,
	cascade = {
	CascadeType.PERSIST,
	CascadeType.MERGE,
	CascadeType.REFRESH,
    CascadeType.MERGE
	},
	mappedBy = "favorite_Task_UserSupervisor")
	private Set<User> usersWhoFavorite = new HashSet<>();

	    
	
}