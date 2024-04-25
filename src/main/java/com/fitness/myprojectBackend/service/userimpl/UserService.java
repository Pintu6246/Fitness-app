package com.fitness.myprojectBackend.service.userimpl;

import com.fitness.myprojectBackend.dto.UserDto;
import com.fitness.myprojectBackend.entity.Alert;
import com.fitness.myprojectBackend.entity.Goal;
import com.fitness.myprojectBackend.entity.HealthData;
import com.fitness.myprojectBackend.entity.User;
import com.fitness.myprojectBackend.mapper.UserMapper;
import com.fitness.myprojectBackend.repositry.AlertRepo;
import com.fitness.myprojectBackend.repositry.GoalRepo;
import com.fitness.myprojectBackend.repositry.HealthDataRepo;
import com.fitness.myprojectBackend.repositry.UserRepo;
import com.fitness.myprojectBackend.service.UserSer;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService implements UserSer {

    @Autowired
    private UserRepo repo;


    @Autowired
    private UserMapper usermapper;
    @Autowired
    private GoalRepo goalRepo;
    @Autowired
    private AlertRepo alertRepo;
    @Autowired
    private HealthDataRepo healthDataRepo;

    @Override
    public UserDto registerUser(UserDto userDto) {

        User user =usermapper.toEntity(userDto);
        User savedUser = repo.save(user);
        return usermapper.toDto(savedUser);

    }

    @Override
    public UserDto updateUser(Long id, UserDto userDto) {

        Optional<User> user = repo.findById(Math.toIntExact(id));
        if (user.isPresent()) {
            User user1 = user.get();
            user1.setUsername(userDto.getUsername());
            user1.setEmail(userDto.getEmail());
            user1.setPass(userDto.getPassword());
            User savedUser = repo.save(user1);
            return usermapper.toDto(savedUser);
        }
        else {
            throw new EntityNotFoundException("User not found with id " + id);
        }

    }

//    @Override
//    public void deleteUser(Long id) {
//        Optional<User> user = repo.findById(Math.toIntExact(id));
//        if (user.isPresent()) {
//            User user1 = user.get();
//            List<Goal> goals=goalRepo.findByUserId(Math.toIntExact(id));
//            List<Alert> alerts=alertRepo.findByUserId(Math.toIntExact(id));
//            List<HealthData> datas=healthDataRepo.findByUserId(Math.toIntExact(id));
//
//            healthDataRepo.deleteAll(datas);
//            alertRepo.deleteAll(alerts);
//            goalRepo.deleteAll(goals);
//            repo.deleteById(Math.toIntExact(id));
//        }
//        repo.deleteById(Math.toIntExact(id));
//
//    }

    @Override
    public UserDto getUserById(Long id) {
        Optional<User> user=repo.findById(Math.toIntExact(id));
        if(user.isPresent()){
            return usermapper.toDto(user.get());
        }
        else {
            throw new EntityNotFoundException("User not found with id " + id);
        }
    }

    @Override
    public List<UserDto> getAllUsers() {
        List<User> users = repo.findAll();
        return users.stream().map(usermapper::toDto).collect(Collectors.toList());

    }



}
