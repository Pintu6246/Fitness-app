package com.fitness.myprojectBackend.service;

import com.fitness.myprojectBackend.dto.HealthDataDto;

import java.util.List;

public interface HealthDataSer {
    HealthDataDto submitHealthData(Long UserId,HealthDataDto healthDataDto);
    HealthDataDto getLatestHealthData(Long userId);
    List<HealthDataDto> getAllHealthData(Long userId);
}
