package com.pl.mailQueue.validators;

import com.pl.mailQueue.constants.MailQueueConstants;
import com.pl.mailQueue.domain.model.Mail;
import com.pl.mailQueue.domain.repository.MailRepository;
import com.pl.mailQueue.utilities.MailQueueUtilities;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
@RequiredArgsConstructor
public class MailCreateValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Mail.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Mail m = (Mail) o;

        ValidationUtils.rejectIfEmpty(errors, "recipients", "error.userEmail.empty");

        if (!m.getRecipients().equals(null)) {
            boolean isMatch = MailQueueUtilities.checkEmailOrPassword(MailQueueConstants.EMAIL_PATTERN, m.getRecipients());
            if (!isMatch) {
                errors.rejectValue("recipients", "error.userEmailIsNotMatch");
            }
        }
    }
}
