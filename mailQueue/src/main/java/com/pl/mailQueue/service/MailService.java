package com.pl.mailQueue.service;

import com.pl.mailQueue.domain.model.Mail;
import com.pl.mailQueue.domain.repository.MailRepository;
import org.springframework.stereotype.Service;

@Service
public class MailService {

    private MailRepository mailRepository;

    public void saveMail(Mail mail) {
        mailRepository.save(mail);
    }

}
