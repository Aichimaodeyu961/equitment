package equitment.controller;


import com.github.pagehelper.PageInfo;
import equitment.pojo.Borrow_info;
import equitment.pojo.User;
import equitment.service.BorrowInfoService;
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
@RequestMapping("borrow")
public class BorrowInfoController {

    @Resource
    private BorrowInfoService borrowInfoService;

    @RequestMapping("getBorrowInfo")
    public ModelAndView getBorrowInfo(@RequestParam(defaultValue = "1",required = false)int pageNum, @RequestParam(defaultValue = "10",required = false)int pageSize, Borrow_info borrowInfo){
        PageInfo<Borrow_info> pageInfo = borrowInfoService.findBorrowInfoList(pageNum,pageSize,borrowInfo);
        System.out.println(pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addObject("searchInfo",borrowInfo);
        mv.setViewName("borrow/borrow_list");
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }
    Map<String,Integer> map = new HashMap<>();

    @RequestMapping("borrow")
    @ResponseBody
    public Map borrowEquit(String borrow, HttpServletRequest request) {
        int userid = ((User) request.getSession().getAttribute("loginUser")).getUser_id();
        int res = borrowInfoService.borrowEquit(borrow, userid);
        map.put("msg",res);
        return map;
    }

    @RequestMapping("back")
    @ResponseBody
    public Map backEquit(Borrow_info info , HttpServletRequest request){
        info.setOperate_id(((User)request.getSession().getAttribute("loginUser")).getUser_id());
        map.put("msg",borrowInfoService.backEquit(info));
        return map;
    }

    @RequestMapping("delete")
    @ResponseBody
    public Map deleteBorrowInfo(Borrow_info info){
        map.put("msg",borrowInfoService.deleteBorrowInfo(info));
        return map;
    }
}
