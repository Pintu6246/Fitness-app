package com.fitness.myprojectBackend.mapper;

import com.fitness.myprojectBackend.dto.GoalDto;
import com.fitness.myprojectBackend.entity.Goal;
import com.fitness.myprojectBackend.entity.User;
import com.fitness.myprojectBackend.repositry.UserRepo;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class GoalMapper {
    private final UserRepo userRepo;

    public GoalMapper(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    public GoalDto toDto(Goal goal) {
        GoalDto goalDto = new GoalDto();
        goalDto.setUserId((long) goal.getUser().getId());
        goalDto.setGoalName(goal.getGoalname());
        goalDto.setTargetHeartRate(Integer.parseInt(goal.getTargetheartrate()));
        goalDto.setTargetSteps(Integer.parseInt(goal.getTargetsteps()));
        return goalDto;
    }

    public Goal toEntity(int id,GoalDto goalDto) {
        Goal goal = new Goal();
        User user=userRepo.findById(id).orElseThrow(EntityNotFoundException::new);
        goal.setUser(user);
        // You may need additional logic to set the User entity based on userId
        goal.setGoalname(goalDto.getGoalName());
        goal.setTargetheartrate(String.valueOf(goalDto.getTargetHeartRate()));
        goal.setTargetsteps(String.valueOf(goalDto.getTargetSteps()));
        return goal;
    }
}
