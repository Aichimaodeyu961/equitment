package equitment.pojo;


import lombok.Data;

@Data
public class Borrow_info {
    private int borrow_info_id;
    private int user_id;
    private User user;
    private int equit_id;
    private Equit equit;
    private int borrow_num;
    private int borrow_status_id;
    private Borrow_Status borrow_status;
    private long borrow_date;
    private String borrow_date_str;
    private int operate_id;
    private User operater;

}
