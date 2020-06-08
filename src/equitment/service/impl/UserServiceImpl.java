package equitment.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import equitment.dao.UserDao;
import equitment.pojo.User;
import equitment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public User findUserByName(String name) {
        return userDao.findUserByName(name);
    }

    @Override
    public PageInfo<User> listUsers(PageInfo<User> page, User user) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<User> users = userDao.findAll(user);
        page = new PageInfo<User>(users);
        return page;
    }


    @Override
    public void deleteUserById(Integer user_id) {
        userDao.deleteUser(user_id);
    }

    @Override
    public User getUserById(Integer user_id) {
        User user = userDao.findUserByID(user_id);
        return user;
    }

    @Override
    public Boolean checkUsername(String name) {
        boolean flag = false;
        User num = userDao.findUserByName(name);
        if(num!=null) {//存在
            flag = true;
        }
        return flag;
    }


    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }
}



