package com.fitness.myprojectBackend.controller;


import com.fitness.myprojectBackend.dto.AlertDto;
import com.fitness.myprojectBackend.service.alertimpl.AlertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/fitness/alert")
public class AlertController {
    @Autowired
    private AlertService alertService;

    @PostMapping("/create/{id}")
    public ResponseEntity<?> createAlert(@PathVariable("id") int id,@RequestBody AlertDto alertDto) {
        AlertDto savedAlert=alertService.createAlert(id,alertDto);
        return ResponseEntity.ok(savedAlert);
    }

    @GetMapping("/{id}")
    public ResponseEntity<List<AlertDto>> getAlerts(@PathVariable("id") Long userId) {
        List<AlertDto> alerts=alertService.getAlerts(userId);
        return ResponseEntity.ok(alerts);
    }

}
