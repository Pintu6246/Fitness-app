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

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

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
                            RedirectAttributes redirectAttributes,
                            Model model) {
        User user=userRepo.findByUsernameOrEmailOrPhone(identifier,identifier,identifier);

        if (user != null && PasswordEncoderUtil.checkPassword(password,user.getPass())) {

            String id= String.valueOf(user.getId());

            Cookie idCookie = new Cookie("id", id);
            response.addCookie(idCookie);

            model.addAttribute("id", id);

            return "home";
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid credentials, please try again");
            return "redirect:/login";
        }
    }

}
