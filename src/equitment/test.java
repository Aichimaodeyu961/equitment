package equitment;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.RandomUtil;
import equitment.dao.*;
import equitment.pojo.*;
import equitment.service.RoleService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.sql.SQLOutput;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/applicationContext.xml")
public class test {

    @Resource
    private RoleDao roleDao;


    @Resource
    private UserDao userDao;

    @Resource
    private EquitDao equitDao;

    @Resource
    private Borrow_infoDao borrowDao;

    @Resource
    private Borrow_equit_infoDao borDao;

    @Test
    public void infoDao(){
//        Borrow_equit_info info = new Borrow_equit_info();
//        info.setBorrow_equit_info_id(2);
        System.out.println(borDao.deleteBorrow_equit_info(2));
    }

    @Test
    public void BorrowTest(){
//        Borrow_info info = new Borrow_info();
//        info.setUser_id(3);
//        Long random = new Date().getTime();
//        info.setBorrow_equit_info_id(random);
//        info.setBorrow_num(20);
//        Date temp = new Date();
//        System.out.println(temp);
//        info.setBorrow_date(temp.getTime());
//        info.setOperate_id(3);
//        Date date = DateUtil.offsetHour(temp,2);
//        System.out.println(date);
//        info.setShould_back_date(date.getTime());
//        System.out.println(borrowDao.addBorrowInfo(info));
//        Borrow_info info = new Borrow_info();
//        info.setBorrow_id(2);
//        info.setBorrow_status("已借出");
//        System.out.println(borrowDao.updateBorrowInfo(info));
        System.out.println(borrowDao.deleteBorrowInfo(2));
    }

    @Test
    public void equitTest(){

//        Equit equit = new Equit();
//        equit.setEquit_name("足球");
//        equit.setEquit_num(200);
//        equit.setCreateDate(new Date().getTime());
//        equit.setCreate_user_id(3);
//        System.out.println(equitDao.addEquit(equit));
//        Equit equit = new Equit();
//        equit.setEquit_id(2);
//        equit.setEquit_name("篮球1");
//        equit.setUpdate_user_id(2);
//        equit.setUpdateDate(new Date().getTime());
        System.out.println(equitDao.deleteEquit(2));
    }

    @Test
    public void RoleTest(){
//        Role role
//                 = new Role();
//        role.setRole_id(5);
//        role.setRole_name("开发人员1");
        System.out.println(roleDao.deleteRole(5));
    }


    @Test
    public void test(){
//        User user = new User();
//        user.setUser_name("test");
//        user.setPassword("test");
//        user.setCreateDate(new Date().getTime());
//        user.setRole_id(4);
//        user.setUserStatus(1);
//        System.out.println(userDao.addUser(user));
////        User user = userDao.findUserByID(2);
//        user.setUserStatus(0);
//        System.out.println(userDao.findAll(user));
//        User user = new User();
//        user.setUser_id(3);
//        user.setPassword("456789");
//        System.out.println(userDao.updateUser(user));
    }
}
