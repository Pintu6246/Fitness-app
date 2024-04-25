package com.fitness.myprojectBackend.controller;


import com.fitness.myprojectBackend.dto.HealthDataDto;
import com.fitness.myprojectBackend.service.healthdataimpl.HealthDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/fitness/health")
@Controller
public class HealthDataController {

    @Autowired
    private HealthDataService healthDataService;

    @GetMapping("/latest/{id}")
    public ResponseEntity<HealthDataDto> getLatestHealthData(@PathVariable("id") Long id) {
        HealthDataDto healthDataDto = healthDataService.getLatestHealthData(id);
        return ResponseEntity.ok(healthDataDto);
    }

    @GetMapping("/all/{id}")
    public ResponseEntity<List<HealthDataDto>> getAllHealthData(@PathVariable("id") Long id) {
        List<HealthDataDto> allHealthData = healthDataService.getAllHealthData(id);
        return ResponseEntity.ok(allHealthData);
    }

    @PostMapping("/submit/{id}")
    public ResponseEntity<HealthDataDto> submitHealthData(@PathVariable int id,@RequestBody HealthDataDto healthDataDto) {
        HealthDataDto savedData= healthDataService.submitHealthData((long) id,healthDataDto);
        return ResponseEntity.ok(savedData);
    }
}
