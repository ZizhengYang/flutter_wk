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
@Table(name = "photo")
public class Photo {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  

	// Users Who has this photo on their designwall
	@ManyToMany(fetch = FetchType.LAZY,
		cascade = {
		CascadeType.PERSIST,
		CascadeType.MERGE,
		CascadeType.REFRESH,
		CascadeType.MERGE
		},
		mappedBy = "photos")
		private Set<DesignWall> designWallThatHasThisPhoto = new HashSet<>();

    
    
}