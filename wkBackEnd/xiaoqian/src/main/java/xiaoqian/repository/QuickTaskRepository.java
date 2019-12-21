package xiaoqian.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import lombok.Data;
import xiaoqian.model.Article;
import xiaoqian.model.CreditCard;
import xiaoqian.model.QuickTask;
import xiaoqian.model.Supervisor;

@Repository
public interface QuickTaskRepository extends JpaRepository<QuickTask, Long> {

}