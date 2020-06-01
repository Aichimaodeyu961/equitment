package equitment.dao;

import equitment.pojo.Borrow_equit_info;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Borrow_equit_infoDao {
    List<Borrow_equit_info> findBorrowEquitInfo(long id);
    Integer addBorrow_equit_info(@Param("info")Borrow_equit_info info);
    Integer deleteBorrow_equit_info(int id);
}
