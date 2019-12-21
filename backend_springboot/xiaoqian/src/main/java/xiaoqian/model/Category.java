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
@Table(name = "category")
public class Category {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
    
	
	// One category posted many subcategory
    // CascadeType.ALL: when the category object is updated/deleted, the subcategory is updated/deleted
    // Use lazy to prevent the list of subcategory being fetched when the category is fetched
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "parentCategory",cascade = CascadeType.ALL)
    private List<Subcategory> listOfSubcategory;
    

    
    // Category's related skills
    // Many to many
    // Don't want delete cascade
    // That way, if category is deleted, related rows in category and middle table is delted 
    // but not the skill table 
    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
            	CascadeType.DETACH,
                CascadeType.PERSIST,
                CascadeType.REFRESH,
                CascadeType.MERGE
            })
    @JoinTable(name = "category_related_skills",
            joinColumns = { @JoinColumn(name = "category_id") },
            inverseJoinColumns = { @JoinColumn(name = "skill_id") })
    private Set<Skill> relatedSkills = new HashSet<>();
    

    
    
    // ----------reversed below-------
    
  
}