package equitment.dao;

import equitment.pojo.UserStatus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserStatusDao {
    List<UserStatus> findUserStatusList(@Param("userStatus")UserStatus userStatus);

    UserStatus findUserStatusByID(int id);

    Integer addUserStatus(@Param("userStatus")UserStatus userStatus);
    Integer deleteUserStatus(int id);
    Integer updateUserStatus(@Param("userStatus")UserStatus userStatus);
}
