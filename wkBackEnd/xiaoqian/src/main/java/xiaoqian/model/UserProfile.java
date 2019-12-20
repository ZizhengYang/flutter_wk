package xiaoqian.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

import javax.validation.constraints.Email;
import java.io.Serializable;
import java.util.List;


@Data    

@Entity
@Table(name = "userProfile")
public class UserProfile {
 
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
 
	 
    // One UserProfile One DesignWall 
    // cascade = CascadeType.ALL: When UserProfile is deleted/updated --> correspondDesignWall is deleted/updated
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)    
    @JoinColumn(name = "correspondDesignWall_id", referencedColumnName = "id")   
    private DesignWall correspondDesignWall;
 
    
    // One userProfile has many Educations
    // CascadeType.ALL: when the userprofile object is updated/deleted, the education is updated/deleted
    // Use lazy to prevent the list of education being fetched when the userprofile is fetched
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userProfileWhoOwnTheEducation",cascade = CascadeType.ALL)
    private List<Education> listOfEducations;
    
    
    // One userProfile has many Experience
    // CascadeType.ALL: when the userprofile object is updated/deleted, the Experience is updated/deleted
    // Use lazy to prevent the list of education being fetched when the userprofile is fetched
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userProfileWhoOwnTheExperience",cascade = CascadeType.ALL)
    private List<Experience> listOfExperiences;
    
    
    
    
    
    
	// Reversed 
	// One user one userprofile,
    @OneToOne(fetch = FetchType.LAZY,mappedBy = "correspondUserProfile")
    private User userWhoOwnThisUserProfile;
 
    
}