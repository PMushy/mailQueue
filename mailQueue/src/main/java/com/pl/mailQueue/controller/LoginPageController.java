package com.pl.mailQueue.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class LoginPageController {

    @GetMapping(value = "/login")
    public String showLoginPage() {

        return "login";
    }


}

