package com.fitness.myprojectBackend.controller;

import com.fitness.myprojectBackend.dto.UserDto;
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

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private void idExtract(RedirectAttributes redirectAttributes) {
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
    }



    @Autowired
    private UserService userService;
    @Autowired
    HttpServletResponse response;

    @Autowired
    HttpServletRequest request;


    @GetMapping("/register")
    public String showRegisterPage(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("userDto") UserDto userDto,Model model) {
        userService.registerUser(userDto);


        // Redirect to the login page after registration
        return "login";
    }




    @GetMapping("/profile/{id}")
    public String showProfile(@PathVariable("id")int id, Model model) {
        UserDto userDto=userService.getUserById((long) id);
        model.addAttribute("userDto",userDto);

        return "profile";
    }




    @GetMapping("/update")
    public String showUser(RedirectAttributes redirectAttributes) {

        idExtract(redirectAttributes);

        return "redirect:/user/update/{id}";
    }
    @GetMapping("/update/{id}")
    public String updateUserview(@PathVariable Long id, Model model) {
        UserDto user = userService.getUserById(id);
        model.addAttribute("user", user);


        return "update profile";
    }

    @PutMapping("/update/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute("user") UserDto userDto,Model model) {
        userService.updateUser(id.intValue(), userDto);
        model.addAttribute("userDto", userDto);

        // Redirect to the user profile page after updating
        return "redirect:/user/profile/{id}";
    }



    @GetMapping("/update-pass")
    public String showUserpass(RedirectAttributes redirectAttributes) {

        idExtract(redirectAttributes);

        return "redirect:/user/update-pass/{id}";
    }
    @GetMapping("/update-pass/{id}")
    public String updateUserpassview(@PathVariable Long id,Model model,RedirectAttributes redirectAttributes) {
        UserDto userDto = userService.getUserById(id);
        model.addAttribute("userDto", userDto);



        return "change password";
    }
    @PutMapping("/update-pass/{id}")
    public String updateUserPass(@PathVariable Long id) {
        UserDto userDto = userService.getUserById(id);
        userDto.setPassword(request.getParameter("newPassword"));
//        System.out.println(userDto.getEmail());

        userService.updateUserPass(id.intValue(), userDto);
        // Redirect to the user profile page after updating
        return "redirect:/user/profile";
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
