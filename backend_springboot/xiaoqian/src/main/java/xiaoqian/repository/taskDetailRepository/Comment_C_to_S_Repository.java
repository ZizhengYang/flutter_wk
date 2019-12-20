package xiaoqian.repository.taskDetailRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import lombok.Data;
import xiaoqian.model.Article;
import xiaoqian.model.Supervisor;
import xiaoqian.model.taskDetails.Comment_C_to_S;

@Repository
public interface Comment_C_to_S_Repository extends JpaRepository<Comment_C_to_S, Long> {

}
