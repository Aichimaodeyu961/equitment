package equitment.service;

import com.github.pagehelper.PageInfo;
import equitment.pojo.User;

import java.util.List;

public interface UserService {
    User login(User user);
    User findUserByName(String name);
    PageInfo<User> listUsers(PageInfo<User> page, User user);
    void deleteUserById(Integer user_id);
    User getUserById(Integer user_id);
    Boolean checkUsername(String name);
    void updateUser(User user);
    void addUser(User user);
}
