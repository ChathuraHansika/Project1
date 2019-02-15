<%--
  Created by IntelliJ IDEA.
  User: Chathura
  Date: 9/7/2018
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from p.w3layouts.com/demos_new/template_demo/31-07-2018/modernize-demo_Free/509727166/web/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 07 Sep 2018 01:28:41 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <title>${contextPath}</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/jquery-3.2.1.min.js"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <!-- Meta Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Modernize Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design"/>
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta Tags -->

    <!-- Style-sheets -->
    <!-- Bootstrap Css -->
    <link href="${contextPath}/Resources/css/adminhomecss/css/bootstrap.css" rel="stylesheet" type="text/css"
          media="all"/>
    <!-- Bootstrap Css -->
    <!-- Bars Css -->
    <link rel="stylesheet" href="${contextPath}/Resources/css/adminhomecss/css/bar.css">
    <!--// Bars Css -->
    <!-- Calender Css -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/Resources/css/adminhomecss/css/pignose.calender.css"/>
    <!--// Calender Css -->
    <!-- Common Css -->
    <link href="${contextPath}/Resources/css/adminhomecss/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--// Common Css -->
    <!-- Nav Css -->
    <link rel="stylesheet" href="${contextPath}/Resources/css/adminhomecss/css/style4.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--// Nav Css -->
    <!-- Fontawesome Css -->
    <link href="${contextPath}/Resources/css/adminhomecss/css/fontawesome-all.css" rel="stylesheet">


    <!--// Fontawesome Css -->
    <!--// Style-sheets -->

    <!--web-fonts-->
    <link href="http://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <!--//web-fonts-->
</head>

<body>
<%--<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>--%>
<%--<script src="https://m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>--%>
<script>

    var notifydata;
    var socketConn1 = new WebSocket('ws://localhost:8096/QuickCabsService/my_websocket');
    socketConn1.onmessage = function (event) {

        notifydata = event.data;

        $('#wb').empty();
        $('#wb').text(event.data);
        $('#titles').valueOf(event.data);



        var message = JSON.parse(event.data);



        notifyMe(message, notifydata);
        // adds();


    }


    $(document).ready(function () {
        loadNotificatios();

        // alert("hello");
        // notifyMe();
        // adds();
        // document.getElementById('projectslabel').innerHTML = 'your tip has been submitted!';

        // var name = '<%= session.getAttribute("value") %>';
        /* console.log("name" + name);
         if (name == "null" | name == "incorrect") {
         alert("login error ");
         window.location = "/QuickCabsService/404";
         }*/
        // alert("hhhh");

        // document.getElementById('projectslabel').innerHTML = 'your tip has been submitted!';


        $.ajax({
            url: "${contextPath}/loadAdminData",
            type: 'GET',
            contentType: 'application/json',

            success: function (data, textStatus, jqXHR) {
                // alert(JSON.stringify(data));



            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("Error");
            }

        });


//        $("#addrow").on("click", function () {


//        });


        $("table.order-list").on("click", ".ibtnDel", function (event) {
            $(this).closest("tr").remove();
            counter -= 1
        });


    });

    function loadNotificatios() {

        alert("notification load run");
        $.ajax({
            url: "${contextPath}/loadNotification",
            type: 'GET',
            contentType: 'application/json',
            success: function (data, textStatus, jqXHR) {
                console.log("sucessfunction : "+ data.length);
                for(var i=0;i<data.length;i++){
                    var v=data[i];
                   // adds(v);
                    $("#alert_placeholder").append('<div id="not'+v.orderid+'" class="alert alert-success"><a class="close">×</a><span>Order ID : '+ v.orderid+'|</span><span>'+ v.title+'</span><span>'+ v.name+'</span>'+ v.email+'</span><button onclick="deletebtnfunction('+"not"+''+v.orderid+')" class="alert-success">gggggg</button></div>');







                    console.log("sucessfunction : "+ v.orderid);
                }
                console.log("sucess : "+ JSON.stringify(data));
            },
            error: function (jqXHR, textStatus, errorThrown) {

            }

        });
    }

    function deletebtnfunction(v) {
        $("#"+v.id).remove();
       // alert(v.id);
    }




    (function () {
        if (typeof _bsa !== 'undefined' && _bsa) {
            // format, zoneKey, segment:value, options
            _bsa.init('flexbar', 'CKYI627U', 'placement:w3layoutscom');
        }
    })();
</script>

