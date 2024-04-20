package com.fitness.myprojectBackend.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class HealthDataDto {
    private Long userId;
    private LocalDateTime timestamp;
    private int heartRate;
    private int bloodPressure;
    private String activityLevel;
}
