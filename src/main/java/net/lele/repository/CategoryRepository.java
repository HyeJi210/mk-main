package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
