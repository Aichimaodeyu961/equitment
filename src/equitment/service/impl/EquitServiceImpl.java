package equitment.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import equitment.dao.EquitDao;
import equitment.pojo.Equit;
import equitment.service.EquitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("equitService")
public class EquitServiceImpl implements EquitService {

    @Resource
    private EquitDao equitDao;

    @Override
    public PageInfo<Equit> findEquitList(int pageNum , int pageSize , Equit equit) {
        PageHelper.startPage(pageNum,pageSize);
        List<Equit> list = equitDao.findEquitList(equit);
        return new PageInfo<Equit>(list);
    }

    @Override
    public PageInfo<Equit> findEquitListOnStatus(int pageNum, int pageSize, Equit equit) {
        PageHelper.startPage(pageNum,pageSize);
        List<Equit> list = equitDao.findEquitListOnStatus(equit);
        return new PageInfo<Equit>(list);
    }


    @Override
    public Integer deleteEquit(Integer equit_id) {
        return equitDao.deleteEquit(equit_id);
    }

    @Override
    public Equit findById(Integer id) {
        return equitDao.findEquitByID(id);
    }


    @Override
    public Integer updateEquit(Equit equit) {
        int result;
        if (equit.getEquit_id() == null){

            result = equitDao.addEquit(equit);
        } else{
            result = equitDao.updateEquit(equit);
        }
        return result;
    }

}
