package equitment.controller;


import com.github.pagehelper.PageInfo;
import equitment.pojo.Equit;
import equitment.pojo.User;
import equitment.service.EquitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("equit")
public class EquitController {

    @Resource
    private EquitService equitService;

    Map<String,Integer> map = new HashMap<>();

    @RequestMapping("getEquitList")
    public ModelAndView getEquitList(@RequestParam(defaultValue = "1", required = false)int pageNum, @RequestParam(defaultValue = "10" ,required = false)int pageSize, Equit equit, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("equit/list");
        mv.addObject("searchInfo",equit);
        mv.addObject("uri",request.getRequestURL());
        PageInfo<Equit> pageInfo = equitService.findEquitListOnStatus(pageNum,pageSize,equit);
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }


    


    @RequestMapping("delete")
    @ResponseBody
    public Map deleteEquit(Integer equit_id){
        map.put("msg",equitService.deleteEquit(equit_id));
        return map;
    }

    @RequestMapping("goUpdate")
    public ModelAndView toUpdatePage(@RequestParam(required = false) Integer equit_id){
        ModelAndView mv = new ModelAndView();
        if(equit_id!=null){
            Equit equit = equitService.findById(equit_id);
            mv.addObject("equit",equit);
        }
        mv.setViewName("equit/update");
        return mv;
    }

    @RequestMapping("update")
    @ResponseBody
    public Map updateEquit(Equit equit,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("loginUser");
        Integer user_id = user.getUser_id();
        Long t = new Date().getTime();
        if(equit.getEquit_id()==null) {

            equit.setCreate_user_id(user_id);
            equit.setCreateDate(t);
        }else{
            equit.setUpdate_user_id(user_id);
            equit.setUpdateDate(t);
        }
        map.put("msg",equitService.updateEquit(equit));
        return map;
    }
}
