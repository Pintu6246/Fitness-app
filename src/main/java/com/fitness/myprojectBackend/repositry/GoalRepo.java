package com.fitness.myprojectBackend.repositry;

import com.fitness.myprojectBackend.entity.Goal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoalRepo extends JpaRepository<Goal, Integer> {
    List<Goal> findByUserId(int user_id);
}
