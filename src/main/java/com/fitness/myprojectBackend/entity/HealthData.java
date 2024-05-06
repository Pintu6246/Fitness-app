package com.fitness.myprojectBackend.entity;


import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "health_data")
public class HealthData {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn()
    private User user;

    private LocalDateTime timestamp;
    private int heartrate;
    private int bloodpressure;
    private String activity;
//    private int userId;
/*
age
gender
height
weight
sugar levels
cholestrol
health
alchole/smoke
stress
spo2
diet
caleories
steps

* */


}
