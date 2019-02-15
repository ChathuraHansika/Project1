<%-- 
    Document   : home
    Created on : Jun 7, 2018, 9:49:30 AM
    Author     : Chathura
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <title>${contextPath}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="description" content="Car Rental One Page HTML Template">
    <meta name="keywords" content="one page, html, template, car, car rental, taxi, cab, booking, responsive, business">
    <meta name="author" content="sharjeel anjum">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


    <!-- Bootstrap -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/jquery-2.1.4.min.js"></script>


    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/bootstrap-datetimepicker.min.js"
            charset="UTF-8"></script>

    <!-- Popup -->
    <script type="text/javascript"
            src="${contextPath}/Resources/js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="${contextPath}/Resources/js/magnific-popup-options.js"></script>

    <!-- Carousel -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/owl.carousel.js"></script>

    <!-- Sticky Header -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/jquery.sticky.js"></script>

    <!-- Parallax -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/jquery.parallax.js"></script>

    <!-- Counter -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/counter.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/smoothscroll.js"></script>

    <!-- Google Map -->
    <%--<script type="text/javascript"--%>
            <%--src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAMqMG_n4C0aAi3F8a82Q6s3hxDLrTXxe8&amp;callback=initMap"--%>
            <%--async defer></script>--%>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/gmap.js"></script>--%>

    <!-- Custom -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/custom.js"></script>

    <!--Ajax-->

    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/ AjaxJS.js"></script>--%>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/jquery.js"></script>--%>

    <!--<script type="text/javascript" src="jquery-3.3.1.min.js"></script>-->
    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/jquery-3.2.1.min.js"></script>--%>
    <%--<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>--%>
<%----%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/c/style.css">

</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">


<!-- PRE LOADER -->
<%--<div class="preloader">--%>
    <%--<div class="cssload-dots">--%>
        <%--<div class="cssload-dot"></div>--%>
        <%--<div class="cssload-dot"></div>--%>
        <%--<div class="cssload-dot"></div>--%>
        <%--<div class="cssload-dot"></div>--%>
        <%--<div class="cssload-dot"></div>--%>
    <%--</div>--%>
<%--</div>--%>

