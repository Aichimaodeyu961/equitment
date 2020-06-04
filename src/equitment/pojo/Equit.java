package equitment.pojo;

import cn.hutool.core.date.DateUtil;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Equit implements Serializable {

    private Integer equit_id;
    private String equit_name;
    private Integer equit_num;
    private Long createDate;
    private String createDateStr;
    private Integer create_user_id;
    private User user;
    private Long updateDate;
    private String updateDateStr;
    private Integer update_user_id;
    private User update_user;

    public String getCreateDateStr(){
        return DateUtil.format(new Date(createDate),"yyyy-MM-dd HH:mm:ss");
    }

    public String getUpdateDateStr(){
        return updateDate!=null?DateUtil.format(new Date(updateDate),"yyyy-MM-dd HH:mm:ss"):null;
    }
}
