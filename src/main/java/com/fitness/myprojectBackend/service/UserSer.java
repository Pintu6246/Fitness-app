package com.fitness.myprojectBackend.service;

import com.fitness.myprojectBackend.dto.UserDto;

import java.util.List;

public interface UserSer {
    void registerUser(UserDto userDto);
    UserDto updateUser(Long id, UserDto userDto);
//    void deleteUser(Long id);
    UserDto getUserById(Long id);
    List<UserDto> getAllUsers();

}
