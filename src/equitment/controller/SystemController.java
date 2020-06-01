package equitment.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class SystemController {

    @RequestMapping("index")
    public String toLogin(HttpServletRequest request){
        HttpSession session = request.getSession();
        String basePath = request.getContextPath();
        session.setAttribute("basePath",basePath);
        return "login";
    }
}
