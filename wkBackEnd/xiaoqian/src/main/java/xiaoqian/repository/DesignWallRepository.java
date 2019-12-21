package xiaoqian.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import lombok.Data;
import xiaoqian.model.Article;
import xiaoqian.model.DesignWall;
import xiaoqian.model.Supervisor;

@Repository
public interface DesignWallRepository extends JpaRepository<DesignWall, Long> {

}