package equitment.dao;

import equitment.pojo.Equit;
import equitment.pojo.UserStatus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EquitDao {
    List<Equit> findEquitList(@Param("equit")Equit equit);

    Equit findEquitByID(int id);

    Integer addEquit(@Param("userStatus") Equit equit);
    Integer deleteEquit(int id);
    Integer updateEquit(@Param("userStatus") Equit equit);
}
