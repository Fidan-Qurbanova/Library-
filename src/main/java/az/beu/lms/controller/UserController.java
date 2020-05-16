/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.beu.lms.controller;

import az.beu.lms.entity.User;
import az.beu.lms.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("add")
    public String add(@RequestBody User user) {
        System.out.println("Add user: " + user);
        userService.addOrUpdate(user);
        return "OK";
    }

    @GetMapping("all")
    public List<User> all() {
        return userService.getAll();
    }
   
   
    @GetMapping("{username}")
    public User getById(@PathVariable String username) {
        return userService.getById(username);
    }

    @DeleteMapping("delete/{username}")
    public String delete(@PathVariable String username) {
        userService.delete(username);
        return "OK";
    }
}
