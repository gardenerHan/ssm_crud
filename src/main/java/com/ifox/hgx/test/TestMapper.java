package com.ifox.hgx.test;


import com.ifox.hgx.bean.Department;
import com.ifox.hgx.bean.Employee;
import com.ifox.hgx.dao.DepartmentMapper;
import com.ifox.hgx.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
 
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestMapper {

    @Autowired
    DepartmentMapper departmentMapper ;

    @Autowired
    EmployeeMapper employeeMapper ;

    @Autowired
    SqlSession sqlSession ;

    @Test
    public void testCRUD(){
//        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml") ;
//        DepartmentMapper departmentMapper = ioc.getBean(DepartmentMapper.class) ;
//        Department department = new Department() ;
//        department.setDeptName("行政部");
//        departmentMapper.insertSelective(department) ;

        //插入部门
//        System.out.println(departmentMapper);
//        Department department1 = new Department(1,"开发部") ;
//        Department department2= new Department(2,"测试部") ;
//
//        departmentMapper.insertSelective(department1) ;
//        departmentMapper.insertSelective(department2) ;


        //插入员工
//        employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@163.com",1,null)) ;

        //批量插入员工

        EmployeeMapper employeeMapper  = sqlSession.getMapper(EmployeeMapper.class) ;
        for (int i = 0 ; i < 1000 ; i++){
           String name =  UUID.randomUUID().toString().substring(0,5) + i ;
            employeeMapper.insertSelective(new Employee(null,name,"M",name+"@163.com",1,null)) ;

        }

    }
}
