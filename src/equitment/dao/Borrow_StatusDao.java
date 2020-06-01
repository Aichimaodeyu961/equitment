package equitment.dao;

import equitment.pojo.Borrow_Status;
import equitment.pojo.UserStatus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Borrow_StatusDao {
    List<Borrow_Status> findBorrow_StatusList(@Param("borrow_Status") Borrow_Status borrow_Status);

    UserStatus findBorrow_StatusByID(int id);

    Integer addBorrow_Status(@Param("borrow_Status") Borrow_Status borrow_Status);
    Integer deleteBorrow_Status(int id);
    Integer updateBorrow_Status(@Param("borrow_Status") Borrow_Status borrow_Status);
}
