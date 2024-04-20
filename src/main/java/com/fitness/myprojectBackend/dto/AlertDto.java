package com.fitness.myprojectBackend.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class AlertDto {
    private Long userId;
    private String alertType;
    private String alertMessage;
    private LocalDateTime timestamp;

}
