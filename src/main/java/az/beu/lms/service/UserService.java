/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.beu.lms.service;

import az.beu.lms.entity.User;
import az.beu.lms.repository.UserRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Hp
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void addOrUpdate(User user) {
        if (user.getUsername().equals("")) {
            user.setUsername(user.getFullName().replaceAll(" ", "").toLowerCase());//usere username qoyuruq bu neyleyiValid AKhundov dursa validakhundov edecek bosluq olmasin deye 
        }
        System.out.println(user);
        userRepository.save(user);
    }

    public List<User> getAll() {
        return userRepository.findAll();
    }
    
    
    public User getById(String username) {
        return userRepository.findById(username).get();

    }
    

    public void delete(String username) {
        userRepository.deleteById(username);
    }

}
