
package az.beu.lms.controller;

import az.beu.lms.entity.Order;
import az.beu.lms.service.OrderService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("make/{bookId}")
    public String make(@PathVariable Integer bookId) {
        orderService.make(bookId);
        return "OK";
    }

    @PostMapping("makeReady/{bookId}")
    public String makeReady(@PathVariable Integer bookId) {
        orderService.makeReady(bookId);
        return "OK";
    }

    @GetMapping("all")
    public List<Order> all() {
        System.out.println("here");
        return orderService.getAll();
    }

    @GetMapping("getById/{id}")
    public Order getById(@PathVariable Integer id) {
        return orderService.getById(id);
    }

    @DeleteMapping("delete/{id}")
    public String delete(@PathVariable Integer id) {
        orderService.delete(id);
        return "Ok";
    }

}
