package com.fitness.myprojectBackend.entity;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "goals")
public class Goal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private User user;

    private String goalname;
    private String targetheartrate;
    private String targetsteps;
}
/*
*
* exercise type
* calorie
* overall health score
* */