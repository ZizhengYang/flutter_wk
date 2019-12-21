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
@Table(name = "article")
public class Article {
 
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
  
 
    
    
    
	// ??????????? Do we add cascade.all
	// can not use Cascade --> That would mean, delete article will also delete user
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "postingUser_Id")
    private User userWhoPostedTheArticle;
	
	
	// Users Who own this article
	@ManyToMany(fetch = FetchType.LAZY,
		cascade = {
		CascadeType.PERSIST,
		CascadeType.MERGE,
		CascadeType.REFRESH,
		CascadeType.MERGE
		},
		mappedBy = "favoriteArticles")
		private Set<User> usersWhoLikedTheArticle = new HashSet<>();

		    
}