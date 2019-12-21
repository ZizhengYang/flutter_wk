package xiaoqian.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import lombok.Data;
import xiaoqian.model.Supervisor;
import xiaoqian.model.Task_CompanySupervisor;
import xiaoqian.model.Task_UserSupervisor;

@Repository
public interface Task_CompanySupervisorRepository extends JpaRepository<Task_CompanySupervisor, Long> {

}