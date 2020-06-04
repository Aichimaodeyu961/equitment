package equitment.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import equitment.pojo.Borrow_equit_info;
import equitment.pojo.Borrow_info;

import java.util.List;


public interface BorrowInfoService {
    List<Borrow_equit_info> messageHandler(Long id , String message);

    PageInfo<Borrow_info> findBorrowInfoList(int pageNum,int pageSize ,Borrow_info info);

    Integer  borrowEquit(String info,Integer userid);
    Integer  backEquit(Borrow_info info);
    Integer  deleteBorrowInfo(Borrow_info info);
    Integer  outEquit(Borrow_info info);
}
