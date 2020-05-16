package az.beu.lms.service;

import az.beu.lms.entity.Book;
import az.beu.lms.repository.BookRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Hp
 */
@Service
public class BookService {


    @Autowired
    private BookRepository bookRepository;

    public void addOrUpdate(Book book) {
        bookRepository.save(book);
    }

    public List<Book> getAll() {
        return bookRepository.findAll();
    }

    public Book getById(Integer id) {
        return bookRepository.findById(id).get();
       
    }
    public void delete(Integer id) {
        bookRepository.deleteById(id);
    }
    
 
    

}
