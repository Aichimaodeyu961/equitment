package equitment.pojo;


import cn.hutool.core.date.DateUtil;
import lombok.Data;

import java.util.Date;

@Data
public class User {
    private Integer user_id;
    private String user_name;
    private String password;
    private Long createDate;
    private String createDateStr;
    public String getCreateDateStr(){
        return DateUtil.format(new Date(createDate),"yyyy-MM-dd HH:mm:ss");
    }
    private Integer role_id;
    private Role role;
    private Integer userStatus;

}
