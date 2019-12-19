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
@Table(name = "designWall")
public class DesignWall {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
	
	
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
    @JoinTable(name = "designWall_photos",
    joinColumns = { @JoinColumn(name = "designWall_id") },
    inverseJoinColumns = { @JoinColumn(name = "Photo_id") })
    private Set<Photo> photos = new HashSet<>();
    
	
	
	//-----------Reversed Below----------------

	
	
	// Reversed 
	// One userProfile one DesignWall,
    @OneToOne(fetch = FetchType.LAZY,mappedBy = "correspondDesignWall")
    private UserProfile userProfileWhoHasThisDesignWall;
    		    
}