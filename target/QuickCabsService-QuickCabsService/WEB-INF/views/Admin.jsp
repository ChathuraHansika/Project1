<%-- 
    Document   : home
    Created on : Jun 7, 2018, 9:49:30 AM
    Author     : Chathura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>
<%@page import="java.util.Properties" %>
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Quick Cabs Admin</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="description" content="Car Rental One Page HTML Template">
    <meta name="keywords" content="one page, html, template, car, car rental, taxi, cab, booking, responsive, business">
    <meta name="author" content="sharjeel anjum">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <script src="jquery-3.3.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

    <!--Ajax-->


    <!-- Bootstrap css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/bootstrap-datetimepicker.min.css"/>

    <!-- Fontawesome css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/font-awesome.min.css">

    <!-- Magnific-popup css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/magnific-popup.css">

    <!-- Owl Carousel css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/owl.theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/owl.carousel.css">

    <!-- Main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/style.css">
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50" onload="A()">


<%!
    public static class smtpAuthenticator extends Authenticator {

        public PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication("chathurahansikadigital", "19931029");
        }

    }

%>
<%
    int result = 0;
    if (request.getParameter("send") != null) {

        String d_uname = "chathurahansikadigital";
        String d_password = "19931029";
        String d_host = "smtp.gmail.com";
        int d_port = 465;

        String m_to = request.getParameter("email");
        String m_from = "chathurahansikadigital@gmail.com";
        String m_subject = "Hello";
        String m_text = "Hello Gmail";

        Properties props = new Properties();

        smtpAuthenticator smtpauthenticator = new smtpAuthenticator();

        Session s = Session.getInstance(props, smtpauthenticator);

        MimeMessage mimeMessage = new MimeMessage(s);
        mimeMessage.setContent(m_text, "text/html");
        mimeMessage.setSubject(m_subject);
        mimeMessage.setFrom(new InternetAddress(m_from));
        mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(m_to));

        try {

            Transport transport = s.getTransport("smtps");
            transport.connect(d_host, d_port, d_uname, d_password);
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            result = 1;

        } catch (Exception e) {
            out.print(e);
        }

    }

%>

<!-- PRE LOADER -->
<div class="preloader">
    <div class="cssload-dots">
        <div class="cssload-dot"></div>
        <div class="cssload-dot"></div>
        <div class="cssload-dot"></div>
        <div class="cssload-dot"></div>
        <div class="cssload-dot"></div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $.ajax({
            url: "/QuickCabsService/loadBrands",
            type: 'GET',
            contentType: 'application/json',
            data: {"A": "s"},
            success: function (data, textStatus, jqXHR) {
                alert("Success");
                alert(data);
                alert(json.stringify(data));
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("Temp");
            }
        });
    });
</script>

<!-- Navigation Section -->
<div class="navbar custom-navbar wow fadeInDown" data-wow-duration="2s" role="navigation" id="header">
    <div class="container">

        <!-- NAVBAR HEADER -->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span
                    class="icon icon-bar"></span> <span class="icon icon-bar"></span> <span
                    class="icon icon-bar"></span></button>
            <!-- lOGO TEXT HERE -->
            <a href="index.html" class="navbar-brand">Quick <span>Cabs</span></a></div>

        <!-- NAVIGATION LINKS -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#home" class="smoothScroll">Home</a></li>
                <li><a href="#cars" class="smoothScroll">Cars</a></li>
                <li><a href="#about" class="smoothScroll">About</a></li>
                <li><a href="#service" class="smoothScroll">Service</a></li>
                <li><a href="#team" class="smoothScroll">Support</a></li>
                <li><a href="#testimonials" class="smoothScroll">Clients</a></li>
                <li><a href="#contact" class="smoothScroll">Contact</a></li>
                <li><span class="calltxt"><i class="fa fa-phone" aria-hidden="true"></i> 070 214 5806</span></li>
            </ul>
        </div>
    </div>
</div>

<!-- Home Section -->
<div id="home" class="parallax-section">
    <!--     <div class="overlay"></div>-->
    <div class="container">
        <div class="row">
            <div>
                <div class="row">


                </div>
                <div style="height: 150px" class="row "></div>

                <div class="row">

                    <label style="font-size: larger">Login</label>
                </div>
                <div class="row" style="height: 10px"></div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                    <div class="col-md-4">

                        <div class="row"><label>User Name</label></div>
                        <div class="row"> <label>Password</label></div>
                    </div>

                    <div class="col-md-8">
                        <div class="row"><input type="text"></div>
                        <div class="row" style="height: 20px;"></div>
                        <div class="row"> <input type="text"></div>
                    </div>
                    </div>
                    <div class="col-md-4"></div>

                </div>
                <div  style="height: 10px" class="row">




                </div>

            </div>
        </div>
    </div>
</div>


<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/Resources/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/Resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/bootstrap-datetimepicker.min.js"
        charset="UTF-8"></script>

<!-- Popup -->
<script src="${pageContext.request.contextPath}/Resources/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/Resources/js/magnific-popup-options.js"></script>

<!-- Carousel -->
<script src="${pageContext.request.contextPath}/Resources/js/owl.carousel.js"></script>

<!-- Sticky Header -->
<script src="${pageContext.request.contextPath}/Resources/js/jquery.sticky.js"></script>

<!-- Parallax -->
<script src="${pageContext.request.contextPath}/Resources/js/jquery.parallax.js"></script>

<!-- Counter -->
<script src="${pageContext.request.contextPath}/Resources/js/counter.js"></script>
<script src="${pageContext.request.contextPath}/Resources/js/smoothscroll.js"></script>

<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAMqMG_n4C0aAi3F8a82Q6s3hxDLrTXxe8&amp;callback=initMap"
        async defer></script>
<script src="${pageContext.request.contextPath}/Resources/js/gmap.js"></script>

<!-- Custom -->
<script src="${pageContext.request.contextPath}/Resources/js/custom.js"></script>

<!--Ajax-->

<script src="${pageContext.request.contextPath}/Resources/js/ AjaxJS.js"></script>
<script src="${pageContext.request.contextPath}/Resources/js/jquery.js"></script>
</body>

<!-- Mirrored from sharjeelanjum.com/html/car-rental/html/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 19 Apr 2018 14:30:18 GMT -->
</html>