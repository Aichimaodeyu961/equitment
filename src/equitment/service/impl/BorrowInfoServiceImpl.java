package equitment.service.impl;


import cn.hutool.core.date.DateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import equitment.dao.Borrow_equit_infoDao;
import equitment.dao.Borrow_infoDao;
import equitment.dao.EquitDao;
import equitment.pojo.Borrow_equit_info;
import equitment.pojo.Borrow_info;
import equitment.pojo.User;
import equitment.service.BorrowInfoService;
import equitment.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("borrowInfoService")
@Transactional(propagation = Propagation.REQUIRED,readOnly = false)
public class BorrowInfoServiceImpl implements BorrowInfoService {

    @Resource
    private Borrow_infoDao borrow_infoDao;

    @Resource
    private Borrow_equit_infoDao borrow_equit_infoDao;

    @Resource
    private EquitDao equitDao;

    @Override
    public List<Borrow_equit_info> messageHandler(Long id , String message) {
        String[] infos = message.split(";");
        List<Borrow_equit_info> list = new ArrayList<>();
        for(String msg : infos){
            Borrow_equit_info temp = new Borrow_equit_info();
            String[] info = msg.split(",");
            temp.setBorrow_equit_info_id(id);
            temp.setEquit_id(Integer.parseInt(info[0]));
            temp.setEquit_num(Integer.parseInt(info[1]));
            list.add(temp);
        }
        return list;
    }

    @Resource
    private UserService userService;

    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    @Override
    public PageInfo<Borrow_info> findBorrowInfoList(int pageNum, int pageSize , Borrow_info info) {
        if(info.getUser()!=null && info.getUser().getUser_name()!=null){
            User user = userService.findUserByName(info.getUser().getUser_name());
            if(user!=null){
                info.setUser_id(user.getUser_id());
            }
        }
        PageHelper.startPage(pageNum,pageSize);
        List<Borrow_info> list = borrow_infoDao.findBorrow_infoList(info);
        PageInfo<Borrow_info> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    public static void main(String[] args) {
        String str = "2,3;";
        BorrowInfoServiceImpl s = new BorrowInfoServiceImpl();
        System.out.println(s.messageHandler(1L,str));
    }



    @Override
    public Integer borrowEquit(String info , Integer userid) {

        Borrow_info borrow_info = new Borrow_info();
        borrow_info.setUser_id(userid);
        long infoid = new Date().getTime();
        borrow_info.setBorrow_equit_info_id(infoid);
        borrow_info.setBorrow_num(info.split(";").length);
        borrow_info.setBorrow_date(infoid);
        long sid = DateUtil.offsetHour(new Date(infoid),3).getTime();
//        long sid = DateUtil.offsetSecond(new Date(infoid),30).getTime();
        borrow_info.setShould_back_date(sid);
        try{
            List<Borrow_equit_info> list = messageHandler(infoid,info);
            for(Borrow_equit_info i : list){
                equitDao.borrowEquit(i.getEquit_id(),i.getEquit_num());
                borrow_equit_infoDao.addBorrow_equit_info(i);
            }
            borrow_infoDao.addBorrowInfo(borrow_info);
            return 1;
        }catch (Exception e){
           System.out.println(e.getMessage());
        }
        return 0;
    }

    @Override
    public Integer backEquit(Borrow_info info) {
        Integer operate_id = info.getOperate_id();
        info = borrow_infoDao.findBorrowInfoByID(info.getBorrow_id());
        info.setOperate_id(operate_id);
        info.setBack_date(new Date().getTime());
        info.setBorrow_status("已归还");
        Long infoid = info.getBorrow_equit_info_id();
        List<Borrow_equit_info> list = borrow_equit_infoDao.findBorrowEquitInfo(infoid);
        for(Borrow_equit_info e : list){
            equitDao.backEquit(e.getEquit_id(),e.getEquit_num());
        }
        return borrow_infoDao.updateBorrowInfo(info);
    }




    @Override
    public Integer deleteBorrowInfo(Borrow_info info) {
        Integer operate_id = info.getOperate_id();
        info = borrow_infoDao.findBorrowInfoByID(info.getBorrow_id());
        info.setOperate_id(operate_id);
        info.setBorrow_status("已撤销");
        Long infoid = info.getBorrow_equit_info_id();
        List<Borrow_equit_info> list = borrow_equit_infoDao.findBorrowEquitInfo(infoid);
        for(Borrow_equit_info e : list){
            equitDao.backEquit(e.getEquit_id(),e.getEquit_num());
        }
        return borrow_infoDao.updateBorrowInfo(info);
    }

    @Override
    public Integer outEquit(Borrow_info info) {
        info.setBorrow_status("已领取");
        return borrow_infoDao.updateBorrowInfo(info);
    }
}
