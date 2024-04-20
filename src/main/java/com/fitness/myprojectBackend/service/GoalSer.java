package com.fitness.myprojectBackend.service;

import com.fitness.myprojectBackend.dto.GoalDto;

import java.util.List;

public interface GoalSer {
    GoalDto setGoal(int id,GoalDto goalDto);
    List<GoalDto> getGoals(Long userId);

}
