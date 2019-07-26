package com.pl.mailQueue.controller;

import com.pl.mailQueue.domain.model.User;
import com.pl.mailQueue.service.UserService;
import com.pl.mailQueue.utilities.UserUtilities;
import com.pl.mailQueue.validators.ChangePasswordValidator;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Locale;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    @Autowired
    private ChangePasswordValidator changePasswordValidator;

    private final UserService userService;

    @Autowired
    MessageSource messageSource;

    @GetMapping("/profil")
    @Secured(value = {"ROLE_ADMIN", "ROLE_USER"})
    public String showUserProfilePage(Model model) {
        String userName = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(userName);
        Long roleNr = user.getRoles().iterator().next().getId();
        user.setRoleNr(roleNr);
        model.addAttribute("user", user);
        return "user/profil";
    }

    @GetMapping("/edit-password")
    @Secured(value = {"ROLE_ADMIN", "ROLE_USER"})
    public String editPassword(Model model) {
        String userName = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(userName);
        model.addAttribute("user", user);
        return "user/edit-password";
    }

    @GetMapping("/edit/{id}")
    @Secured(value = {"ROLE_ADMIN"})
    public String editUserById(@PathVariable("id") Long id, Model model) {
        Optional<User> maybeUser = userService.findUserById(id);
        if (maybeUser.isPresent()) {
            model.addAttribute("user", maybeUser.get());
            return "/user/edit";
        } else return "redirect:user/users";
    }

    @PostMapping("/edit/{id}")
    @Secured(value = {"ROLE_ADMIN"})
    public String editUser(@ModelAttribute("user") User user) {
        userService.editUser(user);
        return "redirect:user/users";
    }

    @PostMapping("/update-pass")
    @Secured(value = {"ROLE_ADMIN", "ROLE_USER"})
    public String updateUserPass(User user, BindingResult result, Model model, Locale locale) {
        String returnPage = null;
        changePasswordValidator.checkPasswords(user.getNewPassword(), result);
        changePasswordValidator.validate(user, result);
        if (result.hasErrors()) {
            returnPage = "user/edit-password";
        } else {
            userService.updateUserPassword(user.getNewPassword(), user.getEmail());
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
        List<User> userList = userService.findAll();
        for (User users : userList) {
            Long nrRoli = users.getRoles().iterator().next().getId();
            users.setRoleNr(nrRoli);
        }
        model.addAttribute("userList", userList);
        return "user/users";
    }

    @GetMapping("/delete/{id}")
    @Secured(value = {"ROLE_ADMIN"})
    public String deleteUserById(@PathVariable("id") Long id) {
        userService.deleteById(id);
        return "redirect:/user/users";
    }

}

