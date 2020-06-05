package equitment.util;


import equitment.dao.Borrow_equit_infoDao;
import equitment.dao.Borrow_infoDao;
import equitment.dao.EquitDao;
import equitment.dao.UserDao;
import equitment.pojo.Borrow_equit_info;
import equitment.pojo.Borrow_info;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
@EnableScheduling
@Transactional(propagation = Propagation.REQUIRED,readOnly = false)
public class Quartz {

    @Resource
    private Borrow_infoDao borrow_infoDao;

    @Resource
    private Borrow_equit_infoDao borrow_equit_infoDao;
    @Resource
    private EquitDao equitDao;

    List<Borrow_info> list = new ArrayList<>();




    @Scheduled(cron = "0 */25 8-18 * * 1-5")
    public void scannerDB() {
        System.out.println("开始扫描数据库 检查是否有超时");
        Borrow_info info = new Borrow_info();
        info.setBorrow_status("已预定");
        List<Borrow_info> e = borrow_infoDao.findBorrow_infoList(info);
        long t = new Date().getTime();
        for (Borrow_info cur : e){
            if (cur.getShould_back_date()<t){
                cur.setBorrow_status("超时");
                long id = cur.getBorrow_equit_info_id();
                List<Borrow_equit_info> list = borrow_equit_infoDao.findBorrowEquitInfo(id);
                for(Borrow_equit_info tt: list){
                    equitDao.backEquit(tt.getEquit_id(),tt.getEquit_num());
                }

                borrow_infoDao.updateBorrowInfo(cur);
            }
        }
        System.out.println("扫描结束");
    }
}