<script>
    var counter = 0;
    function sss(v) {
        alert(v);
    }
    function adds(message) {
       //u console.log(message);
        console.log("msg" + message.title);



        $("#alert_placeholder").append('<div id="not"'+ message.orderid+' class="alert alert-success"><a class="close">×</a><span>Order No : '+ message.orderid+'||||</span><span>'+ message.title+'</span><span>'+ message.name+'</span>'+ message.email+'</span><button id="deletebtn" onclick="sss(this)"  class="alert-success">gggggg</button></div>');





//        $("#titles").val(message.not_id);
//        var newRow = $("<tr>");
//        var cols = "";
//        var btncount=null;

//        cols += '<td width="20px"><input type="text"  class="form-control"   id="titles" placeholder="'+message.title+'" name="title' + counter + '" readonly/></td>';
//        cols += '<td><input type="text"   class="form-control" name="name' + counter + '"/></td>';
//        cols += '<td><input type="text" class="form-control" name="mail' + counter + '"/></td>';
//        cols += '<td><input type="text" class="form-control" name="bookingdate' + counter + '"/></td>';
//        cols += '<td><input type="text" class="form-control" name="handoverdate' + counter + '"/></td>';
//        cols += '<td><input type="text" class="form-control" name="vehicle' + counter + '"/></td>';
//        cols += '<td><input type="text" class="form-control" name="phone' + counter + '"/></td>';

//        cols += '<td><input type="text" class="form-control" name="phone' + counter + '"/></td>';
//
//        cols += '<td><input type="button" class="ibtnDel btn btn-md btn-success "  value="Confirm"></td>';
//        cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Reject"></td>';
//
//        newRow.append(cols);
//        $("table.order-list").append(newRow);
//        btncount++;
//        counter++;
//
//        $("table.order-list").on("click", ".ibtnDel", function (event) {
//            console.log(btncount);
//            $(this).closest("tr").remove();
//            counter -= 1
//            updateStatus();
//        });
    }

    function updateStatus() {
        console.log("Rejected");

    }

    document.addEventListener('DOMContentLoaded', function () {
        if (!Notification) {
            alert('Desktop notifications not available in your browser. Try Chromium.');
            return;
        }

        if (Notification.permission !== "granted")
            Notification.requestPermission();
    });

    function notifyMe(messages) {
        console.log("notification" + messages);
        var msg = messages;
        adds(msg);
        if (Notification.permission !== "granted")
            Notification.requestPermission();
        else {
            var notification = new Notification('Notification title', {
                icon: 'http://cdn.sstatic.net/stackexchange/img/logos/so/so-icon.png',
                body: "New Order Recived",
            });


        }

    }
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

