package com.fitness.myprojectBackend.service;

import com.fitness.myprojectBackend.dto.HealthDataDto;

import java.util.List;

public interface HealthDataSer {
    HealthDataDto submitHealthData(int UserId,HealthDataDto healthDataDto);
    HealthDataDto getLatestHealthData(Long userId);
    List<HealthDataDto> getAllHealthData(Long userId);
}
