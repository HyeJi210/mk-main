package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.State;

public interface StateRepository extends JpaRepository<State, Integer> {

}
