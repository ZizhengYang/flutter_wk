package xiaoqian.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import lombok.Data;
import xiaoqian.model.Article;
import xiaoqian.model.DesignWall;
import xiaoqian.model.Education;
import xiaoqian.model.Experience;
import xiaoqian.model.Photo;
import xiaoqian.model.Supervisor;

@Repository
public interface PhotoRepository extends JpaRepository<Photo, Long> {

}