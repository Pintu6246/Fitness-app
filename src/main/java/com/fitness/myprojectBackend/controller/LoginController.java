package com.fitness.myprojectBackend.controller;

import com.fitness.myprojectBackend.dto.UserDto;
import com.fitness.myprojectBackend.service.userimpl.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String loginUserget(){

        return "login";
    }


    @PostMapping("/login")
    public String loginUser(@RequestParam("identifier") String identifier,
                            @RequestParam("password") String password,
                            HttpSession session,
                            Model model) {
        UserDto userDto = userService.loginUser(identifier, password);
        if (userDto != null) {
            session.setAttribute("loggedInUser", userDto);
            return "home";
        } else {
            model.addAttribute("error", "Invalid username/email/phone or password");
            return "login";
        }
    }

}