<body>
<div class="se-pre-con"></div>
<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h1>
                <a href="index.html">Quick Cabs</a>
            </h1>
            <span>M</span>
        </div>
        <div class="profile-bg"></div>
        <ul class="list-unstyled components">
            <li class="active">
                <a href="${contextPath}/adminhome">
                    <i class="fas fa-th-large"></i>
                    Dashboard
                </a>
            </li>
            <li>
                <a href="${contextPath}/adminhome/card">
                    <i class="fas fa-chart-pie"></i>
                    Rent
                </a>
            </li>

            <li>
                <a href="${contextPath}/adminhome/card">
                    <i class="fas fa-chart-pie"></i>
                    Add New Vehicle
                </a>
            </li>
            <%--<li>--%>
                <%--<a href="index.html">--%>
                    <%--<i class="fas fa-th-large"></i>--%>
                    <%--Add Vehicle--%>
                <%--</a>--%>
            <%--</li>--%>
            <li>
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">
                    <i class="fas fa-laptop"></i>
                    Components
                    <i class="fas fa-angle-down fa-pull-right"></i>
                </a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <li>
                        <a href="http://localhost:8096/QuickCabsService/card">Cards</a>
                    </li>
                    <li>
                        <a href="carousels.html">Carousels</a>
                    </li>
                    <li>
                        <a href="forms.html">Forms</a>
                    </li>
                    <li>
                        <a href="modals.html">Modals</a>
                    </li>
                    <li>
                        <a href="tables.html">Tables</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="${contextPath}/card">

                    <i class="fas fa-th"></i>
                    Grid Layouts
                </a>
            </li>
            <li>
                <a href="#pageSubmenu1" data-toggle="collapse" aria-expanded="false">
                    <i class="far fa-file"></i>
                    Pages
                    <i class="fas fa-angle-down fa-pull-right"></i>
                </a>
                <ul class="collapse list-unstyled" id="pageSubmenu1">
                    <li>
                        <a href="404.html">404</a>
                    </li>
                    <li>
                        <a href="500.html">500</a>
                    </li>
                    <li>
                        <a href="blank.html">Blank</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="mailbox.html">
                    <i class="far fa-envelope"></i>
                    Mailbox
                    <span class="badge badge-secondary float-md-right bg-danger">5 New</span>
                </a>
            </li>
            <li>
                <a href="widgets.html">
                    <i class="far fa-window-restore"></i>
                    Widgets
                </a>
            </li>
            <li>
                <a href="pricing.html">
                    <i class="fas fa-table"></i>
                    Pricing Tables
                </a>
            </li>
            <li>
                <a href="#pageSubmenu3" data-toggle="collapse" aria-expanded="false">
                    <i class="fas fa-users"></i>
                    User
                    <i class="fas fa-angle-down fa-pull-right"></i>
                </a>
                <ul class="collapse list-unstyled" id="pageSubmenu3">
                    <li>
                        <a href="login.html">Login</a>
                    </li>
                    <li>
                        <a href="register.html">Register</a>
                    </li>
                    <li>
                        <a href="forgot.html">Forgot password</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="maps.html">
                    <i class="far fa-map"></i>
                    Maps
                </a>
            </li>
        </ul>
    </nav>

    <!-- Page Content Holder -->
    <div id="content">
        <!-- top-bar -->
        <nav class="navbar navbar-default mb-xl-5 mb-4">
            <div class="container-fluid">

                <div class="navbar-header">
                    <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                        <i class="fas fa-bars"></i>
                    </button>
                </div>
                <!-- Search-from -->
                <form action="#" method="post" class="form-inline mx-auto search-form">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"
                           required="">
                    <button class="btn btn-style my-2 my-sm-0" type="submit">Search</button>
                </form>
                <!--// Search-from -->
                <ul class="top-icons-agileits-w3layouts float-right">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">
                            <i class="far fa-bell"></i>
                            <span class="badge">4</span>
                        </a>
                        <div class="dropdown-menu top-grid-scroll drop-1">
                            <h3 class="sub-title-w3-agileits">User notifications</h3>
                            <a href="#" class="dropdown-item mt-3">
                                <div class="notif-img-agileinfo">
                                    <img src="${contextPath}/Resources/images/adminhomeimages/images/clone.jpg"
                                         class="img-fluid" alt="Responsive image">
                                </div>
                                <div class="notif-content-wthree">
                                    <p class="paragraph-agileits-w3layouts py-2">
                                        <span class="text-diff">John Doe</span> Curabitur non nulla sit amet nisl tempus
                                        convallis quis ac lectus.</p>
                                    <h6>4 mins ago</h6>
                                </div>
                            </a>
                            <a href="#" class="dropdown-item mt-3">
                                <div class="notif-img-agileinfo">
                                    <img src="${contextPath}/Resources/images/adminhomeimages/images/clone.jpg"
                                         class="img-fluid" alt="Responsive image">
                                </div>
                                <div class="notif-content-wthree">
                                    <p class="paragraph-agileits-w3layouts py-2">
                                        <span class="text-diff">Diana</span> Curabitur non nulla sit amet nisl tempus
                                        convallis quis ac lectus.</p>
                                    <h6>6 mins ago</h6>
                                </div>
                            </a>
                            <a href="#" class="dropdown-item mt-3">
                                <div class="notif-img-agileinfo">
                                    <img src="${contextPath}/Resources/images/adminhomeimages/images/clone.jpg"
                                         class="img-fluid" alt="Responsive image">
                                </div>
                                <div class="notif-content-wthree">
                                    <p class="paragraph-agileits-w3layouts py-2">
                                        <span class="text-diff">Steffie</span> Curabitur non nulla sit amet nisl tempus
                                        convallis quis ac lectus.</p>
                                    <h6>12 mins ago</h6>
                                </div>
                            </a>
                            <a href="#" class="dropdown-item mt-3">
                                <div class="notif-img-agileinfo">
                                    <img src="${contextPath}/Resources/images/adminhomeimages/images/clone.jpg"
                                         class="img-fluid" alt="Responsive image">
                                </div>
                                <div class="notif-content-wthree">
                                    <p class="paragraph-agileits-w3layouts py-2">
                                        <span class="text-diff">Jack</span> Curabitur non nulla sit amet nisl tempus
                                        convallis quis ac lectus.</p>
                                    <h6>1 days ago</h6>
                                </div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">view all notifications</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown mx-3">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                           data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">
                            <i class="fas fa-spinner"></i>
                        </a>
                        <div class="dropdown-menu top-grid-scroll drop-2">
                            <h3 class="sub-title-w3-agileits">Shortcuts</h3>
                            <a href="#" class="dropdown-item mt-3">
                                <h4>
                                    <i class="fas fa-chart-pie mr-3"></i>Sed feugiat</h4>
                            </a>
                            <a href="#" class="dropdown-item mt-3">
                                <h4>
                                    <i class="fab fa-connectdevelop mr-3"></i>Aliquam sed</h4>
                            </a>
                            <a href="#" class="dropdown-item mt-3">
                                <h4>
                                    <i class="fas fa-tasks mr-3"></i></h4>
                            </a>
                            <a href="#" class="dropdown-item mt-3">
                                <h4>
                                    <i class="fab fa-superpowers mr-3"></i>Cras rutrum</h4>
                            </a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                           data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">
                            <i class="far fa-user"></i>
                        </a>
                        <div class="dropdown-menu drop-3">
                            <div class="profile d-flex mr-o">
                                <div class="profile-l align-self-center">
                                    <img src="${contextPath}/Resources/images/adminhomeimages/images/profile.jpg"
                                         class="img-fluid mb-3" alt="Responsive image">
                                </div>
                                <div class="profile-r align-self-center">
                                    <h3 class="sub-title-w3-agileits">Will Smith</h3>
                                    <a href="mailto:info@example.com">info@example.com</a>
                                </div>
                            </div>
                            <a href="#" class="dropdown-item mt-3">
                                <h4>
                                    <i class="far fa-user mr-3"></i>My Profile</h4>
                            </a>
                            <a href="#" class="dropdown-item mt-3">
                                <h4>
                                    <i class="fas fa-link mr-3"></i>Activity</h4>
                            </a>
                            <a href="#" class="dropdown-item mt-3">
                                <h4>
                                    <i class="far fa-envelope mr-3"></i>Messages</h4>
                            </a>
                            <a href="#" class="dropdown-item mt-3">
                                <h4>
                                    <i class="far fa-question-circle mr-3"></i>Faq</h4>
                            </a>
                            <a href="#" class="dropdown-item mt-3">
                                <h4>
                                    <i class="far fa-thumbs-up mr-3"></i>Support</h4>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="login.html">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>


        <h1 id="wb"></h1>
        <div id = "alert_placeholder"></div>

        <%--<div class="container">--%>
            <%--<table id="myTable" class=" table order-list">--%>
                <%--<thead>--%>
                <%--<tr>--%>
                    <%--<td>Title</td>--%>
                    <%--<td>Name</td>--%>
                    <%--<td>E-mail</td>--%>
                    <%--<td>B.Date</td>--%>
                    <%--<td>H.Date</td>--%>
                    <%--<td>Vehicle</td>--%>
                    <%--<td>TelephoneNumber</td>--%>
                    <%--&lt;%&ndash;<td>Phone</td>&ndash;%&gt;--%>
                <%--</tr>--%>
                <%--</thead>--%>
                <%--<tbody>--%>

                <%--</tbody>--%>
                <%--<tfoot>--%>
                <%--<tr>--%>
                    <%--<td>--%>
                        <%--<input type="button" class="btn btn-lg btn-block " id="addrow" value="Add Row"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--</tr>--%>
                <%--</tfoot>--%>
            <%--</table>--%>
        <%--</div>--%>


    </div>
