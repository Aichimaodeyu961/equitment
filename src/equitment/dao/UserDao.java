package equitment.dao;

import equitment.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    User login(@Param("user")User user);
    List<User>  findAll(@Param("user") User user);
    User findUserByName(String name);
    User findUserByID(int id);
    Integer addUser(@Param("user")User user);
    Integer deleteUser(int id);
    Integer updateUser(@Param("user")User user);
}
