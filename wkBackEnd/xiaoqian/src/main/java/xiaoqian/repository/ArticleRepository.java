package xiaoqian.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import lombok.Data;
import xiaoqian.model.Article;
import xiaoqian.model.Supervisor;
import xiaoqian.model.User;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {
}
