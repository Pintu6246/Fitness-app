package com.fitness.myprojectBackend.dto;

import lombok.Data;

@Data
public class GoalDto {
    private Long userId;
    private String goalName;
    private int targetHeartRate;
    private int targetSteps;
}
