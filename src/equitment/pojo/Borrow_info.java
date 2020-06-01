package equitment.pojo;


import cn.hutool.core.date.DateUtil;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class Borrow_info {
    private Integer borrow_id;
    private Integer user_id;
    private User user;
    private Long borrow_equit_info_id;
    private List<Borrow_equit_info> borrow_equit_info;
    private Integer borrow_num;
    private String borrow_status;
    private Long borrow_date;
    private String borrow_date_str;
    private Integer operate_id;
    private User operater;

    private Long should_back_date;
    private String should_back_date_str;
    private Long back_date;
    private String back_date_str;

    public String getBorrow_date_str(){
        return DateUtil.format(new Date(borrow_date),"yyyy-MM-dd HH:mm:ss");
    }

    public String getShould_back_date_str(){
        return DateUtil.format(new Date(should_back_date),"yyyy-MM-dd HH:mm:ss");
    }

    public String getBack_date_str(){
        return back_date!=null?DateUtil.format(new Date(back_date),"yyyy-MM-dd HH:mm:ss"):null;
    }

}
