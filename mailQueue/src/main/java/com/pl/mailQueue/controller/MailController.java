package com.pl.mailQueue.controller;

import com.pl.mailQueue.domain.model.Mail;
import com.pl.mailQueue.service.MailService;
import com.pl.mailQueue.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/mail")
public class MailController {

    Logger logger = LoggerFactory.getLogger(MailController.class);

    private final MailService mailService;

    private final UserService userService;


    @GetMapping("/create")
    @Secured(value = {"ROLE_ADMIN", "ROLE_USER"})
    public String createMailForm(Model model) {
        model.addAttribute("mail", new Mail());
        return "/mail/mail";
    }

    @PostMapping("/create")
    @Secured(value = {"ROLE_ADMIN", "ROLE_USER"})
    public String createMail(@ModelAttribute("mail") Mail mail) {
        Long loggedUserId = userService.getLoggedUserId();
        mailService.create(mail, loggedUserId);
        return "redirect:/mail/mail-list";
    }

    @RequestMapping("/mail-send/{id}")
    @Secured(value = {"ROLE_ADMIN", "ROLE_USER"})
    public String sendMail(@PathVariable("id") Long id) {
        Optional<Mail> maybeMail = mailService.getMailById(id);

        if (maybeMail.isPresent()) {
            mailService.sendMail(maybeMail.get());
        } else {
            //catch error
            logger.info("Error Sendind Email: ");
        }
        return "redirect:/mail/mail-list";
    }

    @GetMapping("/mail-list")
    @Secured(value = {"ROLE_ADMIN"})
    public String mailList(Model model) {
        List<Mail> mails = mailService.getAllMails();
        model.addAttribute("mails", mails);

        return "mail/mail-list";
    }

    @GetMapping("/mail-edit/{id}")
    @Secured(value = {"ROLE_ADMIN"})
    public String editMailForm(@PathVariable("id") Long id, Model model) {
        Optional<Mail> mail = mailService.getMailById(id);

        if (!mail.isPresent()) {
            return "redirect:/mail/mail";
        } else {
            model.addAttribute("mail", mail.get());
            return "mail/mail-edit";
        }
    }

    @PostMapping("/mail-edit/{id}")
    public String editMail(@ModelAttribute("owner") Mail mail) {
        mailService.editMail(mail);

        return "redirect:/mail/mail-list";
    }

    @GetMapping("/mail-delete/{id}")
    @Secured(value = {"ROLE_ADMIN"})
    public String deleteMail(@PathVariable("id") Long id) {
        mailService.deleteMailById(id);
        return "redirect:/mail/mail-list";
    }
}
