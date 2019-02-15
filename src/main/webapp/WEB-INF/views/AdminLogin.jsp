<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from p.w3layouts.com/demos_new/template_demo/04-09-2018/material_login_form_demo_Free/1151555033/web/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 07 Sep 2018 01:37:51 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <title>Login</title>
    <!-- meta tags -->
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="keywords" content="Art Sign Up Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates,
		Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
    />
    <!-- /meta tags -->
    <!-- custom style sheet -->
    <link href="/QuickCabsService/Resources/css/adminloginstyle.css" rel="stylesheet" type="text/css"/>
    <!-- /custom style sheet -->
    <!-- fontawesome css -->
    <link href="/QuickCabsService/Resource/css/fontawesome-all.css" rel="stylesheet"/>
    <!-- /fontawesome css -->
    <!-- google fonts-->
    <link href="http://w3layouts.sharepoint.com///fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <!-- /google fonts-->

</head>

p
<body>
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
<script src="http://m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>
<script>
    (function () {
        if (typeof _bsa !== 'undefined' && _bsa) {
            // format, zoneKey, segment:value, options
            _bsa.init('flexbar', 'CKYI627U', 'placement:w3layoutscom');
        }
    })();
</script>
<script>
    (function () {
        if (typeof _bsa !== 'undefined' && _bsa) {
            // format, zoneKey, segment:value, options
            _bsa.init('fancybar', 'CKYDL2JN', 'placement:demo');
        }
    })();
</script>
<script>
    (function () {
        if (typeof _bsa !== 'undefined' && _bsa) {
            // format, zoneKey, segment:value, options
            _bsa.init('stickybox', 'CKYI653J', 'placement:w3layoutscom');
        }
    })();
</script>
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'http://www.google-analytics.com/analytics.js', 'ga');
    ga('create', 'UA-30027142-1', 'w3layouts.com');
    ga('send', 'pageview');
</script>
<body>
<!---728x90--->

<h1>Quick Cabs Service(Admin)</h1>
<!---728x90--->


<div class=" w3l-login-form">
    <h2>Login </h2>
    <form action="${contextPath}/AdminLogin" method="POST">

        <div class=" w3l-form-group">
            <label>Username:</label>
            <div class="group">
                <i class="fas fa-user"></i>
                <input type="text" name="Adminname" class="form-control" placeholder="Username" required="required"/>
            </div>
        </div>
        <div class=" w3l-form-group">
            <label>Password:</label>
            <div class="group">
                <i class="fas fa-unlock"></i>
                <input type="password" name="adminpassword" class="form-control" placeholder="Password"
                       required="required"/>
            </div>
        </div>
        <div class="forgot">
            <a href="#">Forgot Password?</a>
            <p><input type="checkbox">Remember Me</p>
        </div>
        <button type="submit" onclick="AdminLogincall()">Login</button>
    </form>
    <script>
        function AdminLogincall() {
                $.ajax({
                    url:"${contextPath}/AdminLogin",
                    type:'POST',
                    success:function(data){
                        alert(data);
                    },
                    error:function () {

                    }
                });
        }
    </script>

</div>
<!---728x90--->


</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/ AjaxJS.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/jquery.js"></script>
</body>


<!-- Mirrored from p.w3layouts.com/demos_new/template_demo/04-09-2018/material_login_form_demo_Free/1151555033/web/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 07 Sep 2018 01:37:54 GMT -->
</html>