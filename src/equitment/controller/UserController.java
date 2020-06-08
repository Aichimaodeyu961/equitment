package equitment.controller;

import com.github.pagehelper.PageInfo;
import equitment.pojo.Role;
import equitment.pojo.User;
import equitment.service.RoleService;
import equitment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;



    @RequestMapping("listUsers")
    public ModelAndView listUsers(@RequestParam(defaultValue="1")Integer pageNum, User user, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("user/user-list");
        String uri = request.getRequestURI();
        mv.addObject("uri", uri);
        PageInfo<User> page = new PageInfo<User>();
        page.setPageNum(pageNum);
        page.setPageSize(5);
        PageInfo<User> userpage = userService.listUsers(page,user);
        mv.addObject("searchdata",user);
        mv.addObject("pageInfo", userpage);
        return mv;
    }


    @RequestMapping("deleteUserById")
    public String deleteUserById(Integer user_id) {
        userService.deleteUserById(user_id);
        return "redirect:/user/listUsers";
    }


    @RequestMapping("getUserById")
    public ModelAndView getUserById(Integer user_id) {
        ModelAndView mv = new ModelAndView("user/user_edit");
        User user =userService.getUserById(user_id);
        List<Role> roles = roleService.findAllRole();
        mv.addObject("roles", roles);
        mv.addObject("user", user);
        return mv;
    }
    @ResponseBody
    @RequestMapping("checkUsername")
    public String checkUsername(String name) {
        String msg = "notExist";
        boolean flag = userService.checkUsername(name);
        if(flag) {
            msg = "isExist";
        }
        return msg;
    }


    @RequestMapping("updateUser")
    public String updateUser(User user) {
        userService.updateUser(user);
        return "redirect:/user/listUsers";
    }
}

