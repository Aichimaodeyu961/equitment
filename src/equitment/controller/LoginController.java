package equitment.controller;

import equitment.pojo.User;
import equitment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    UserService userService;

    @RequestMapping("")
    public String toLogin(){
        return "login2";
    }

    @RequestMapping("login")
    public ModelAndView doLogin(User user, HttpServletRequest request){
        request.getSession().setAttribute("basePath",request.getContextPath());
        ModelAndView mv=new ModelAndView();
        User loginUser=userService.login(user);
        if(loginUser==null){
            mv.addObject("errormsg","用户名或密码不正确");
            mv.setViewName("login");
        }else {
            request.getSession().setAttribute("loginUser",loginUser);
            mv.setViewName("index2");
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

    @ResponseBody
    @RequestMapping("rename")
    public Map<String,Integer> reName(String user_name){
        Map<String,Integer> map=new HashMap<>();
        if(userService.findUserByName(user_name)!=null){
            map.put("code",1);
        }else {
            map.put("code",0);
        }
        return map;
    }
    @RequestMapping("register")
    @ResponseBody
    public Map<String,Integer> doRegister(User user){
        Map<String,Integer> map=new HashMap<>();
        if(userService.register(user)==1){
            map.put("code",1);
        }else {
            map.put("code",0);
        }
        return map;
    }


}
