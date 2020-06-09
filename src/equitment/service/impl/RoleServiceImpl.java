package equitment.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import equitment.dao.RoleDao;
import equitment.pojo.Role;
import equitment.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleDao roleDao;

    @Override
    public PageInfo<Role> findRoles(int startPage, int pageSize, Role role) {
        PageHelper.startPage(startPage,pageSize);
        List<Role> roles = roleDao.findRoles(role);
        return new PageInfo<Role>(roles);
    }

    @Override
    public List<Role> findAllRole() {
        return roleDao.findRoles(null);
    }

    @Override
    public Role findByID(Integer id) {
        return roleDao.findRoleByID(id);
    }



    @Override
    public Integer deleteRole(Integer id) {
        return roleDao.deleteRole(id);
    }

    @Override
    public Integer updateRole(Role role) {
        return role.getRole_id()==null?roleDao.addRole(role):roleDao.updateRole(role);
    }
}
