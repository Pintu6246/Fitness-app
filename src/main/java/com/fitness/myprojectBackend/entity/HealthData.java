package com.fitness.myprojectBackend.entity;


import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

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
    private int age;
    private int weight;
    private int height;
    private String gender;
    private String alcoholOrSmoke;
    private String stress;
    private String diet;
    private int heartrate;
    private int bloodpressure;
    private String activity;


}
