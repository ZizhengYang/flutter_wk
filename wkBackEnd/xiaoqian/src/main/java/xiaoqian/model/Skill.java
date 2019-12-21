package xiaoqian.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import lombok.Data;

import javax.validation.constraints.Email;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


@Data    

@Entity
@Table(name = "skill")
public class Skill {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
 
	
	//------------Reversed Below--------------
	
	
	
	// Task_CompanySupervisorers that requires this skill
	@ManyToMany(fetch = FetchType.LAZY,
			cascade = {
			    CascadeType.PERSIST,
			    CascadeType.MERGE,
			    CascadeType.REFRESH,
                CascadeType.MERGE
			},
			mappedBy = "requiredSkills")
			private Set<Task_CompanySupervisor> task_CompanySupervisorThatRequiredSkill = new HashSet<>();


			
	// Task_UserSupervisorers that requires this skill
		@ManyToMany(fetch = FetchType.LAZY,
				cascade = {
				    CascadeType.PERSIST,
				    CascadeType.MERGE,
				    CascadeType.REFRESH,
	                CascadeType.MERGE
				},
				mappedBy = "requiredSkills")
				private Set<Task_UserSupervisor> task_UserSupervisorThatRequiredSkill = new HashSet<>();


				
				
	
	
	// Users Who favorite this skill
	@ManyToMany(fetch = FetchType.LAZY,
			cascade = {
			    CascadeType.PERSIST,
			    CascadeType.MERGE,
			    CascadeType.REFRESH,
                CascadeType.MERGE
			},
			mappedBy = "favoriteSkills")
			private Set<User> usersWhoFavorite = new HashSet<>();

    
	
	
	// Users Who own this skill
		@ManyToMany(fetch = FetchType.LAZY,
				cascade = {
				    CascadeType.PERSIST,
				    CascadeType.MERGE,
				    CascadeType.REFRESH,
	                CascadeType.MERGE
				},
				mappedBy = "userSkills")
				private Set<User> usersWhoOwn = new HashSet<>();

	    
	
		  // A to B : B
		  // Categories that required this skills
		 	@ManyToMany(fetch = FetchType.LAZY,
		 	cascade = {
		 	CascadeType.PERSIST,
		 	CascadeType.MERGE,
		 	CascadeType.REFRESH,
		     CascadeType.MERGE
		 	},
		 	mappedBy = "relatedSkills")
		 	private Set<Category> categoryThatRequire = new HashSet<>();

		

		 	  // A to B : B
		 	  // Task_Companyuser that require this skill
		 	 	@ManyToMany(fetch = FetchType.LAZY,
		 	 	cascade = {
		 	 	CascadeType.PERSIST,
		 	 	CascadeType.MERGE,
		 	 	CascadeType.REFRESH,
		 	     CascadeType.MERGE
		 	 	},
		 	 	mappedBy = "requiredSkills")
		 	 	private Set<Task_CompanyUser> Task_CompanyUserThatRequire = new HashSet<>();
		
	
}





