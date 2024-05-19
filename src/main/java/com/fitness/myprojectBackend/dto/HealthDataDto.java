package com.fitness.myprojectBackend.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class HealthDataDto {
    private Long userId;
    private LocalDateTime timestamp;
    private int age;
    private int weight;
    private int height;
    private String gender;
    private String alcoholOrSmoke;
    private String stress;
    private String diet;
    private int heartRate;
    private int bloodPressure;
    private String activityLevel;
}
