/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.beu.lms.controller;

/**
 *
 * @author Hp
 */
import az.beu.lms.entity.User;
import az.beu.lms.service.UserService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuthorizationController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/authorization", method = RequestMethod.GET)
    public void authorize(HttpServletResponse response, HttpServletRequest request) throws IOException {
        User user = authorizeLoggedInUser();
        String role = user.getRole();
        if (role == null) {
            SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);
        } else {
            request.getSession().setAttribute("role", user.getRole());

            switch (role) {
                case "Admin":
                    response.sendRedirect("/lms/admin");
                    break;
                case "User":
                    response.sendRedirect("/lms/user");
                    break;
            }
        }
    }

    private User authorizeLoggedInUser() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();//bununla alacaqsan baxaq
        System.out.println("Loggedin user: " + username);
        User user = userService.getById(username);
        if (user == null) {
            return null;
        }
        String role = user.getRole();
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role);
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(authority);
        SecurityContextHolder.getContext().setAuthentication(
                new UsernamePasswordAuthenticationToken(
                        SecurityContextHolder.getContext().getAuthentication().getPrincipal(),
                        SecurityContextHolder.getContext().getAuthentication().getCredentials(),
                        authorities)
        );
        return user;
    }
}
