<%--
  Created by IntelliJ IDEA.
  User: Chathura
  Date: 9/8/2018
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/bootstrap-datetimepicker.min.css"/>
        <!--<script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/jquery.js"></script>-->
<!--       // <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/jquery-2.1.4.min.js"></script>-->
        <!--<script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/bootstrap.min.js"></script>-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/bootstrap-datetimepicker.min.js"></script>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class='col-sm-6'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker1'>
                            <input type='text' class="form-control" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $(function () {
                        $('#datetimepicker1').datetimepicker();
                    });
                </script>
            </div>
        </div>
    </body>
</html>
