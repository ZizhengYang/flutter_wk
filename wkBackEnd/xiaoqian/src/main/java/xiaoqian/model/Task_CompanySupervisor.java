package xiaoqian.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import lombok.Data;
import xiaoqian.model.taskDetails.Comment_C_to_S;
import xiaoqian.model.taskDetails.Feedback_C_to_S;
import xiaoqian.model.taskDetails.Feedback_S_to_U;
import xiaoqian.model.taskDetails.Rating_C_to_S;

import javax.validation.constraints.Email;
import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Data    

@Entity
@Table(name = "task_CompanySupervisor")
public class Task_CompanySupervisor {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
	
	
	  
    // One task_CompanySupervisor One Comment_C_to_S 
    // The Column will be the ID of Comment_C_to_S Corresponding to the task_CompanySupervisor
    // cascade = CascadeType.ALL: When task_CompanySupervisor is deleted/updated --> correspondComment_C_to_S is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Comment_C_to_S_id", referencedColumnName = "id")   
    private Comment_C_to_S comment_C_to_S;
    
	
	
    
	
    
    // One task_CompanySupervisor One Rating_C_to_S 
    // The Column will be the ID of Rating_C_to_S Corresponding to the task_CompanySupervisor
    // cascade = CascadeType.ALL: When task_CompanySupervisor is deleted/updated --> correspondRating_C_to_S is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Rating_C_to_S_id", referencedColumnName = "id")   
    private Rating_C_to_S rating_C_to_S;
    
	
    
    
    
    
    // One task_CompanySupervisor One Feedback_C_to_S 
    // The Column will be the ID of Feedback_C_to_S Corresponding to the task_CompanySupervisor
    // cascade = CascadeType.ALL: When task_CompanySupervisor is deleted/updated --> correspondFeedback_C_to_S is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "Feedback_C_to_S_id", referencedColumnName = "id")   
    private Feedback_C_to_S feedback_C_to_S;
    
    
    
    
    
    
	
    // One task_CompanySupervisor split into many task_UserSupervisor
    // CascadeType.ALL: when the task_CompanySupervisor object is updated/deleted, the task_UserSupervisor is updated/deleted
    // Use lazy to prevent the list of task_UserSupervisor being fetched when the task_CompanySupervisor is fetched
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "FromParent_TaskCompanySupervisor",cascade = CascadeType.ALL)
    private List<Task_UserSupervisor> ListOf_task_UserSupervisor_SplitInto;
    
	
	
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
    @JoinTable(name = "task_CompanySupervisor_required_skills",
            joinColumns = { @JoinColumn(name = "task_CompanySupervisor_id") },
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
    @JoinTable(name = "task_CompanySupervisor_related_subcategory",
            joinColumns = { @JoinColumn(name = "task_ComapnySupervisor_id") },
            inverseJoinColumns = { @JoinColumn(name = "subcategory_id") })
    private Set<Subcategory> listOfRelatedSubcategory = new HashSet<>();
    
	
    
	
	
	
 
    //--------------------Reversed Below------------------
    
	// ??????????? Do we add cascade.all
	// can not use Cascade --> That would mean, delete task_UserSupervisor will also delete user
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SupervisorOnTheTask_Id")
    private Supervisor SupervisorOnTheTask;
	
	
	// ??????????? Do we add cascade.all
	// can not use Cascade --> That would mean, delete Education will also delete Profile
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "postingCompany_Id")
	private Company postingCompany;
		


	
	// Supervisor Who favorite this task_CompanySupervisor
	@ManyToMany(fetch = FetchType.LAZY,
	cascade = {
	CascadeType.PERSIST,
	CascadeType.MERGE,
	CascadeType.REFRESH,
    CascadeType.MERGE
	},
	mappedBy = "favorite_Task_CompanySupervisor")
	private Set<Supervisor> SupervisorsWhoFavorite = new HashSet<>();

	    
	
}