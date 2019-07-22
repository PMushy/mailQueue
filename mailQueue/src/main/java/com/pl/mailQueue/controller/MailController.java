package com.pl.mailQueue.controller;

import com.pl.mailQueue.domain.model.Mail;
import com.pl.mailQueue.domain.model.User;
import com.pl.mailQueue.service.MailService;
import com.pl.mailQueue.utilities.UserUtilities;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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
@Slf4j
public class MailController {

    @Autowired
    private MailService mailService;

    @GetMapping("/mail")
    @Secured(value = {"ROLE_ADMIN", "ROLE_USER"})
    public String newMail(Model model) {
        Mail mail = new Mail();
        model.addAttribute("mail", mail);
        return "mail";
    }

    @GetMapping("/send-mail")
    @Secured(value = {"ROLE_ADMIN", "ROLE_USER"})
    public String sendMail(User user, BindingResult result, Model model, Mail mail) {
        String returnPage;
        String email = user.getEmail();
        if (result.hasErrors()) {
            returnPage = "/mail";
        } else {
            mailService.saveMail(mail);
            model.addAttribute("message", "Mail send");
            model.addAttribute("email", email);

            returnPage = "/index";
        }
        return returnPage;
    }
}
