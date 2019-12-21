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
@Table(name = "education")
public class Education {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
 
    
  
	
	// ??????????? Do we add cascade.all
	// can not use Cascade --> That would mean, delete Education will also delete Profile
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userProfile_Id")
	private UserProfile userProfileWhoOwnTheEducation;
		
		    
}