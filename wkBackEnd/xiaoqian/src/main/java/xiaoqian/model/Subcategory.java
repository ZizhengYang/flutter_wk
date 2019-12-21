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
@Table(name = "subcategory")
public class Subcategory {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
 

	// ---------Reversed below--------
	

	
	
	// ??????????? Do we add cascade.all
	// can not use Cascade --> That would mean, delete subcategory will also delete category
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parentCategory_Id")
	private Category parentCategory;
		

	  // A to B : B
	  // Users Who interested in this subcategory
	 	@ManyToMany(fetch = FetchType.LAZY,
	 	cascade = {
	 	CascadeType.PERSIST,
	 	CascadeType.MERGE,
	 	CascadeType.REFRESH,
	     CascadeType.MERGE
	 	},
	 	mappedBy = "interestedSubcategories")
	 	private Set<User> userWhoInteressted = new HashSet<>();

	
	 
	
		  // A to B : B
		  // Task_CompanyUser that is related in this subcategory
		 	@ManyToMany(fetch = FetchType.LAZY,
		 	cascade = {
		 	CascadeType.PERSIST,
		 	CascadeType.MERGE,
		 	CascadeType.REFRESH,
		     CascadeType.MERGE
		 	},
		 	mappedBy = "listOfRelatedSubcategory")
		 	private Set<Task_CompanyUser> listOfRelatedTask_CompanyUser = new HashSet<>();

		 	
		 	
		 	
		 	
			  // A to B : B
			  // Task_CompanySupervisor that is related in this subcategory
			 	@ManyToMany(fetch = FetchType.LAZY,
			 	cascade = {
			 	CascadeType.PERSIST,
			 	CascadeType.MERGE,
			 	CascadeType.REFRESH,
			     CascadeType.MERGE
			 	},
			 	mappedBy = "listOfRelatedSubcategory")
			 	private Set<Task_CompanySupervisor> listOfRelatedTask_CompanySupervisor = new HashSet<>();

			 	
			 		
			 	
				  // A to B : B
				  // Task_UserSupervisor that is related in this subcategory
				 	@ManyToMany(fetch = FetchType.LAZY,
				 	cascade = {
				 	CascadeType.PERSIST,
				 	CascadeType.MERGE,
				 	CascadeType.REFRESH,
				     CascadeType.MERGE
				 	},
				 	mappedBy = "listOfRelatedSubcategory")
				 	private Set<Task_UserSupervisor> listOfRelatedTask_UserSupervisor = new HashSet<>();

			 	
}