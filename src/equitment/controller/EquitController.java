package equitment.controller;


import com.github.pagehelper.PageInfo;
import equitment.pojo.Equit;
import equitment.service.EquitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("equit")
public class EquitController {

    @Resource
    private EquitService equitService;

    @RequestMapping("getEquitList")
    public ModelAndView getEquitList(@RequestParam(defaultValue = "1", required = false)int pageNum, @RequestParam(defaultValue = "10" ,required = false)int pageSize, Equit equit, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("equit/list");
        mv.addObject("searchInfo",equit);
        mv.addObject("uri",request.getRequestURL());
        PageInfo<Equit> pageInfo = equitService.findEquitList(pageNum,pageSize,equit);
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }
}
