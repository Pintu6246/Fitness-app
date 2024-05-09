package com.fitness.myprojectBackend.service;

import com.fitness.myprojectBackend.dto.UserDto;

import java.util.List;

public interface UserSer {
    void registerUser(UserDto userDto);
    void updateUser(int id, UserDto userDto);
    void updateUserPass(int id, UserDto userDto);
//    void deleteUser(Long id);
    UserDto getUserById(Long id);
    List<UserDto> getAllUsers();

}
