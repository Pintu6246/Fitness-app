package com.fitness.myprojectBackend.mapper;

import com.fitness.myprojectBackend.dto.UserDto;
import com.fitness.myprojectBackend.entity.User;
import org.springframework.stereotype.Component;

@Component
public class UserMapper {
    public UserMapper() {
    }


    public UserDto toDto(User user) {
        UserDto userDto = new UserDto();
        userDto.setUsername(user.getUsername());
        userDto.setEmail(user.getEmail());
        userDto.setPhone(user.getPhone());
        userDto.setPassword(user.getPass());
        return userDto;
    }

    public User toEntity(UserDto userDto) {
        User user = new User();
        user.setUsername(userDto.getUsername());
        user.setEmail(userDto.getEmail());
        user.setPhone(userDto.getPhone());
        user.setPass(userDto.getPassword());
        return user;
    }
}
