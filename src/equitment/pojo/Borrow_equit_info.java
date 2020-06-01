package equitment.pojo;

import lombok.Data;
import org.omg.CORBA.INTERNAL;


@Data
public class Borrow_equit_info {
    private Integer borrow_equit_id;
    private Long borrow_equit_info_id;
    private Integer equit_id;
    private Equit equit;
    private Integer equit_num;
}
