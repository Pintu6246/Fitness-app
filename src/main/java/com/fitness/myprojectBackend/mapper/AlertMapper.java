package com.fitness.myprojectBackend.mapper;

import com.fitness.myprojectBackend.dto.AlertDto;
import com.fitness.myprojectBackend.entity.Alert;
import com.fitness.myprojectBackend.entity.User;
import com.fitness.myprojectBackend.repositry.UserRepo;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class AlertMapper {
    private final UserRepo userRepo;

    public AlertMapper(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    public AlertDto toDto(Alert alert) {
        AlertDto alertDto = new AlertDto();
        alertDto.setUserId((long) alert.getUser().getId());
        alertDto.setAlertType(alert.getAlerttype());
        alertDto.setAlertMessage(alert.getAlertmessage());
        alertDto.setTimestamp(alert.getAlertstamp());
        return alertDto;
    }

    public Alert toEntity(int id,AlertDto alertDto) {
        Alert alert = new Alert();
        User user = userRepo.findById(id).orElseThrow(EntityNotFoundException::new);
        alert.setUser(user);
        // You may need additional logic to set the User entity based on userId
        alert.setAlerttype(alertDto.getAlertType());
        alert.setAlertmessage(alertDto.getAlertMessage());
        alert.setAlertstamp(alertDto.getTimestamp());
        return alert;
    }
}
