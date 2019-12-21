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



// !!!!!!!! remember to test all the savings
// ?????? Test if student is deleted, will the skill still have that student
// !!!!!! use persist to save

@Data            // With @Data, we don't need to write getter,setters

@Entity
@Table(name = "user")
public class User {
     
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

//    These are the constrains can be used on the attributes    
//    @NotNull
//    @Email
//    @Size(max = 100)
//    @Column(unique = true)
//    private String email;
    
    
    
    
    // A to B 
    // One to One 
    // Add cascade.all to B
    // If B is deleted then A is deleted
    // It's fine in our case since we will never delte B
    // We always deleted B by going from A
    // Delete A.B
    
    
    
    // fetchType.lazy: This piece of info will not show up, unless we specific call the method to obtain it 
    // cascade = CascadeType.ALL: related objects will be deleted, updated if Users is deleted or updated
    // Whoever owns the @JoinColumn within the relationship will have the 
    // primary key of the other object
    // cascade = CascadeType.ALL: When User is deleted/updated --> correspondSupervisorAccount is deleted/updated
    // @JoinColumn - name : the name of the column in the database
    // @JoinColumn - referencedColumnName: reference which attribute in Supervisor
    // One User One Supervisor As Corresponding Supervisor Account
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "correspondSupervisorAccount_id", referencedColumnName = "id")   
    private Supervisor correspondSupervisorAccount;
 
    
    // One User One UserProfile 
    // The Column will be the ID of the user profile Corresponding to the user
    // cascade = CascadeType.ALL: When User is deleted/updated --> correspondUserProfile is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "correspondUserProfile_id", referencedColumnName = "id")   
    private UserProfile correspondUserProfile;
 
    
    
    // One user posted many Article
    // CascadeType.ALL: when the user object is updated/deleted, the article is updated/deleted
    // Use lazy to prevent the list of article being fetched when the user is fetched
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userWhoPostedTheArticle",cascade = CascadeType.ALL)
    private List<Article> articlesPosted;
    
    

    // One user can do many Task_UserSupervisor As user
    // CascadeType.ALL: when the user object is updated/deleted, the Task_UserSupervisor is updated/deleted
    // Use lazy to prevent the list of Task_UserSupervisor being fetched when the user is fetched
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userOnTheTask",cascade = CascadeType.ALL)
    private List<Task_UserSupervisor> ListOfTask_UserSupervisorAsUser;
    

    // One user can do many Task_CompanyUser As user
    // CascadeType.ALL: when the user object is updated/deleted, the Task_CompanyUser is updated/deleted
    // Use lazy to prevent the list of Task_CompanyUser being fetched when the user is fetched
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userOnTheTask",cascade = CascadeType.ALL)
    private List<Task_CompanyUser> ListOfTask_CompanyUserAsUser;
    

    
    // User's favorite skills
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
    @JoinTable(name = "user_favorite_skills",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "skill_id") })
    private Set<Skill> favoriteSkills = new HashSet<>();
    
    
    
    // User's skills
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
    @JoinTable(name = "user_own_skills",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "skill_id") })
    private Set<Skill> userSkills = new HashSet<>();

    
    

    // User's favorite articles
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
    @JoinTable(name = "user_favorite_articles",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "article_id") })
    private Set<Skill> favoriteArticles = new HashSet<>();
    


    
    
    // User's creditcards
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
    @JoinTable(name = "user_creditcard",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "creditcard_id") })
    private Set<CreditCard> creditCards = new HashSet<>();
    
    
   
    
    // User's quick task done
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
    @JoinTable(name = "user_quickTask",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "quickTask_id") })
    private Set<QuickTask> quickTaskDone = new HashSet<>();
    

    
    // User's favorite Task_UserSupervisor
    // Many to many
    // Don't want delete cascade
    // That way, if user is deleted, related rows in user and middle table is delted 
    // but not the Task_UserSupervisor table 
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
            	CascadeType.DETACH,
                CascadeType.PERSIST,
                CascadeType.REFRESH,
                CascadeType.MERGE
            })
    @JoinTable(name = "user_favorite_taskUserSupervisor",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "task_UserSupervisor_id") })
    private Set<Task_UserSupervisor> favorite_Task_UserSupervisor = new HashSet<>();
    

    // User's favorite Task_CompanyUser
    // Many to many
    // Don't want delete cascade
    // That way, if user is deleted, related rows in user and middle table is deleted 
    // but not the Task_CompanyUser table 
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
            	CascadeType.DETACH,
                CascadeType.PERSIST,
                CascadeType.REFRESH,
                CascadeType.MERGE
            })
    @JoinTable(name = "user_favorite_taskCompanyUser",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "task_CompanyUser_id") })
    private Set<Task_CompanyUser> favorite_Task_CompanyUser = new HashSet<>();
    

    // User's interested field/subcategory
    // Many to many
    // Don't want delete cascade
    // That way, if user is deleted, related rows in user and middle table is delted 
    // but not the subcategory table 
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
            	CascadeType.DETACH,
                CascadeType.PERSIST,
                CascadeType.REFRESH,
                CascadeType.MERGE
            })
    @JoinTable(name = "user_interested_subcategories",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "subcategory_id") })
    private Set<Subcategory> interestedSubcategories = new HashSet<>();
    

    
    
    
    
    
	//------------------------------Reversed Below---------------

    
 
    
    
    
    	// A to B : B
	   	// Supervisors who liked the user
	 	@ManyToMany(fetch = FetchType.LAZY,
	 	cascade = {
	 	CascadeType.PERSIST,
	 	CascadeType.MERGE,
	 	CascadeType.REFRESH,
	     CascadeType.MERGE
	 	},
	 	mappedBy = "favoriteUsers")
	 	private Set<Supervisor> supervisorWhoFavorite = new HashSet<>();

 	    
	 	
	 	
	 	// A to B : B
	 	// Companies who liked the user
 	 	@ManyToMany(fetch = FetchType.LAZY,
 	 	cascade = {
 	 	CascadeType.PERSIST,
 	 	CascadeType.MERGE,
 	 	CascadeType.REFRESH,
 	     CascadeType.MERGE
 	 	},
 	 	mappedBy = "favoriteUsers")
 	 	private Set<Company> listOfCompanyThatFavorite = new HashSet<>();



}
    
    
    
