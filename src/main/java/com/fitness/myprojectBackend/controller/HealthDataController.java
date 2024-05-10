package com.fitness.myprojectBackend.controller;


import com.fitness.myprojectBackend.dto.HealthDataDto;
import com.fitness.myprojectBackend.service.healthdataimpl.HealthDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/health")
@Controller
public class HealthDataController {

    @Autowired
    private HealthDataService healthDataService;

    @GetMapping("/latest/{id}")
    public String  getLatestHealthData(@PathVariable("id") Long id,Model model) {
        HealthDataDto healthDataDto = healthDataService.getLatestHealthData(id);
        model.addAttribute("healthData", healthDataDto);
        return "health data";
    }

    @GetMapping("/all/{id}")
    public String  getAllHealthData(@PathVariable("id") Long id, Model model) {
        List<HealthDataDto> allHealthData = healthDataService.getAllHealthData(id);
        model.addAttribute("healthData", allHealthData);
        return "health data";
    }


    @GetMapping("/submit/{id}")
    public String submitViewHealthData(@PathVariable int id) {

        return "add-health-data";
    }
    @PostMapping("/submit/{id}")
    public String  submitHealthData(@PathVariable int id, HealthDataDto healthDataDto) {
        healthDataService.submitHealthData(id,healthDataDto);
        return "redirect:/health/all/"+id;
    }
}
