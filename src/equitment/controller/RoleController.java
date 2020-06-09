package equitment.controller;


import equitment.pojo.Role;
import equitment.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("role")
public class RoleController {

    @Resource
    private RoleService roleService;



    @RequestMapping("getRoleList")
    public ModelAndView getRoleList(@RequestParam(defaultValue = "1",required = false)int pageNum, @RequestParam(defaultValue = "3",required = false)int pageSize , Role role, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("role/list");
        mv.addObject("searchInfo",role);
        mv.addObject("pageInfo", roleService.findRoles(pageNum,pageSize,role));
        mv.addObject("uri",request.getRequestURL());
        return mv;
    }

    Map<String , Integer>  map = new HashMap<>();

    @RequestMapping("deleteRole")
    @ResponseBody
    public Map deleteRole(Integer role_id){
        map.put("msg",roleService.deleteRole(role_id));
        return map;
    }

    @RequestMapping("toUpdate")
    public ModelAndView toUpdate(Integer role_id){
        ModelAndView mv = new ModelAndView();
        if(role_id!=null) {
            mv.addObject("role", roleService.findByID(role_id));
        }
        mv.setViewName("role/update");
        return mv;
    }

    @RequestMapping("doUpdate")
    @ResponseBody
    public Map doUpdate(Role role){
        map.put("msg",roleService.updateRole(role));
        return map;
    }
}
