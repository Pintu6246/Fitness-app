package com.fitness.myprojectBackend.dto;

import lombok.Data;

@Data
public class UserDto {
    private String username;
    private String email;
    private String phone;
    private String password;

    public UserDto(int id, String username, String email, String phone) {
    }

    public UserDto() {

    }
}
