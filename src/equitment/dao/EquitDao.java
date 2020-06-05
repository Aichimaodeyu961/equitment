package equitment.dao;

import equitment.pojo.Equit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EquitDao {
    List<Equit> findEquitList(@Param("equit")Equit equit);
    List<Equit> findEquitListOnStatus(@Param("equit")Equit equit);
    Equit findEquitByID(int id);
    Equit findEquitByIDOnStatus(int id);

    Integer addEquit(@Param("equit") Equit equit);
    Integer deleteEquit(int id);
    Integer updateEquit(@Param("equit") Equit equit);

    Integer borrowEquit(@Param("id")Integer id,@Param("num")Integer num);
    Integer backEquit(@Param("id")Integer id,@Param("num")Integer num);

}
