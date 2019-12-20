package xiaoqian.model.taskDetails;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import lombok.Data;
import xiaoqian.model.Task_UserSupervisor;

import javax.validation.constraints.Email;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


@Data    

@Entity
@Table(name = "comment_U_to_S")
public class Comment_U_to_S {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
	
	
	//-----------Reversed Below----------------

	
	
	// Reversed 
	// One Task_UserSupervisor one comment_U_to_S,
    @OneToOne(fetch = FetchType.LAZY,mappedBy = "comment_U_to_S")
    private Task_UserSupervisor task_UserSupervisor;
    		    
}