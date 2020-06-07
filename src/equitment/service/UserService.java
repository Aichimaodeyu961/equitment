package equitment.service;

import equitment.pojo.User;

public interface UserService {
    User login(User user);
    User findUserByName(String user_name);
    Integer register(User user);
    User findUserByID(int id);
}
