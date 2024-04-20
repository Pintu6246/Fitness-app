package com.fitness.myprojectBackend.mapper;

import com.fitness.myprojectBackend.dto.HealthDataDto;
import com.fitness.myprojectBackend.entity.HealthData;
import com.fitness.myprojectBackend.entity.User;
import com.fitness.myprojectBackend.repositry.UserRepo;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class HealthDataMapper {
    private final UserRepo userRepo;

    public HealthDataMapper(UserRepo userRepo) {
        this.userRepo = userRepo;
    }


    public HealthDataDto toDto(HealthData healthData) {
        HealthDataDto healthDataDto = new HealthDataDto();
        healthDataDto.setUserId((long) healthData.getUser().getId());
        healthDataDto.setTimestamp(healthData.getTimestamp());
        healthDataDto.setHeartRate(healthData.getHeartrate());
        healthDataDto.setBloodPressure(healthData.getBloodpressure());
        healthDataDto.setActivityLevel(String.valueOf(healthData.getActivity()));
        return healthDataDto;
    }


    public HealthData toEntity(int id,HealthDataDto healthDataDto) {
        HealthData healthData = new HealthData();
        User user=userRepo.findById(id).orElseThrow(EntityNotFoundException::new);
        healthData.setUser(user);
        // You may need additional logic to set the User entity based on userId
        healthData.setTimestamp(healthDataDto.getTimestamp());
        healthData.setHeartrate(healthDataDto.getHeartRate());
        healthData.setBloodpressure(healthDataDto.getBloodPressure());
        healthData.setActivity(healthDataDto.getActivityLevel());


        return healthData;
    }
}
