package com.pl.mailQueue.controller;


import com.pl.mailQueue.domain.model.User;
import com.pl.mailQueue.service.UserServiceInterface;
import com.pl.mailQueue.utilities.UserUtilities;
import com.pl.mailQueue.validators.ChangePasswordValidator;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Locale;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserServiceInterface userServiceInterface;

    @Autowired
    private ChangePasswordValidator changePasswordValidator;

    @Autowired
    MessageSource messageSource;

    @GetMapping("/profil")
    @Secured(value = {"ROLE_ADMIN", "ROLE_USER"})
    public String showUserProfilePage(Model model) {
        String userName = UserUtilities.getLoggedUser();

        User user = userServiceInterface.findUserByEmail(userName);

        Long roleNr = user.getRoles().iterator().next().getId();
        user.setRoleNr(roleNr);
        model.addAttribute("user", user);
        return "user/profil";
    }

    @GetMapping("/edit-password")
    @Secured(value = {"ROLE_ADMIN", "ROLE_USER", "ROLE_ADMIN_SHELTER"})
    public String editPassword(Model model) {
        String userName = UserUtilities.getLoggedUser();
        User user = userServiceInterface.findUserByEmail(userName);
        model.addAttribute("user", user);

        return "user/edit-password";
    }

    @PostMapping("/update-pass")
    @Secured(value = {"ROLE_ADMIN", "ROLE_USER", "ROLE_ADMIN_SHELTER"})
    public String updateUserPass(User user, BindingResult result, Model model, Locale locale) {

        String returnPage = null;

        changePasswordValidator.checkPasswords(user.getNewPassword(), result);

        changePasswordValidator.validate(user, result);

        if (result.hasErrors()) {
            returnPage = "user/edit-password";
        } else {
            userServiceInterface.updateUserPassword(user.getNewPassword(), user.getEmail());
            returnPage = "user/edit-password";

            model.addAttribute("message", messageSource.getMessage("passwordChange.success", null, locale));
        }

        return returnPage;
    }

    @GetMapping("/admin")
    @Secured(value = {"ROLE_ADMIN"})
    public String showAdminPage() {

        return "user/admin";
    }

    @GetMapping("/users")
    @Secured(value = {"ROLE_ADMIN"})
    public String openAdminUsersPage(Model model) {
        List<User> userList = userServiceInterface.findAll();
        for (User users : userList) {

            Long nrRoli = users.getRoles().iterator().next().getId();
            users.setRoleNr(nrRoli);
        }
        model.addAttribute("userList", userList);
        return "user/users";
    }


    @GetMapping("/delete/{id}")
    public String deleteUserById(@PathVariable("id") Long id) {
        userServiceInterface.deleteById(id);
        return "redirect:/user/users";

    }
}

