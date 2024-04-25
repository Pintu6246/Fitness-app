package com.fitness.myprojectBackend.controller;

import com.fitness.myprojectBackend.dto.GoalDto;
import com.fitness.myprojectBackend.service.goalimpl.GoalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/fitness/goal")
@Controller
public class GoalController {

    @Autowired
    private GoalService goalService;

    @PostMapping("/set/{id}")
    public ResponseEntity<GoalDto> setGoal(@PathVariable("id") int id,@RequestBody GoalDto goalDto) {
        GoalDto savedGoal = goalService.setGoal(id,goalDto);
        return ResponseEntity.ok(savedGoal);
    }

    @GetMapping("/goals/{id}")
    public ResponseEntity<List<GoalDto>> getGoals(@PathVariable("id") Long userId) {
        List<GoalDto> goals = goalService.getGoals(userId);
        return ResponseEntity.ok(goals);
    }

}
