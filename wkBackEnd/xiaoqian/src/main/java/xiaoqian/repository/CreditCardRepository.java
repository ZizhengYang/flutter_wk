package xiaoqian.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import lombok.Data;
import xiaoqian.model.Article;
import xiaoqian.model.CreditCard;
import xiaoqian.model.Supervisor;

@Repository
public interface CreditCardRepository extends JpaRepository<CreditCard, Long> {

}