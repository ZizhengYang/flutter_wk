package xiaoqian.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

import javax.validation.constraints.Email;
import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Data    

@Entity
@Table(name = "supervisor")
public class Supervisor {
 
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
	
 
	// One Supervisor can monitor many Task_UserSupervisor As supervisor
    // CascadeType.ALL: when the user object is updated/deleted, the Task_UserSupervisor is updated/deleted
    // Use lazy to prevent the list of Task_UserSupervisor being fetched when the user is fetched
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "SupervisorOnTheTask",cascade = CascadeType.ALL)
    private List<Task_UserSupervisor> ListOfTask_UserSupervisorAsSupervisor;
    
    
    
    
    // One Supervisor can take many Task_CompanySupervisor As supervisor
    // CascadeType.ALL: when the supervisor object is updated/deleted, the Task_CompanySupervisor is updated/deleted
    // Use lazy to prevent the list of Task_CompanySupervisor being fetched when the supervisor is fetched
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "SupervisorOnTheTask",cascade = CascadeType.ALL)
    private List<Task_CompanySupervisor> ListOfTask_CompanySupervisorAsSupervisor;
    
    
    
    // A to B : A
    // Supervisor's favorite Users
    // Many to many
    // Don't want delete cascade
    // That way, if user is deleted, related rows in user and middle table is delted 
    // but not the skill table 
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
            	CascadeType.DETACH,
                CascadeType.PERSIST,
                CascadeType.REFRESH,
                CascadeType.MERGE
            })
    @JoinTable(name = "superviosr_favorite_users",
            joinColumns = { @JoinColumn(name = "supervisor_id") },
            inverseJoinColumns = { @JoinColumn(name = "user_id") })
    private Set<User> favoriteUsers = new HashSet<>();
    
    
    
    
	
	// A To B : A
    // Supervisor's favorite Task_CompanySupervisor
    // Many to many
    // Don't want delete cascade
    // That way, if user is deleted, related rows in user and middle table is delted 
    // but not the skill table 
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
            	CascadeType.DETACH,
                CascadeType.PERSIST,
                CascadeType.REFRESH,
                CascadeType.MERGE
            })
    @JoinTable(name = "supervisor_favorite_taskCompanySupervisor",
            joinColumns = { @JoinColumn(name = "supervisor_id") },
            inverseJoinColumns = { @JoinColumn(name = "task_CompanySupervisor_id") })
    private Set<Task_CompanySupervisor> favorite_Task_CompanySupervisor = new HashSet<>();
    

	
	
	//------------------------------Reversed Below---------------
	
	
	
    
    
    
	// Reverse One to one 
    // mappedBy: indicate the inverse of OneToOne relationship
    // mappedBy: with in the "", put the variable name linked
    @OneToOne(fetch = FetchType.LAZY,mappedBy = "correspondSupervisorAccount")
    private User userWhoOwnThisSupervisorAccount;
 
    
    
    

    // A to B : B
    // Companies that favorite this Supervisor
   	@ManyToMany(fetch = FetchType.LAZY,
   	cascade = {
   	CascadeType.PERSIST,
   	CascadeType.MERGE,
   	CascadeType.REFRESH,
       CascadeType.MERGE
   	},
   	mappedBy = "favoriteSupervisors")
   	private Set<Company> listOfCompanyThatFavorite = new HashSet<>();



    
    
   
    
    
    
    
}