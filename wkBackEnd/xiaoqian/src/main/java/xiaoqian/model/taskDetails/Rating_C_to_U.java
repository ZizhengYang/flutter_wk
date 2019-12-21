package xiaoqian.model.taskDetails;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import lombok.Data;
import xiaoqian.model.Task_CompanySupervisor;
import xiaoqian.model.Task_CompanyUser;

import javax.validation.constraints.Email;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


@Data    

@Entity
@Table(name = "rating_C_to_U")
public class Rating_C_to_U {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
	
	
	//-----------Reversed Below----------------

	
	
	// Reversed 
	// One Task_CompanyUser one comment_C_to_U,
    @OneToOne(fetch = FetchType.LAZY,mappedBy = "comment_C_to_U")
    private Task_CompanyUser task_CompanyUser;
    
}