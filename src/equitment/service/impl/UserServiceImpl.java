package equitment.service.impl;

import equitment.dao.UserDao;
import equitment.pojo.User;
import equitment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public User findUserByName(String user_name) {
        return userDao.findUserByName(user_name);
    }

    @Override
    public Integer register(User user) {
        user.setCreateDate(new Date().getTime());
        user.setRole_id(4);
        user.setUserStatus(1);
        return userDao.addUser(user);
    }

    @Override
    public User findUserByID(int id) {
        return userDao.findUserByID(id);
    }
}
