package com.fitness.myprojectBackend.service.alertimpl;

import com.fitness.myprojectBackend.dto.AlertDto;
import com.fitness.myprojectBackend.entity.Alert;
import com.fitness.myprojectBackend.mapper.AlertMapper;
import com.fitness.myprojectBackend.repositry.AlertRepo;
import com.fitness.myprojectBackend.service.AlertSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AlertService implements AlertSer {

    @Autowired
    private AlertRepo alertRepo;

    @Autowired
    private AlertMapper alertMapper;

    @Override
    public AlertDto createAlert(int id,AlertDto alertDto) {
        Alert alert=alertMapper.toEntity(id,alertDto);
        Alert savedAlert=alertRepo.save(alert);
        return alertMapper.toDto(savedAlert);
    }

    @Override
    public List<AlertDto> getAlerts(Long userId) {
        List<Alert> alerts=alertRepo.findByUserIdOrderByAlertstampDesc(Math.toIntExact(userId));
        return alerts.stream().map(alertMapper::toDto).collect(Collectors.toList());
    }
}
