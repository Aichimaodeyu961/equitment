package equitment.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import equitment.pojo.Borrow_info;

public interface BorrowInfoService {
    PageInfo<Borrow_info> findBorrowInfoList(int pageNum,int pageSize ,Borrow_info info);

    Integer  borrowEquit(Borrow_info info);
    Integer  backEquit(Borrow_info info);
    Integer  deleteBorrowInfo(Borrow_info info);
}
