package jp.bridal.admin;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
@WebMvcTest(AdminMenuController.class)
class AdminMenuControllerTest {
 @Autowired MockMvc mvc;
 @Test void menuRendersForBothPaths() throws Exception {
  for (String path : new String[]{"/admin", "/admin/"}) {
   mvc.perform(get(path)).andExpect(status().isOk()).andExpect(view().name("admin/menu"))
    .andExpect(content().string(org.hamcrest.Matchers.containsString("管理者メニュー")));
  }
 }
}
