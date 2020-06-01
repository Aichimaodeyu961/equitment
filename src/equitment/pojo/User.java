package equitment.pojo;


import cn.hutool.core.date.DateUtil;
import lombok.Data;

import java.util.Date;

@Data
public class User {
    private int user_id;
    private String user_name;
    private String password;
    private long createDate;
    private String createDateStr;
    public String getCreateDateStr(){
        return DateUtil.format(new Date(createDate),"yyyy-MM-dd HH:mm:ss");
    }
    private int role_id;
    private Role role;
    private int userStatus_id;
    private UserStatus userStatus;

}
