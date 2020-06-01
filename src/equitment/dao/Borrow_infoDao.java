package equitment.dao;

import equitment.pojo.Borrow_info;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Borrow_infoDao {
    List<Borrow_infoDao> findBorrow_infoList(@Param("info")Borrow_info info);
    Borrow_info findBorrowInfoByID(int id);
    Integer addBorrowInfo(@Param("info") Borrow_info info);
    Integer deleteBorrowInfo(int id);
    Integer updateBorrowInfo(@Param("info")Borrow_info info);
}
