package com.ifox.hgx.service;

import com.ifox.hgx.bean.Employee;
import com.ifox.hgx.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper ;

    public List<Employee> getAll(){
      return employeeMapper.selectByExampleWithDept(null) ;
    }
    public Employee getEmpById(Integer id){
        return employeeMapper.selectByPrimaryKeyWithDept(id) ;
    }
    public void putEmp(Employee emp){
        employeeMapper.updateByPrimaryKey(emp) ;
    }
}
