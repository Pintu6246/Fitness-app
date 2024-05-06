package com.fitness.myprojectBackend.controller;

import com.fitness.myprojectBackend.dto.UserDto;
import com.fitness.myprojectBackend.entity.User;
import com.fitness.myprojectBackend.mapper.UserMapper;
import com.fitness.myprojectBackend.repositry.UserRepo;
import com.fitness.myprojectBackend.service.userimpl.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/login")
    public String loginUserget(){

        return "login";
    }


    @PostMapping("/login")
    public String loginUser(@RequestParam("identifier") String identifier,
                            @RequestParam("password") String password,
                            HttpServletResponse response,
                            RedirectAttributes redirectAttributes) {
        UserDto userDto = userService.loginUser(identifier, password);
        User user=userRepo.findByUsernameOrEmailOrPhone(identifier,identifier,identifier);
        String id= String.valueOf(user.getId());
        if (userDto != null) {
            Cookie usernameCookie = new Cookie("username", user.getUsername());
            Cookie emailCookie = new Cookie("email", user.getEmail());
            Cookie phoneCookie = new Cookie("phone", user.getPhone());
            Cookie idCookie = new Cookie("id", id);
            // Add cookies to the response
            response.addCookie(usernameCookie);
            response.addCookie(emailCookie);
            response.addCookie(phoneCookie);
            response.addCookie(idCookie);
            return "home";
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid credentials, please try again");
            return "redirect:/login";
        }
    }

}
