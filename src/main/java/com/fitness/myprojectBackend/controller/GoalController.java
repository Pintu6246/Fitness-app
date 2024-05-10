package com.fitness.myprojectBackend.controller;

import com.fitness.myprojectBackend.dto.GoalDto;
import com.fitness.myprojectBackend.service.goalimpl.GoalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/goal")
@Controller
public class GoalController {

    @Autowired
    private GoalService goalService;


    @GetMapping("/set/{id}")
    public String  setViewGoal(@PathVariable int id) {

        return "add-goal";
    }

    @PostMapping("/set/{id}")
    public String  setGoal(@PathVariable int id,GoalDto goalDto) {
        goalService.setGoal(id,goalDto);
        return "redirect:/goal/goals/"+id;
    }




    @GetMapping("/goals/{id}")
    public String getGoals(@PathVariable("id") Long userId,Model model) {
        List<GoalDto> goals = goalService.getGoals(userId);
        model.addAttribute("goals", goals);
        return "goal-data";
    }

}
