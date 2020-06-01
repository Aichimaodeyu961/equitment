package equitment.service;


import com.github.pagehelper.PageInfo;
import equitment.pojo.Role;
import org.springframework.stereotype.Service;

import java.util.List;

public interface RoleService {
    PageInfo<Role> findRoles(int startPage, int pageSize, Role role);
    List<Role> findAllRole();

}
