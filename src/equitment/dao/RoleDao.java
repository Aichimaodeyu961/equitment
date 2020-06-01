package equitment.dao;

import equitment.pojo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleDao {
    List<Role> findRoles(@Param("role") Role role);
    Role findRoleByID(int roleid);

    Integer addRole(@Param("role")Role role);
    Integer deleteRole(int roleid);
    Integer updateRole(@Param("role") Role role);
}
