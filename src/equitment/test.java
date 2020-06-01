package equitment;


import equitment.service.RoleService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/applicationContext.xml")
public class test {

    @Resource
    private RoleService roleService;

    @Test
    public void test(){
        System.out.println(roleService.findAllRole());
    }
}
