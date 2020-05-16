/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.beu.lms.repository;

import az.beu.lms.entity.User;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author Hp
 */
public interface UserRepository extends CrudRepository<User, String> {
    List<User> findAll();
}
