package com.fitness.myprojectBackend.repositry;

import com.fitness.myprojectBackend.entity.HealthData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HealthDataRepo extends JpaRepository<HealthData, Integer> {
    List<HealthData> findByUserIdOrderByIdDesc(int user_id);

    List<HealthData> findByUserIdOrderByTimestamp(int id);

    List<HealthData> findByUserId(int user_id);
}
