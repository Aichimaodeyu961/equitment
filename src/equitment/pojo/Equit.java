package equitment.pojo;

import lombok.Data;

@Data
public class Equit {

    private int equit_id;
    private String equit_name;
    private int equit_num;
    private long createDate;
    private String createDateStr;
    private int create_user_id;
    private User user;
    private long updateDate;
    private String updateDateStr;
    private int update_user_id;
    private User update_user;
}
