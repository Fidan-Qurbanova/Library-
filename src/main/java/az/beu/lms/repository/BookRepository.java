package az.beu.lms.repository;

import az.beu.lms.entity.Book;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author Hp
 */
public interface BookRepository extends CrudRepository<Book, Integer> {

    List<Book> findAll();

}
