package az.beu.lms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication
@Controller
public class LmsApplication {

    public static void main(String[] args) {
        SpringApplication.run(LmsApplication.class, args);
    }

    @GetMapping("login")
    public String getIndexPage() {//burda da yazdiq ki path / olanad yeni default sehifede index acilsin bura kimi okdu? okaydi  //bu defaultu? aha bax
        return "index";
    }

    @GetMapping("admin") // bunu sorusurdum  deyirsen defultdu hecene yazilmayibsa defaultdu
    public String getAdminPage() {
        return "admin";
    }
    
    @GetMapping("allBooks")
    public String getAllBooksPage()
    {
        return "allBooks";
    }
    
    @GetMapping("bookUpdate")
    public String getBookUpdatePage()
    {
        return "bookUpdate";
    }
    
    @GetMapping("user")
    public String getUserPage()
    {
        return "user";
    } 
    
    @GetMapping("userUpdate")
    public String getUserUpdatePage()
    {
        return "userUpdate";
    }
    @GetMapping("orders")
    public String getOrdersPage(){
    return "orders";
    }
    
     @GetMapping("myAccount")
    public String getMyAccountPage(){
    return "myAccount";
    }
    
     @GetMapping("myOrder")
    public String getMyOrderPage(){
    return "myOrder";
    }
}
