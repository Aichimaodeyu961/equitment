package equitment.controller;


import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import equitment.pojo.Borrow_info;
import equitment.pojo.Equit;
import equitment.pojo.User;
import equitment.service.BorrowInfoService;
import equitment.service.EquitService;
import equitment.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("borrow")
public class BorrowInfoController {

    @Resource
    private BorrowInfoService borrowInfoService;

    @Resource
    private EquitService equitService;

    @Resource
    private UserService userService;


    Map<String,Integer> map = new HashMap<>();

    @RequestMapping("getBorrowInfo")
    public ModelAndView getBorrowInfo(@RequestParam(defaultValue = "1",required = false)int pageNum, @RequestParam(defaultValue = "10",required = false)int pageSize, Borrow_info borrowInfo,HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.addObject("searchInfo",borrowInfo);
        PageInfo<Borrow_info> pageInfo = borrowInfoService.findBorrowInfoList(pageNum,pageSize,borrowInfo);
        System.out.println(pageInfo);
        mv.setViewName("borrow/list");
        mv.addObject("uri",request.getRequestURL());
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }

    @RequestMapping("test")
    public ModelAndView testt(Borrow_info info){
        ModelAndView mv = new ModelAndView();
        PageInfo<Borrow_info> pageInfo = borrowInfoService.findBorrowInfoList(1,10,info);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("borrow/list");
        return mv;
    }


    @RequestMapping("goBorrow")
    public ModelAndView goBorrow(@RequestParam(defaultValue = "1",required = false)int pageNum,@RequestParam(defaultValue = "10" , required = false)int pageSize , Equit equit,HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
//        mv.setViewName("borrow/borrowEquit");
        mv.setViewName("borrow/equit");
        mv.addObject("uri",request.getRequestURL());
        mv.addObject("searchInfo",equit);
        PageInfo<Equit> list = equitService.findEquitListOnStatus(pageNum,pageSize,equit);
        System.out.println(list);
        mv.addObject("pageInfo",list);
        return mv;
    }







    @RequestMapping("borrow")
    @ResponseBody
    public Map borrowEquit(String borrow, HttpServletRequest request) {
        int userid = ((User)request.getSession().getAttribute("loginUser")).getUser_id();
        int res = borrowInfoService.borrowEquit(borrow, userid);
        map.put("msg",res);
        return map;
    }

    @RequestMapping("back")
    @ResponseBody
    public Map backEquit(Borrow_info info){
        map.put("msg",borrowInfoService.backEquit(info));
        return map;
    }

    @RequestMapping("delete")
    @ResponseBody
    public Map deleteBorrowInfo(Borrow_info info){
        map.put("msg",borrowInfoService.deleteBorrowInfo(info));
        return map;
    }

    @RequestMapping("out")
    @ResponseBody
    public Map outEquit(Borrow_info info){
        map.put("msg",borrowInfoService.outEquit(info));
        return map;
    }


}
