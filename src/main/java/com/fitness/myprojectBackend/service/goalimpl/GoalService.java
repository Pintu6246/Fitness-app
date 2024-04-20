package com.fitness.myprojectBackend.service.goalimpl;

import com.fitness.myprojectBackend.dto.GoalDto;
import com.fitness.myprojectBackend.entity.Goal;
import com.fitness.myprojectBackend.mapper.GoalMapper;
import com.fitness.myprojectBackend.repositry.GoalRepo;
import com.fitness.myprojectBackend.service.GoalSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class GoalService implements GoalSer {

    @Autowired
    private GoalRepo goalRepo;

    @Autowired
    private GoalMapper goalMapper;


    @Override
    public GoalDto setGoal(int id,GoalDto goalDto) {
        Goal goal=goalMapper.toEntity(id,goalDto);
        Goal savedGoal=goalRepo.save(goal);
        return goalMapper.toDto(savedGoal);
    }

    @Override
    public List<GoalDto> getGoals(Long userId) {
        List<Goal> goals=goalRepo.findByUserId(Math.toIntExact(userId));
        return goals.stream().map(goalMapper::toDto).collect(Collectors.toList());
    }

}
