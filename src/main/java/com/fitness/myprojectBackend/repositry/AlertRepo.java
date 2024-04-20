package com.fitness.myprojectBackend.repositry;

import com.fitness.myprojectBackend.entity.Alert;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AlertRepo extends JpaRepository<Alert, Integer> {
    List<Alert> findByUserIdOrderByAlertstampDesc(int user_id);


    List<Alert> findByUserId(int intExact);
}