</div>


<!-- Required common Js -->
<script src='/QuickCabsService/Resources/js/adminhomejs/js/jquery-2.2.3.min.js'></script>
<!-- //Required common Js -->

<!-- loading-gif Js -->
<script src="${contextPath}/Resources/js/adminhomejs/js/modernizr.js"></script>
<script>
    //paste this code under head tag or in a seperate js file.
    // Wait for window load
    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
        ;
    });
</script>
<!--// loading-gif Js -->

<!-- Sidebar-nav Js -->
<script>
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>
<!--// Sidebar-nav Js -->

<!-- Graph -->
<script src="${contextPath}/Resources/js/adminhomejs/js/SimpleChart.js"></script>
<script>
    var graphdata4 = {
        linecolor: "Random",
        title: "Thursday",
        values: [{
            X: "6",
            Y: 300.00
        },
            {
                X: "7",
                Y: 101.98
            },
            {
                X: "8",
                Y: 140.00
            },
            {
                X: "9",
                Y: 340.00
            },
            {
                X: "10",
                Y: 470.25
            },
            {
                X: "11",
                Y: 180.56
            },
            {
                X: "12",
                Y: 680.57
            },
            {
                X: "13",
                Y: 740.00
            },
            {
                X: "14",
                Y: 800.89
            },
            {
                X: "15",
                Y: 420.57
            },
            {
                X: "16",
                Y: 980.24
            },
            {
                X: "17",
                Y: 1080.00
            },
            {
                X: "18",
                Y: 140.24
            },
            {
                X: "19",
                Y: 140.58
            },
            {
                X: "20",
                Y: 110.54
            },
            {
                X: "21",
                Y: 480.00
            },
            {
                X: "22",
                Y: 580.00
            },
            {
                X: "23",
                Y: 340.89
            },
            {
                X: "0",
                Y: 100.26
            },
            {
                X: "1",
                Y: 1480.89
            },
            {
                X: "2",
                Y: 1380.87
            },
            {
                X: "3",
                Y: 1640.00
            },
            {
                X: "4",
                Y: 1700.00
            }
        ]
    };
    $(function () {
        $("#Hybridgraph").SimpleChart({
            ChartType: "Hybrid",
            toolwidth: "50",
            toolheight: "25",
            axiscolor: "#E6E6E6",
            textcolor: "#6E6E6E",
            showlegends: false,
            data: [graphdata4],
            legendsize: "140",
            legendposition: 'bottom',
            xaxislabel: 'Hours',
            title: 'Weekly Profit',
            yaxislabel: 'Profit in $'
        });
    });
