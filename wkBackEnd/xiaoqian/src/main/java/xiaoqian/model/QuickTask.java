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
@Table(name = "quickTask")
public class QuickTask {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
	
	
    
    
    //--------------------Reversed Below------------------

	
	
	
		// ??????????? Do we add cascade.all
		// can not use Cascade --> That would mean, delete quickTask will also delete company
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name = "postingCompany_Id")
		private Company postingCompany;
			
	
	
	
		// Users Who did this article
		@ManyToMany(fetch = FetchType.LAZY,
		cascade = {
		CascadeType.PERSIST,
		CascadeType.MERGE,
		CascadeType.REFRESH,
		CascadeType.MERGE
		},
		mappedBy = "quickTaskDone")
		private Set<User> usersWhoDidTheQuickTask = new HashSet<>();

		    
}