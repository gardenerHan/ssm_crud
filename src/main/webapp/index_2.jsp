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
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>

            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <div class="col-md-6" id="page_info_area"></div>
        <div class="col-md-6" id="page_nav_area"></div>

    </div>
</div>

    <script type="text/javascript">
        //页面记载完后直接发送ajax请求
        $(function () {
            $.ajax({
                url:"${ssm_path}/emps" ,
                data:"pn=1",
                type:"GET",
                success:function (result) {
                  //  console.log(result) ;
                   build_emps_table(result) ;
                   build_page_info(result)  ;
                   build_page_nav(result) ;
                }
            }) ;
        }) ;
        
        function build_emps_table(result) {
            $("#emps_table tbody").empty() ;
            var empList = result.extend.pageInfo.list ;
            $.each(empList,function (index,item) {
                var empId = $("<td></td>").append(item.empId) ;
                var empName = $("<td></td>").append(item.empName) ;
                var gender = $("<td></td>").append(item.gender == 'M'?"男":"女") ;
                var email = $("<td></td>").append(item.email) ;
                var deptName = $("<td></td>").append(item.department.deptName) ;
                var editBtn  = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

                $("<tr></tr>").append(empId).append(empName).append(gender).append(email).append(deptName).append(btnTd).appendTo("#emps_table tbody") ;
            })  ;
        }

        function build_page_info(result){
            //清空内容
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+ result.extend.pageInfo.pages+"页,总"+
                result.extend.pageInfo.total+"条记录");
            totalRecord = result.extend.pageInfo.total;
            currentPage = result.extend.pageInfo.pageNum;
        }

        function build_page_nav(result){
            //page_nav_area
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if (result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled") ;
                prePageLi.addClass("disabled") ;
            }else {
                firstPageLi.click(function () {
                    to_page(1) ;
                }) ;
                prePageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum -1 ) ;
                }) ;
            }
            ul.append(firstPageLi).append(prePageLi) ;
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function(){
                    to_page(item);
                });
                ul.append(numLi);
            }) ;
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"))  ;//标签没有结尾的话 相同的标签有两个 ，会自动补全会执行的两次
            if(result.extend.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                nextPageLi.click(function(){
                    to_page(result.extend.pageInfo.pageNum +1);
                });
                lastPageLi.click(function(){
                    to_page(result.extend.pageInfo.pages);
                });
            }
            ul.append(nextPageLi).append(lastPageLi) ;
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");


        }

        function to_page(pn){
            $.ajax({
                url:"${ssm_path}/emps",
                data:"pn="+pn,
                type:"GET",
                success:function(result){
                    //console.log(result);
                    //1、解析并显示员工数据
                    build_emps_table(result);
                    //2、解析并显示分页信息
                    build_page_info(result);
                    //3、解析显示分页条数据
                    build_page_nav(result);
                }
            });
        }

    </script>

</body>
</html>
