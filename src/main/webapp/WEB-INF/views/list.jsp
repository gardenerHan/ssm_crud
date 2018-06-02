<%--
  Created by IntelliJ IDEA.
  User: 11299
  Date: 2018/5/27
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%
        application.setAttribute("ssm_path",request.getContextPath()) ;
    %>
    <script src="${ssm_path}/static/js/jquery-1.12.4.min.js"></script>
    <link href="${ssm_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ssm_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

    <%--搭建显示页面:--%>
    <div class="container">
        <%--标题--%>
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <%--按钮--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">新增</button><button class="btn btn-danger">删除</button>
            </div>
        </div>
        <%--显示数据--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender=='M'?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>   编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash "  aria-hidden="true"></span>
                                    删除</button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
         <%--显示分页信息--%>
        <div class="row">
            <div class="col-md-6">当前第${pageInfo.pageNum}页,总共${pageInfo.pages},总共${pageInfo.total}</div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="#">首页</a>
                        </li>
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">末页</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>


    <%--<%--%>
        <%--PageInfo pi = (PageInfo) request.getAttribute("pageInfo");--%>

     <%--%>--%>

    <%--<%= pi.getTotal()%>--%>
    <%--<br>--%>
    <%--<%= pi.getPages()%>--%>
    <%--<br>--%>
    <%--<%= pi.getPageNum()%>--%>
    <%--<br>--%>

    <%--<%--%>
        <%--//获取员工数据--%>
        <%--List<Employee> list = pi.getList();--%>
        <%--for (Employee employee : list) {--%>
    <%--%>--%>
    <%--<%=employee.getEmpId()%>--%>
    <%--------->--%>
    <%--<%=employee.getEmpName()%>--%>
    <%--<%--%>
        <%--}--%>
    <%--%>--%>
</body>
</html>
