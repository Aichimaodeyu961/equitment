package equitment.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import equitment.dao.Borrow_equit_infoDao;
import equitment.dao.Borrow_infoDao;
import equitment.pojo.Borrow_info;
import equitment.service.BorrowInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("borrowInfoService")
public class BorrowInfoServiceImpl implements BorrowInfoService {

    @Resource
    private Borrow_infoDao borrow_infoDao;

    @Resource
    private Borrow_equit_infoDao borrow_equit_infoDao;

    @Override
    public PageInfo<Borrow_info> findBorrowInfoList(int pageNum, int pageSize , Borrow_info info) {
        PageHelper.startPage(pageNum,pageSize);
        List<Borrow_info> list = borrow_infoDao.findBorrow_infoList(info);
        PageInfo<Borrow_info> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }


    @Override
    public Integer borrowEquit(Borrow_info info) {
        return null;
    }

    @Override
    public Integer backEquit(Borrow_info info) {
        return null;
    }

    @Override
    public Integer deleteBorrowInfo(Borrow_info info) {
        return null;
    }
}
