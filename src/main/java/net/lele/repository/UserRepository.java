package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findOneByUserId(String userId);

	User findById(int id);
	
	User findByUserId(String userId);
	
	User findByNickname(String nickname);
}