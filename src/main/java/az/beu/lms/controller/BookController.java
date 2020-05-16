package az.beu.lms.controller;

import az.beu.lms.entity.Book;
import az.beu.lms.service.BookService;
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
@RequestMapping("api/book")
public class BookController {

    @Autowired
    private BookService bookService;

   
    @PostMapping("add")
    public String add(@RequestBody Book book) {
        System.out.println("Add book: " + book);
        bookService.addOrUpdate(book);
        return "OK";
    }

    @GetMapping("all")
    public List<Book> all() {
        return bookService.getAll();
    }
    
    @GetMapping("{id}")
    public Book getById (@PathVariable Integer id)
    {
        return bookService.getById(id);
    }
    
    @DeleteMapping("delete/{id}")
    public String delete (@PathVariable Integer id)
    {
        bookService.delete(id);
        return "Ok";
    }

}
