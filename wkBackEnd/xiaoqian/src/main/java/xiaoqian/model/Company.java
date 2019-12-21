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
import java.util.List;
import java.util.Set;


@Data    

@Entity
@Table(name = "company")
public class Company {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
 
    
    // One company posted many Task_CompanySupervisor
    // CascadeType.ALL: when the company object is updated/deleted, the Task_CompanySupervisor is updated/deleted
    // Use lazy to prevent the list of Task_CompanySupervisor being fetched when the company is fetched
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "postingCompany",cascade = CascadeType.ALL)
    private List<Task_CompanySupervisor> ListOf_Task_CompanySupervisor_Posted;
    
    
    // One company posted many QuickTask
    // CascadeType.ALL: when the company object is updated/deleted, the QuickTask is updated/deleted
    // Use lazy to prevent the list of QuickTask being fetched when the company is fetched
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "postingCompany",cascade = CascadeType.ALL)
    private List<QuickTask> ListOf_QucikTask_Posted;
    
    
    // One company posted many Task_CompanyUser
    // CascadeType.ALL: when the company object is updated/deleted, the Task_CompanyUser is updated/deleted
    // Use lazy to prevent the list of Task_CompanyUser being fetched when the company is fetche    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "postingCompany",cascade = CascadeType.ALL)
    private List<Task_CompanyUser> ListOf_Task_CompanyUser_Posted;
    

    
    
    
    
    
    // Company's favorite supervisor
    // Many to many
    // Don't want delete cascade
    // That way, if company is deleted, related rows in company and middle table is delted 
    // but not the supervisor table 
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
            	CascadeType.DETACH,
                CascadeType.PERSIST,
                CascadeType.REFRESH,
                CascadeType.MERGE
            })
    @JoinTable(name = "company_favorite_supervisor",
            joinColumns = { @JoinColumn(name = "company_id") },
            inverseJoinColumns = { @JoinColumn(name = "supervisor_id") })
    private Set<Supervisor> favoriteSupervisors = new HashSet<>();
    
    
    
    
    
    // Company's favorite users
    // Many to many
    // Don't want delete cascade
    // That way, if company is deleted, related rows in company and middle table is delted 
    // but not the user table 
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
            	CascadeType.DETACH,
                CascadeType.PERSIST,
                CascadeType.REFRESH,
                CascadeType.MERGE
            })
    @JoinTable(name = "company_favorite_user",
            joinColumns = { @JoinColumn(name = "company_id") },
            inverseJoinColumns = { @JoinColumn(name = "user_id") })
    private Set<User> favoriteUsers = new HashSet<>();
    
    
    
    // Company's credit cards on file
    // Many to many
    // Don't want delete cascade
    // That way, if company is deleted, related rows in company and middle table is delted 
    // but not the creditcard table 
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
            	CascadeType.DETACH,
                CascadeType.PERSIST,
                CascadeType.REFRESH,
                CascadeType.MERGE
            })
    @JoinTable(name = "company_creditcard",
            joinColumns = { @JoinColumn(name = "company_id") },
            inverseJoinColumns = { @JoinColumn(name = "creditcard_id") })
    private Set<CreditCard> creditcards = new HashSet<>();
    
    
    
    
    
    
    
    
    
    //--------------------Reversed Below------------------


    
  

		    
}