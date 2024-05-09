package com.fitness.myprojectBackend.controller;

import com.fitness.myprojectBackend.dto.UserDto;
import com.fitness.myprojectBackend.entity.User;
import com.fitness.myprojectBackend.mapper.UserMapper;
import com.fitness.myprojectBackend.service.userimpl.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.AttributedString;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;

    @Autowired
    HttpServletRequest request;
    @Autowired
    private UserMapper userMapper;


    @GetMapping("/register")
    public String showRegisterPage(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("userDto") UserDto userDto) {
        userService.registerUser(userDto);
        // Redirect to the login page after registration
        return "login";
    }




    @GetMapping("/profile")
    public String showProfile() {

        return "profile";
    }


    @GetMapping("/update/{id}")
    public String updateUserview(@PathVariable Long id, Model model, HttpServletResponse response) {
        UserDto user = userService.getUserById(id);
        model.addAttribute("user", user);


        return "update profile";
    }

    @PutMapping("/update/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute("user") UserDto userDto) {
        userService.updateUser(id.intValue(), userDto);
        // Redirect to the user profile page after updating
        return "redirect:/user/profile";
    }


    @PutMapping("/updatepass/{id}")
    public String updateUserpass(@PathVariable Long id, @ModelAttribute("user") UserDto userDto) {
        userService.updateUserpass(id.intValue(), userDto);
        // Redirect to the user profile page after updating
        return "redirect:/user/profile";
    }



    @GetMapping("/update")
    public String showUser(RedirectAttributes redirectAttributes) {

        String id="";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("id")) {
                    id= cookie.getValue();
                }
            }
        }
        redirectAttributes.addAttribute("id",Long.parseLong(id));

        return "redirect:/user/update/{id}";
    }


    @GetMapping("/{id}")
    public String getUser(@PathVariable("id") Long id, Model model) {
        UserDto user = userService.getUserById(id);
        model.addAttribute("all", user);
        // Return the user details page
        return "users";
    }

    @GetMapping("/users")
    public String getAllUsers(Model model) {
        List<UserDto> users = userService.getAllUsers();
        model.addAttribute("all", users);
        // Return the users list page
        return "users";
    }
}
