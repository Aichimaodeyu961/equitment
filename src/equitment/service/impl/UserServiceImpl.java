package equitment.service.impl;

import equitment.dao.UserDao;
import equitment.pojo.User;
import equitment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
