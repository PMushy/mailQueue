package com.pl.mailQueue.controller;

import com.pl.mailQueue.domain.model.User;
import com.pl.mailQueue.service.UserServiceInterface;
import com.pl.mailQueue.validators.UserRegisterValidator;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Locale;

@Controller
@RequiredArgsConstructor
public class RegisterController {

    @Autowired
    private UserServiceInterface userServiceInterface;

    @Autowired
    MessageSource messageSource;

    @Autowired
    UserRegisterValidator userRegisterValidator;

    @GetMapping("/register")
    public String registerForm(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/adduser")
    public String addUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, Locale locale) {
        String returnPage;
        userRegisterValidator.validateEmailExist(user.getEmail(), result);
        userRegisterValidator.validate(user, result);

        if (result.hasErrors()) {
            returnPage = "register";
        } else {
            userServiceInterface.saveUser(user);
            model.addAttribute("message", messageSource.getMessage("user.register.success", null, locale));
            model.addAttribute("user", new User());

            returnPage = "/login";
        }
        return returnPage;
    }
}
