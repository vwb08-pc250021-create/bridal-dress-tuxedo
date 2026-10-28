package jp.bridal.admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class AdminMenuController {
 @GetMapping({"/admin", "/admin/"})
 public String menu() { return "admin/menu"; }
}