</script>
<!--// Graph -->
<!-- Bar-chart -->
<script src="${contextPath}/Resources/js/adminhomejs/js/rumcaJS.js"></script>
<script src="${contextPath}/Resources/js/adminhomejs/js/example.js"></script>
<!--// Bar-chart -->
<!-- Calender -->
<script src="${contextPath}/Resources/js/adminhomejs/js/moment.min.js"></script>
<script src="${contextPath}/Resources/js/adminhomejs/js/pignose.calender.js"></script>
<script>
    //<![CDATA[
    $(function () {
        $('.calender').pignoseCalender({
            select: function (date, obj) {
                obj.calender.parent().next().show().text('You selected ' +
                    (date[0] === null ? 'null' : date[0].format('YYYY-MM-DD')) +
                    '.');
            }
        });

        $('.multi-select-calender').pignoseCalender({
            multiple: true,
            select: function (date, obj) {
                obj.calender.parent().next().show().text('You selected ' +
                    (date[0] === null ? 'null' : date[0].format('YYYY-MM-DD')) +
                    '~' +
                    (date[1] === null ? 'null' : date[1].format('YYYY-MM-DD')) +
                    '.');
            }
        });
    });
    //]]>
</script>
<!--// Calender -->

<!-- profile-widget-dropdown js-->
<script src="${contextPath}/Resources/js/adminhomejs/js/script.js"></script>
<!--// profile-widget-dropdown js-->

<!-- Count-down -->
<script src="${contextPath}/Resources/js/adminhomejs/js/simplyCountdown.js"></script>
<link href="${contextPath}/Resources/css/adminhomecss/css/simplyCountdown.css" rel='stylesheet' type='text/css'/>

<!--// Count-down -->

<!-- pie-chart -->
<script src='${contextPath}/Resources/js/adminhomejs/js/amcharts.js'></script>
<script>
    var chart;
    var legend;

    var chartData = [{
        country: "Lithuania",
        value: 260
    },
        {
            country: "Ireland",
            value: 201
        },
        {
            country: "Germany",
            value: 65
        },
        {
            country: "Australia",
            value: 39
        },
        {
            country: "UK",
            value: 19
        },
        {
            country: "Latvia",
            value: 10
        }
    ];

    AmCharts.ready(function () {
        // PIE CHART
        chart = new AmCharts.AmPieChart();
        chart.dataProvider = chartData;
        chart.titleField = "country";
        chart.valueField = "value";
        chart.outlineColor = "";
        chart.outlineAlpha = 0.8;
        chart.outlineThickness = 2;
        // this makes the chart 3D
        chart.depth3D = 20;
        chart.angle = 30;

        // WRITE
        chart.write("chartdiv");
    });
</script>
<!--// pie-chart -->

<!-- dropdown nav -->
<script>
    $(document).ready(function () {
        $(".dropdown").hover(
            function () {
                $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                $(this).toggleClass('open');
            },
            function () {
                $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                $(this).toggleClass('open');
            }
        );
    });
</script>
<!-- //dropdown nav -->

<!-- Js for bootstrap working-->
<script src="${contextPath}/Resources/js/adminhomejs/js/bootstrap.min.js"></script>
<!-- //Js for bootstrap working -->

</body>
</body>


<!-- Mirrored from p.w3layouts.com/demos_new/template_demo/31-07-2018/modernize-demo_Free/509727166/web/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 07 Sep 2018 01:28:47 GMT -->
</html>