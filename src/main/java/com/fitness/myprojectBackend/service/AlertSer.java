package com.fitness.myprojectBackend.service;

import com.fitness.myprojectBackend.dto.AlertDto;

import java.util.List;

public interface AlertSer {
    AlertDto createAlert(int id,AlertDto alertDto);
    List<AlertDto> getAlerts(Long userId);
}
