package xiaoqian.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import lombok.Data;
import xiaoqian.model.Supervisor;

@Repository
public interface SupervisorRepository extends JpaRepository<Supervisor, Long> {

}



