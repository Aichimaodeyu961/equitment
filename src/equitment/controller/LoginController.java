package equitment.controller;

import equitment.pojo.User;
import equitment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    UserService userService;

    @RequestMapping("")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("login")
    public ModelAndView doLogin(User user){
        ModelAndView mv=new ModelAndView();
        User loginUser=userService.login(user);
        if(loginUser==null){
            mv.addObject("errormsg","用户名或密码不正确");
            mv.setViewName("login");
        }else {
            mv.addObject("loginUser",loginUser);
            mv.setViewName("index");
        }
        return mv;
    }
    @RequestMapping("main")
    public String toMain(){
        return "main";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session) {
        //使session失效
        session.invalidate();
        //跳转到登录界面
        return "login";
    }
}
