package com.pl.mailQueue.validators;


import com.pl.mailQueue.constants.MailQueueConstants;
import com.pl.mailQueue.domain.model.User;
import com.pl.mailQueue.domain.repository.UserRepository;
import com.pl.mailQueue.utilities.MailQueueUtilities;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
@RequiredArgsConstructor
public class UserRegisterValidator implements Validator {

    private final UserRepository userRepository;

    @Override
    public boolean supports(Class<?> cls) {
        return User.class.equals(cls);
    }

    @Override
    public void validate(Object obj, Errors errors) {
        User u = (User) obj;

        ValidationUtils.rejectIfEmpty(errors, "nick", "error.userNick.empty");
        ValidationUtils.rejectIfEmpty(errors, "email", "error.userEmail.empty");
        ValidationUtils.rejectIfEmpty(errors, "password", "error.userPassword.empty");

        if (!u.getEmail().equals(null)) {
            boolean isMatch = MailQueueUtilities.checkEmailOrPassword(MailQueueConstants.EMAIL_PATTERN, u.getEmail());
            if (!isMatch) {
                errors.rejectValue("email", "error.userEmailIsNotMatch");
            }
        }

        if (!u.getPassword().equals(null)) {
            boolean isMatch = MailQueueUtilities.checkEmailOrPassword(MailQueueConstants.PASSWORD_PATTERN, u.getPassword());
            if (!isMatch) {
                errors.rejectValue("password", "error.userPasswordIsNotMatch");
            }
        }
    }

    public void validateEmailExist(String email, Errors errors) {
        if (userRepository.existsByEmail(email)) {
            errors.rejectValue("email", "error.userEmailExist");
        }
    }
}
