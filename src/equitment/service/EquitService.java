package equitment.service;

import com.github.pagehelper.PageInfo;
import equitment.pojo.Equit;

public interface EquitService {
    PageInfo<Equit> findEquitList(int pageNum , int pageSize , Equit equit);
}