<script type="text/javascript">


    $(document).ready(function () {
        notifyMe();
        $.ajax({
            url: "${contextPath}/loadBrands",
            type: 'GET',
            contentType: 'application/json',
            success: function (data, textStatus, jqXHR) {
                // alert(JSON.stringify(data));
                console.log(data);
                for (var i = 0; i < data.length; i++) {
                    var brand = data[i];
                    console.log(brand);
                    $('#car_brands_ID').append('<option value="' + brand.id + '">' + brand.carbrandname + '</option>')
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("Brand Load Error");
            }

        });
    });

    ////        -- Load Models --


    //get Car Model

    function getCarModel() {
        $.ajax({
            url: "${contextPath}/loadModels",
            type: 'POST',
            data: {"carModel": document.getElementById("car_brands_ID").value},
            success: function (data, textStatus, jqXHR) {


                $('#car_model_ID option').remove();
                for (var i = 0; i < data.length; i++) {
                    var t = data[i];
                    console.log(data[i]);
                    // alert(t.id + "     " + t.name);
                    $('#car_model_ID').append('<option value="' + t.id + '">' + t.name + '</option>');

                }


            }, error: function (jqXHR, textStatus, errorThrown) {

            }
        });
    }

    document.addEventListener('DOMContentLoaded', function () {
        if (!Notification) {
            alert('Desktop notifications not available in your browser. Try Chromium.');
            return;
        }

        if (Notification.permission !== "granted")
            Notification.requestPermission();
    });

    function notifyMe() {
        if (Notification.permission !== "granted")
            Notification.requestPermission();
        else {
            var notification = new Notification('Quick Cabs', {
                icon: '${pageContext.request.contextPath}/Resources/images/cars/01.jpg',
                body: "Welcome to Quick Cabs!",
            });


        }

    }
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


<div id="home" style="background-image:" class="parallax-section">
    <!--     <div class="overlay"></div>-->
    <div class="container">
        <div class="row">
            <div class="col-md-offset-1 col-md-10 col-sm-12">
                <div class="slide-text">
                    <h3>What we offer? <a href="#" class="typewrite" data-period="2000"
                                          data-type='[ "Car Rental", "Special Rates", "Best Cars"]'> <span
                            class="wrap"></span> </a></h3>
                    <h1>Welcome to Quick Cabs!</h1>
                    <p>The NO 1 Cab Service in Sri Lanka</p>
                    <a href="#Booking" class="btn btn-default section-btn">Book Your Car</a></div>
            </div>
        </div>
    </div>
</div>

<!-- Form Section -->
<div id="Booking">
    <div class="container">
        <div class="bformBox">
            <h3>BOOK YOUR CAR TODAY!</h3>
            <form action="/QuickCabsService/save" name="myForm">
                <div class="row">
                    <div class="formrow">
                        <div class="col-md-6">
                            <div class="formrow">

                                <div class="input-group date form_datetime" data-date="2018-02-22 05:25"
                                     data-date-format="yyyy-MM-dd hh:mm" data-link-field="dtp_input1">
                                    <input class="form-control" size="16" type="text" value="" readonly
                                           placeholder="Select Date and Time" name="Booking_datetime_name"
                                           id="Booking_date_time_id" required>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-remove"></span></span>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-calendar"></span></span></div>
                            </div>
                        </div>

                        <div class="col-md-6">


                            <div class="formrow">
                                <div class="input-group date form_datetime" data-date="2018-02-22 05:25"
                                     data-date-format="yyyy-MM-dd hh:mm" data-link-field="dtp_input1">
                                    <input class="form-control" size="16" type="text" value="" readonly
                                           placeholder="Select Date and Time" name="Hndover_datetime_name"
                                           id="Handover_date_time_id" required onchange="getDateNotVehicle()">
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-remove"></span></span>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-calendar"></span></span></div>
                            </div>


                            <script  type="text/javascript">
                                function getDateNotVehicle() {

                                    var bookingdate = document.getElementById("Booking_date_time_id").value;
                                    var handoverdate = document.getElementById("Handover_date_time_id").value;

                                    alert(bookingdate + handoverdate);
                                    $.ajax({
                                        url: "${contextPath}/checkVehicleNotDate",
                                        type: 'GET',
                                        data: {"bookingdate": bookingdate, "handoverdate": handoverdate},
                                        success: function (data, textStatus, jqXHR) {

                                        }, error: function (jqXHR, textStatus, errorThrown) {

                                        }

                                    });

                                }
                            </script>


                        </div>


                    </div>
                </div>
                <div class="row" style="height: 20px"></div>
                <div class="row">

                    <div class="col-md-6 col-sm-6">
                        <div class="formrow">
                            <select class="form-control" name="car_brand_name" id="car_brands_ID"
                                    onchange="getCarModel()">
                                <option value="default">Select Your Car Brand For Booking</option>
                            </select>
                        </div>

                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="formrow">
                            <select class="form-control" name="car_model_name" id="car_model_ID">
                                <option value="">Select Your Car Model For Booking</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col-md-2 col-sm-2">
                        <div class="formrow">
                            <select class="form-control" id="title_id" name="Title_name">
                                <option value="">Your Title</option>
                                <option>Mr.</option>
                                <option>Mrs.</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="formrow">
                            <input onchange="checkMail()" type="email" class="form-control" id="email_ID"
                                   placeholder="Your Email" name="email"
                                   required>

                        </div>
                        <script>
                            function checkMail() {
                                alert("mail check");
                                $.ajax({
                                    url: "${contextPath}/checkEmail",
                                    type: 'POST',
                                    data: {"Email": document.getElementById("email_ID").value},
                                    success: function (data, textStatus, jqXHR) {
                                        console.log("null : " + JSON.stringify(data));
                                        $('#name_id').val(data.name);
                                        $('#phone_id').val(data.phoneNumber);
                                    }, error: function (jqXHR, textStatus, errorThrown) {

                                    }

                                });
                            }
                        </script>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="formrow">
                            <input type="text" class="form-control" placeholder="Your Name" name="name" id="name_id"
                                   required>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <div class="formrow">
                            <input type="text" id="phone_id" class="form-control" placeholder="Phone" name="phone"
                                   required>
                        </div>
                    </div>
                </div>
                <div class="formbtn">
                    <input type="submit" class="btn" onclick="saveOrder()" value="Submit Car Booking">
                </div>

                <input type="submit" value="saves" name="send" onclick="A()">


                <script>
                    function A() {
                        alert("Run");
                        $.ajax({
                            url: "/${contextPath}/sentEmail",
                            type: 'GET',
                            contentType: 'application/json',

                            success: function (data, textStatus, jqXHR) {

                            },
                            error: function (jqXHR, textStatus, errorThrown) {

                            }
                        });
                    }


                </script>
            </form>
        </div>
    </div>
</div>


<script>
    function saveOrder() {

        var selected_brand = document.getElementById("car_brands_ID").value;
        var selected_model = document.getElementById("car_model_ID").value;
        var Booking_date_time = document.getElementById("Booking_date_time_id").value;
        var Handover_date_time = document.getElementById("Handover_date_time_id").value;
        var Title = document.getElementById("title_id").value;
        var Name = document.getElementById("name_id").value;
        var Email = document.getElementById("email_ID").value;
        var Phone_Number = document.getElementById("phone_id").value;
       console.log(${"Order_Number"});
    }
</script>

<!-- Cars Section -->
<div class="parallax-section" id="cars">
    <div class="container">
        <div class="section-title">
            <h3>Vehicle Models <span>For Rent</span></h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet, massa ac ornare feugiat, nunc dui
                auctor ipsum, sed posuere eros sapien id quam. Maecenas odio nisi, efficitur eget</p>
        </div>
        <div class="vehiclesList">
            <ul class="carsmodals">
                <li class="item">
                    <div class="row">
                        <div class="col-md-3">
                            <h3>BMW 3-SERIES</h3>
                            <div class="subtitle">ModernLine</div>
                            <div class="carPrice"><strong>$99</strong> <span>/Day</span></div>
                            <a href="#" class="btn"><i class="fa fa-calendar" aria-hidden="true"></i> Reserve Now</a>
                        </div>
                        <div class="col-md-6"><a href="${pageContext.request.contextPath}/Resources/images/cars/01.jpg"
                                                 class="image-popup"><img
                                src="${pageContext.request.contextPath}/Resources/images/cars/01.jpg" alt=""/></a></div>
                        <div class="col-md-3">
                            <div class="carinfo">
                                <ul>
                                    <li>Doors: <strong>4</strong></li>
                                    <li>Passengers: <strong>5</strong></li>
                                    <li>Luggage: <strong>2 Bags</strong></li>
                                    <li>Transmission: <strong>Automatic</strong></li>
                                    <li>Air conditioning: <strong>Dual Zone</strong></li>
                                    <li>Minimum age: <strong>35 years</strong></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="item">
                    <div class="row">
                        <div class="col-md-3">
                            <h3>Subaru Impreza</h3>
                            <div class="subtitle">Premium</div>
                            <div class="carPrice"><strong>$125</strong> <span>/Day</span></div>
                            <a href="#" class="btn"><i class="fa fa-calendar" aria-hidden="true"></i> Reserve Now</a>
                        </div>
                        <div class="col-md-6"><a href="${pageContext.request.contextPath}/Resources/images/cars/02.jpg"
                                                 class="image-popup"><img
                                src="${pageContext.request.contextPath}/Resources/images/cars/02.jpg" alt=""/></a></div>
                        <div class="col-md-3">
                            <div class="carinfo">
                                <ul>
                                    <li>Doors: <strong>4</strong></li>
                                    <li>Passengers: <strong>5</strong></li>
                                    <li>Luggage: <strong>2 Bags</strong></li>
                                    <li>Transmission: <strong>Automatic</strong></li>
                                    <li>Air conditioning: <strong>Dual Zone</strong></li>
                                    <li>Minimum age: <strong>35 years</strong></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="item">
                    <div class="row">
                        <div class="col-md-3">
                            <h3>Hyundai Santa Fe XL</h3>
                            <div class="subtitle">Streetsville H</div>
                            <div class="carPrice"><strong>$199</strong> <span>/Day</span></div>
                            <a href="#" class="btn"><i class="fa fa-calendar" aria-hidden="true"></i> Reserve Now</a>
                        </div>
                        <div class="col-md-6"><a href="${pageContext.request.contextPath}/Resources/images/cars/03.jpg"
                                                 class="image-popup"><img
                                src="${pageContext.request.contextPath}/Resources/images/cars/03.jpg" alt=""/></a></div>
                        <div class="col-md-3">
                            <div class="carinfo">
                                <ul>
                                    <li>Doors: <strong>4</strong></li>
                                    <li>Passengers: <strong>5</strong></li>
                                    <li>Luggage: <strong>2 Bags</strong></li>
                                    <li>Transmission: <strong>Automatic</strong></li>
                                    <li>Air conditioning: <strong>Dual Zone</strong></li>
                                    <li>Minimum age: <strong>35 years</strong></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="item">
                    <div class="row">
                        <div class="col-md-3">
                            <h3>Honda Vizel</h3>
                            <div class="subtitle">Streetsville H</div>
                            <div class="carPrice"><strong>$215</strong> <span>/Day</span></div>
                            <a href="#" class="btn"><i class="fa fa-calendar" aria-hidden="true"></i> Reserve Now</a>
                        </div>
                        <div class="col-md-6"><a href="${pageContext.request.contextPath}/Resources/images/cars/04.jpg"
                                                 class="image-popup"><img
                                src="${pageContext.request.contextPath}/Resources/images/cars/04.jpg" alt=""/></a></div>
                        <div class="col-md-3">
                            <div class="carinfo">
                                <ul>
                                    <li>Doors: <strong>4</strong></li>
                                    <li>Passengers: <strong>5</strong></li>
                                    <li>Luggage: <strong>2 Bags</strong></li>
                                    <li>Transmission: <strong>Automatic</strong></li>
                                    <li>Air conditioning: <strong>Dual Zone</strong></li>
                                    <li>Minimum age: <strong>35 years</strong></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

<!-- Service 1 -->
<div class="servicesbox bg1">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-6">
                <h3>Car Rentals</h3>
                <div class="ctoggle">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tincidunt mauris est, in
                        faucibus dui viverra et. Aliquam finibus vestibulum elit, at pharetra nisl congue vel. Nunc
                        pretium posuere justo pretium fringilla. Sed volutpat risus non rhoncus convallis. Sed fermentum
                        est at hendrerit pellentesque. Mauris nec leo euismod, sagittis mauris in, posuere est...</p>
                    <a href="#" class="readmore">Read More <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- About section -->
<div id="about">
    <div class="container">
        <div class="section-title">
            <h3>About <span>Quick</span> Cabs</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet, massa ac ornare feugiat, nunc dui
                auctor ipsum, sed posuere eros sapien id quam. Maecenas odio nisi, efficitur eget</p>
        </div>
        <div class="about-desc">
            <div class="row">
                <div class="col-md-7">
                    <ul class="circleList row">
                        <li class="col-md-4 col-sm-4">
                            <div class="cricle"><i class="fa fa-car" aria-hidden="true"></i></div>
                            <div class="title">Mauris convallis felis</div>
                        </li>
                        <li class="col-md-4 col-sm-4">
                            <div class="cricle"><i class="fa fa-users" aria-hidden="true"></i></div>
                            <div class="title">Mauris convallis felis</div>
                        </li>
                        <li class="col-md-4 col-sm-4">
                            <div class="cricle"><i class="fa fa-tags" aria-hidden="true"></i></div>
                            <div class="title">Mauris convallis felis</div>
                        </li>
                    </ul>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                        ut laoreet dolore magna aliquam erat volutpat. <br>
                        <br>
                        Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut
                        aliquip ex ea commodo consequat.</p>
                    <ul class="orderlist">
                        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                        <li>Sed a mauris at ex lobortis hendrerit in nec felis.</li>
                        <li>Nunc sed urna sit amet sapien rhoncus pretium congue id sem.</li>
                        <li>Vivamus sagittis sapien a tellus consequat rutrum.</li>
                        <li>Mauris at justo malesuada ligula accumsan tincidunt quis efficitur orci.</li>
                    </ul>
                </div>
                <div class="col-md-5">
                    <div class="postimg"><img src="${pageContext.request.contextPath}/Resources/images/about-img.jpg">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Counter Section -->
<div id="counter">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-12 counter-item">
                <div class="counterbox">
                    <div class="counter-icon"><i class="fa fa-users" aria-hidden="true"></i></div>
                    <span class="counter-number" data-from="1" data-to="499" data-speed="1000"></span> <span
                        class="counter-text">Happy Client</span></div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-12 counter-item">
                <div class="counterbox">
                    <div class="counter-icon"><i class="fa fa-car" aria-hidden="true"></i></div>
                    <span class="counter-number" data-from="1" data-to="199" data-speed="2000"></span> <span
                        class="counter-text">Cars</span></div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-12 counter-item">
                <div class="counterbox">
                    <div class="counter-icon"><i class="fa fa-map-signs" aria-hidden="true"></i></div>
                    <span class="counter-number" data-from="1" data-to="50" data-speed="3000"></span> <span
                        class="counter-text">Destinations</span></div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-12 counter-item">
                <div class="counterbox">
                    <div class="counter-icon"><i class="fa fa-trophy" aria-hidden="true"></i></div>
                    <span class="counter-number" data-from="1" data-to="199" data-speed="4000"></span> <span
                        class="counter-text">Awards</span></div>
            </div>
        </div>
    </div>
</div>

<!-- Service Section -->
<div id="service" class="parallax-section">
    <div class="container">
        <!-- Section Title -->
        <div class="section-title">
            <h3>Car Rental <span>Services</span></h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet, massa ac ornare feugiat, nunc dui
                auctor ipsum, sed posuere eros sapien id quam. Maecenas odio nisi, efficitur eget</p>
        </div>
        <div class="row">
            <!-- Service 1 -->
            <div class="col-md-4 col-sm-6">
                <div class="service-thumb">
                    <div class="thumb-icon"><i class="fa fa-phone" aria-hidden="true"></i></div>
                    <h4>Phone Reservation</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit pellentesque.</p>
                </div>
            </div>

            <!-- Service 2 -->
            <div class="col-md-4 col-sm-6">
                <div class="service-thumb">
                    <div class="thumb-icon"><i class="fa fa-money" aria-hidden="true"></i></div>
                    <h4>Special Rates</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit pellentesque.</p>
                </div>
            </div>

            <!-- Service 3 -->
            <div class="col-md-4 col-sm-6">
                <div class="service-thumb">
                    <div class="thumb-icon"><i class="fa fa-road" aria-hidden="true"></i></div>
                    <h4>One Way Rental</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit pellentesque.</p>
                </div>
            </div>

            <!-- Service 4 -->
            <div class="col-md-4 col-sm-6">
                <div class="service-thumb">
                    <div class="thumb-icon"><i class="fa fa-umbrella" aria-hidden="true"></i></div>
                    <h4>Life Insurance</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit pellentesque.</p>
                </div>
            </div>

            <!-- Service 5 -->
            <div class="col-md-4 col-sm-6">
                <div class="service-thumb">
                    <div class="thumb-icon"><i class="fa fa-building" aria-hidden="true"></i></div>
                    <h4>City to City</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit pellentesque.</p>
                </div>
            </div>

            <!-- Service 6 -->
            <div class="col-md-4 col-sm-6">
                <div class="service-thumb">
                    <div class="thumb-icon"><i class="fa fa-car" aria-hidden="true"></i></div>
                    <h4>Free Rides</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit pellentesque.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Tagline Section -->
<div class="taglinewrap">
    <div class="container">
        <h2>Get Started Today</h2>
        <p>Sed sed neque laoreet, rhoncus libero id, pharetra est. Sed ut neque est. Maecenas et est sagittis, mollis
            risus dignissim, mattis dolor. </p>
        <a href="#">Purchase Now <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
</div>

<!-- Team Section -->
<div id="team" class="parallax-section">
    <div class="container">

        <!-- Dection Title -->
        <div class="section-title">
            <h3>Customer <span>Suport</span> Center</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet, massa ac ornare feugiat, nunc dui
                auctor ipsum, sed posuere eros sapien id quam. Maecenas odio nisi, efficitur eget.</p>
        </div>
        <div class="row">
            <!-- team 1 -->
            <div class="col-md-3 col-sm-6">
                <div class="team-thumb">
                    <div class="thumb-image"><img
                            src="${pageContext.request.contextPath}/Resources/images/team/team-img1.jpg" alt=""></div>
                    <h4>Sophia DOE</h4>
                    <h5>Support Manager</h5>
                    <div class="contct"><i class="fa fa-phone" aria-hidden="true"></i> +1-123-456-7890</div>
                    <div class="contct"><i class="fa fa-envelope-o" aria-hidden="true"></i> joseph@example.com</div>
                    <ul class="list-inline social">
                        <li><a href="javascript:void(0);" class="bg-twitter"><i class="fa fa-twitter"
                                                                                aria-hidden="true"></i></a></li>
                        <li><a href="javascript:void(0);" class="bg-facebook"><i class="fa fa-facebook"
                                                                                 aria-hidden="true"></i></a></li>
                        <li><a href="javascript:void(0);" class="bg-linkedin"><i class="fa fa-linkedin"
                                                                                 aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>

            <!-- team 2 -->
            <div class="col-md-3 col-sm-6">
                <div class="team-thumb">
                    <div class="thumb-image"><img
                            src="${pageContext.request.contextPath}/Resources/images/team/team-img2.jpg" alt=""></div>
                    <h4>Emily DOE</h4>
                    <h5>Support Manager</h5>
                    <div class="contct"><i class="fa fa-phone" aria-hidden="true"></i> +1-123-456-7890</div>
                    <div class="contct"><i class="fa fa-envelope-o" aria-hidden="true"></i> joseph@example.com</div>
                    <ul class="list-inline social">
                        <li><a href="javascript:void(0);" class="bg-twitter"><i class="fa fa-twitter"
                                                                                aria-hidden="true"></i></a></li>
                        <li><a href="javascript:void(0);" class="bg-facebook"><i class="fa fa-facebook"
                                                                                 aria-hidden="true"></i></a></li>
                        <li><a href="javascript:void(0);" class="bg-linkedin"><i class="fa fa-linkedin"
                                                                                 aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>

            <!-- team 3 -->
            <div class="col-md-3 col-sm-6">
                <div class="team-thumb">
                    <div class="thumb-image"><img
                            src="${pageContext.request.contextPath}/Resources/images/team/team-img3.jpg" alt=""></div>
                    <h4>Olivia DOE</h4>
                    <h5>Support Manager</h5>
                    <div class="contct"><i class="fa fa-phone" aria-hidden="true"></i> +1-123-456-7890</div>
                    <div class="contct"><i class="fa fa-envelope-o" aria-hidden="true"></i> joseph@example.com</div>
                    <ul class="list-inline social">
                        <li><a href="javascript:void(0);" class="bg-twitter"><i class="fa fa-twitter"
                                                                                aria-hidden="true"></i></a></li>
                        <li><a href="javascript:void(0);" class="bg-facebook"><i class="fa fa-facebook"
                                                                                 aria-hidden="true"></i></a></li>
                        <li><a href="javascript:void(0);" class="bg-linkedin"><i class="fa fa-linkedin"
                                                                                 aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>

            <!-- team 4 -->
            <div class="col-md-3 col-sm-6">
                <div class="team-thumb">
                    <div class="thumb-image"><img
                            src="${pageContext.request.contextPath}/Resources/images/team/team-img4.jpg" alt=""></div>
                    <h4>MARTIN DOE</h4>
                    <h5>Support Manager</h5>
                    <div class="contct"><i class="fa fa-phone" aria-hidden="true"></i> +1-123-456-7890</div>
                    <div class="contct"><i class="fa fa-envelope-o" aria-hidden="true"></i> joseph@example.com</div>
                    <ul class="list-inline social">
                        <li><a href="javascript:void(0);" class="bg-twitter"><i class="fa fa-twitter"
                                                                                aria-hidden="true"></i></a></li>
                        <li><a href="javascript:void(0);" class="bg-facebook"><i class="fa fa-facebook"
                                                                                 aria-hidden="true"></i></a></li>
                        <li><a href="javascript:void(0);" class="bg-linkedin"><i class="fa fa-linkedin"
                                                                                 aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Testimonials Section -->
<div id="testimonials">
    <div class="container">

        <!-- Section Title -->
        <div class="section-title">
            <h3>Testimonials</h3>
        </div>
        <ul class="testimonialsList">
            <!-- Client -->
            <li class="item">
                <div class="rating"><i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
                                                                                     aria-hidden="true"></i> <i
                        class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i
                        class="fa fa-star" aria-hidden="true"></i></div>
                <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum viverra id nunc at finibus.
                    Etiam sollicitudin faucibus cursus. Proin luctus cursus nulla sed iaculis. Quisque vestibulum augue
                    nec aliquet aliquet."</p>
                <div class="clientname">Jhon Doe</div>
                <div class="clientinfo">CEO - Company Inc</div>
            </li>

            <!-- Client -->
            <li class="item">
                <div class="rating"><i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
                                                                                     aria-hidden="true"></i> <i
                        class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i
                        class="fa fa-star" aria-hidden="true"></i></div>
                <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum viverra id nunc at finibus.
                    Etiam sollicitudin faucibus cursus. Proin luctus cursus nulla sed iaculis. Quisque vestibulum augue
                    nec aliquet aliquet."</p>
                <div class="clientname">Jhon Doe</div>
                <div class="clientinfo">CEO - Company Inc</div>
            </li>

            <!-- Client -->
            <li class="item">
                <div class="rating"><i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
                                                                                     aria-hidden="true"></i> <i
                        class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i
                        class="fa fa-star" aria-hidden="true"></i></div>
                <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum viverra id nunc at finibus.
                    Etiam sollicitudin faucibus cursus. Proin luctus cursus nulla sed iaculis. Quisque vestibulum augue
                    nec aliquet aliquet."</p>
                <div class="clientname">Jhon Doe</div>
                <div class="clientinfo">CEO - Company Inc</div>
            </li>

            <!-- Client -->
            <li class="item">
                <div class="rating"><i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
                                                                                     aria-hidden="true"></i> <i
                        class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i
                        class="fa fa-star" aria-hidden="true"></i></div>
                <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum viverra id nunc at finibus.
                    Etiam sollicitudin faucibus cursus. Proin luctus cursus nulla sed iaculis. Quisque vestibulum augue
                    nec aliquet aliquet."</p>
                <div class="clientname">Jhon Doe</div>
                <div class="clientinfo">CEO - Company Inc</div>
            </li>
        </ul>
    </div>
</div>

<!-- Blog Section -->
<div id="blog">
    <div class="container">
        <!-- SECTION TITLE -->
        <div class="section-title">
            <h3>Latest From <span>Blog</span></h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </div>
        <ul class="blogGrid">
            <li class="item">
                <div class="int">

                    <!-- Blog Image -->
                    <div class="postimg"><img src="${pageContext.request.contextPath}/Resources/images/blog/1.jpg"
                                              alt="Blog Title"></div>
                    <!-- Blog info -->
                    <div class="post-header">
                        <div class="date"><i class="fa fa-calendar" aria-hidden="true"></i> Feb 01, 2018</div>
                        <h4><a href="#.">Duis ultricies aliquet mauris</a></h4>
                        <div class="postmeta">By : <span>Jhon Doe </span> Category : <a href="#.">Car Rental</a></div>
                        <a href="#." class="readmore">Read More <i class="fa fa-long-arrow-right"
                                                                   aria-hidden="true"></i></a></div>
                </div>
            </li>
            <li class="item">
                <div class="int">

                    <!-- Blog Image -->
                    <div class="postimg"><img src="${pageContext.request.contextPath}/Resources/images/blog/2.jpg"
                                              alt="Blog Title"></div>
                    <!-- Blog info -->
                    <div class="post-header">
                        <div class="date"><i class="fa fa-calendar" aria-hidden="true"></i> Feb 01, 2018</div>
                        <h4><a href="#.">Duis ultricies aliquet mauris</a></h4>
                        <div class="postmeta">By : <span>Jhon Doe </span> Category : <a href="#.">Car Rental </a></div>
                        <a href="#." class="readmore">Read More <i class="fa fa-long-arrow-right"
                                                                   aria-hidden="true"></i></a></div>
                </div>
            </li>
            <li class="item">
                <div class="int">

                    <!-- Blog Image -->
                    <div class="postimg"><img src="${pageContext.request.contextPath}/Resources/images/blog/3.jpg"
                                              alt="Blog Title"></div>
                    <!-- Blog info -->
                    <div class="post-header">
                        <div class="date"><i class="fa fa-calendar" aria-hidden="true"></i> Feb 01, 2018</div>
                        <h4><a href="#.">Duis ultricies aliquet mauris</a></h4>
                        <div class="postmeta">By : <span>Jhon Doe </span> Category : <a href="#.">Car Rental</a></div>
                        <a href="#." class="readmore">Read More <i class="fa fa-long-arrow-right"
                                                                   aria-hidden="true"></i></a></div>
                </div>
            </li>
            <li class="item">
                <div class="int">

                    <!-- Blog Image -->
                    <div class="postimg"><img src="${pageContext.request.contextPath}/Resources/images/blog/4.jpg"
                                              alt="Blog Title"></div>
                    <!-- Blog info -->
                    <div class="post-header">
                        <div class="date"><i class="fa fa-calendar" aria-hidden="true"></i> Feb 01, 2018</div>
                        <h4><a href="#.">Duis ultricies aliquet mauris</a></h4>
                        <div class="postmeta">By : <span>Jhon Doe </span> Category : <a href="#.">Car Rental</a></div>
                        <a href="#." class="readmore">Read More <i class="fa fa-long-arrow-right"
                                                                   aria-hidden="true"></i></a></div>
                </div>
            </li>
        </ul>
    </div>
</div>

<!-- Newsletter-->
<div class="newsletter">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h3>Newsletter</h3>
                <p>Subscribe for our weekly newsletter.</p>
            </div>
            <div class="col-md-8">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Enter Your Email Address">
                    <span class="input-group-btn">
                                <button class="btn btn-secondary" type="button">Sign Up <i class="fa fa-paper-plane"
                                                                                           aria-hidden="true"></i></button>
                            </span></div>
            </div>
        </div>
    </div>
</div>

<!-- Google Map Section -->
<div id="map"></div>

<!-- Contact Section -->
<div id="contact">
    <div class="container">

        <!-- Dection Title -->
        <div class="section-title">
            <h3>Contact <span>Us</span></h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet, massa ac ornare feugiat, nunc dui
                auctor ipsum, sed posuere eros sapien id quam. Maecenas odio nisi, efficitur eget.</p>
        </div>

        <!-- CONTACT FORM HERE -->
        <div class="row">
            <div class="col-md-8">
                <div class="contact-form">
                    <form id="contact-form" class="row"
                          action="http://sharjeelanjum.com/html/car-rental/html/feedback.php" method="POST">
                        <div class="col-md-6 col-sm-6">
                            <input type="text" class="form-control" name="name" placeholder="Name" required>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <input type="email" class="form-control" name="email" placeholder="Email" required>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <input type="tel" class="form-control" name="phone" placeholder="Phone">
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <input type="text" class="form-control" name="address" placeholder="Address">
                        </div>
                        <div class="col-md-12 col-sm-12">
                            <textarea class="form-control" rows="5" name="message" placeholder="Message"></textarea>
                        </div>
                        <div class="col-md-12">
                            <button id="submit" type="submit" class="form-control" name="submit">Send Message</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                <div class="contact-now">
                    <div class="contact"><span><i class="fa fa-home"></i></span>
                        <div class="information"><strong>Address:</strong>
                            <p>8500 lorem, New Ispum, Dolor amet sit 12301</p>
                        </div>
                    </div>
                    <!-- Contact Info -->
                    <div class="contact"><span><i class="fa fa-envelope"></i></span>
                        <div class="information"><strong>Email Address:</strong>
                            <p>investigate@your-site.com</p>
                            <p>investigate@your-site.com</p>
                        </div>
                    </div>
                    <!-- Contact Info -->
                    <div class="contact"><span><i class="fa fa-phone"></i></span>
                        <div class="information"><strong>Phone No:</strong>
                            <p>+12 345 67 09</p>
                            <p>+12 345 67 09</p>
                        </div>
                    </div>
                    <!-- Contact Info -->
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Clients Logo-->
<div class="our-clients">
    <div class="container">

        <!-- Section Title -->
        <div class="section-title">
            <h3>Our <span>Partners</span></h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet, massa ac ornare feugiat, nunc dui
                auctor ipsum, sed posuere eros sapien id quam. Maecenas odio nisi, efficitur eget.</p>
        </div>
        <div class="owl-clients">
            <div class="item"><img src="${pageContext.request.contextPath}/Resources/images/client-logo4.png" alt="">
            </div>
            <div class="item"><img src="${pageContext.request.contextPath}/Resources/images/client-logo.png" alt="">
            </div>
            <div class="item"><img src="${pageContext.request.contextPath}/Resources/images/client-logo2.png" alt="">
            </div>
            <div class="item"><img src="${pageContext.request.contextPath}/Resources/images/client-logo3.png" alt="">
            </div>
            <div class="item"><img src="${pageContext.request.contextPath}/Resources/images/client-logo.png" alt="">
            </div>
            <div class="item"><img src="${pageContext.request.contextPath}/Resources/images/client-logo3.png" alt="">
            </div>
            <div class="item"><img src="${pageContext.request.contextPath}/Resources/images/client-logo2.png" alt="">
            </div>
            <div class="item"><img src="${pageContext.request.contextPath}/Resources/images/client-logo3.png" alt="">
            </div>
            <div class="item"><img src="${pageContext.request.contextPath}/Resources/images/client-logo.png" alt="">
            </div>
            <div class="item"><img src="${pageContext.request.contextPath}/Resources/images/client-logo3.png" alt="">
            </div>
            <div class="item"><img src="${pageContext.request.contextPath}/Resources/images/client-logo2.png" alt="">
            </div>
        </div>
    </div>
</div>
<!-- Clients Logo end-->

<!-- Footer Section -->
<footer>
    <div class="container">
        <!-- social Section -->
        <div class="socialLinks"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a> <a href="#"><i
                class="fa fa-twitter" aria-hidden="true"></i></a> <a href="#"><i class="fa fa-linkedin"
                                                                                 aria-hidden="true"></i></a> <a
                href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a> <a href="#"><i class="fa fa-behance"
                                                                                                 aria-hidden="true"></i></a>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="footer-copyright">
                    <p>&copy; 2018 Car Rentals | All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </div>
</footer>


</body>

<!-- Mirrored from sharjeelanjum.com/html/car-rental/html/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 19 Apr 2018 14:30:18 GMT -->
</html>