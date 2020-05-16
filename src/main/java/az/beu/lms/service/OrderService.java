package az.beu.lms.service;

import az.beu.lms.entity.Order;
import az.beu.lms.repository.BookRepository;
import az.beu.lms.repository.OrderRepository;
import az.beu.lms.repository.UserRepository;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private UserRepository userRepository;

    public void make(Integer bookId) {

        Order order = new Order();
        order.setStatus("pending");
        order.setBookId(bookId);
        order.setDate(new Date());
        order.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        orderRepository.save(order);
    }

    public void makeReady(Integer id) {
        Order order = orderRepository.findById(id).get();
        order.setStatus("READY");
        orderRepository.save(order);
    }

    public List<Order> getAll() {
        List<Order> orders = orderRepository.findAll();
        System.out.println(orders);

        for (Order o : orders) {
            try {
                o.setBook(bookRepository.findById(o.getBookId()).get());
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                o.setUser(userRepository.findById(o.getUsername()).get());
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        return orders;
    }

    public Order getById(Integer id) {
        Order order = orderRepository.findById(id).get();
        order.setBook(bookRepository.findById(order.getBookId()).get());
        order.setUser(userRepository.findById(order.getUsername()).get());
        return order;
    }

    public void delete(Integer id) {
        orderRepository.deleteById(id);
    }

}
