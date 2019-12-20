package xiaoqian.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import lombok.Data;

import xiaoqian.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}
