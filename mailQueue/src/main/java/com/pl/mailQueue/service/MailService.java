package com.pl.mailQueue.service;

import com.pl.mailQueue.domain.model.Mail;
import com.pl.mailQueue.domain.model.User;
import com.pl.mailQueue.domain.repository.MailRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MailService {

    private final MailRepository mailRepository;
    private final UserService userService;
    private final JavaMailSender javaMailSender;

    public void create(Mail mail, Long loggedUserId) {
        Optional<User> user = userService.getUserById(loggedUserId);

        if (user.isPresent()) {
            String email = user.get().getUsername();
            mail.setSender(email);
        }

        mailRepository.save(mail);
    }

    public void sendMail(Mail mail) throws MailException {
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(mail.getRecipients());
        msg.setFrom(mail.getSender());
        msg.setSubject(mail.getTitle());
        msg.setText(mail.getMessage());

        javaMailSender.send(msg);
    }

    public List<Mail> getAllMails() {
        return mailRepository.findAll();
    }

    public Optional<Mail> getMailById(Long id) {
        return mailRepository.findById(id);
    }

    public void deleteMailById(Long id) {
        mailRepository.deleteById(id);
    }

    public void editMail(Mail mail) {
        mailRepository.save(mail);
    }
}
