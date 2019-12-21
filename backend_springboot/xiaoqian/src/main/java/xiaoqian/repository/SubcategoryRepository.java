package xiaoqian.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import lombok.Data;
import xiaoqian.model.Article;
import xiaoqian.model.Skill;
import xiaoqian.model.Subcategory;
import xiaoqian.model.Supervisor;

@Repository
public interface SubcategoryRepository extends JpaRepository<Subcategory, Long> {

}
