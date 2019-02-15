<%--
  Created by IntelliJ IDEA.
  User: Chathura
  Date: 9/7/2018
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from p.w3layouts.com/demos_new/template_demo/31-07-2018/modernize-demo_Free/509727166/web/cards.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 07 Sep 2018 01:28:47 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <title>Cards</title>
    <!-- Meta Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">


    <script type="text/javascript"
            src="${pageContext.request.contextPath}/Resources/js/adminhomejs/jquery-3.2.1.min.js"></script>
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
    <!-- Bootstrap Css -->
    <!-- Common Css -->
    <link href="${contextPath}/Resources/css/adminhomecss/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--// Common Css -->
    <!-- Nav Css -->
    <link rel="stylesheet" href="${contextPath}/Resources/css/adminhomecss/css/style4.css">
    <!--// Nav Css -->
    <!-- Fontawesome Css -->
    <link href="${contextPath}/Resources/css/adminhomecss/css/fontawesome-all.css" rel="stylesheet">
    <!--// Fontawesome Css -->
    <!--// Style-sheets -->

    <!--web-fonts-->
    <link href="http://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

    <%--new links--%>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>



    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/ AjaxJS.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/jquery.js"></script>
</head>

<body>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
<script src="https://m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {

        $("#NewBrandInputText").attr("disabled", "disabled");
        $("#NewModelinutText").attr("disabled", "disabled");
        $.ajax({
            url: "${contextPath}/loadAdminBrands",
            type: 'GET',
            contentType: 'application/json',
            success: function (data, textStatus, jqXHR) {
                // alert(JSON.stringify(data));
                console.log(data);
                for (var i = 0; i < data.length; i++) {
                    var brand = data[i];
                    console.log(brand);
                    $('#BrandData').append('<option value="' + brand.id + '">' + brand.carbrandname + '</option>')

                }
            },

            error: function (jqXHR, textStatus, errorThrown) {
                alert("Brand Load Error");
            }
        });

        var counter = 0;

        $("#addrow").on("click", function () {
            var newRow = $("<tr>");
            var cols = "";

            cols += '<td><input type="text" class="form-control" name="name' + counter + '"/></td>';
            cols += '<td><input type="text" class="form-control" name="mail' + counter + '"/></td>';
            cols += '<td><input type="text" class="form-control" name="phone' + counter + '"/></td>';

            cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
            newRow.append(cols);
            $("table.order-list").append(newRow);
            counter++;
        });



        $("table.order-list").on("click", ".ibtnDel", function (event) {
            $(this).closest("tr").remove();
            counter -= 1
        });

    });

    function getBrandModel() {

        if(document.getElementById('BrandData').value=="new_brand") {
            $("#NewBrandInputText").removeAttr("disabled");
        }

        var carbrand = document.getElementById("BrandData").value;

        $.ajax({
            url: "${contextPath}/loadAdminModels",
            type: 'POST',
            data: {"carModel": document.getElementById("BrandData").value},
            success: function (data, textStatus, jqXHR) {

                //  alert(JSON.stringify(data));
                // alert(data.length);
                $('#car_model_ID option').remove();
                for (var i = 0; i < data.length; i++) {
                    var t = data[i];
                    console.log(data[i]);
                    // alert(t.id + "     " + t.name);
                    $('#CarModel').append('<option value="' + t.id + '">' + t.name + '</option>');

                }


            }, error: function (jqXHR, textStatus, errorThrown) {

            }
        });
    }

    function getCarModel() {
        if(document.getElementById('CarModel').value=="new_model") {
            $("#NewModelinutText").removeAttr("disabled");
        }
    }

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
<body>
<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h1>
                <a href="index.html">Modernize</a>
            </h1>
            <span>M</span>
        </div>
        <div class="profile-bg"></div>
        <ul class="list-unstyled components">
            <li>
                <a href="${pageContext.request.contextPath}/home/order">
                    <i class="fas fa-th-large"></i>
                    Orders
                </a>
            </li>
            <li>
                <a href="index.html">
                    <i class="fas fa-th-large"></i>
                    Dashboard
                </a>
            </li>
            <li class="active">
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">
                    <i class="fas fa-laptop"></i>
                    Components
                    <i class="fas fa-angle-down fa-pull-right"></i>
                </a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <li>
                        <a href="cards.html">Cards</a>
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
                <a href="charts.html">
                    <i class="fas fa-chart-pie"></i>
                    Cab servcice state
                </a>
            </li>
            <li>
                <a href="grids.html">
                    <i class="fas fa-th"></i>
                    Add Vehicle
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
                                    <i class="fas fa-tasks mr-3"></i>Lorem ipsum</h4>
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
        <!--// top-bar -->
        <!---728x90--->

        <!-- main-heading -->
        <h2 class="main-title-w3layouts mb-2 text-center"></h2>
        <!--// main-heading -->
        <!---728x90--->

        <!-- Cards content -->
        <%--   <section class="cards-section">
               <div class="card-columns">
                   <div class="card">
                       <img class="card-img-top" src="${contextPath}/Resources/images/adminhomeimages/images/1.jpg" alt="Card image cap">
                       <div class="card-body">
                           <h5 class="card-title">Title goes here</h5>
                           <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.
                               This content is a little bit longer.</p>
                           <a href="#" class="btn more mt-3" data-toggle="modal" data-target="#exampleModal">Read More</a>
                           <!-- Modal -->
                           <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                               <div class="modal-dialog" role="document">
                                   <div class="modal-content">
                                       <div class="modal-header">
                                           <h5 class="modal-title" id="exampleModalLabel1">Title goes here</h5>
                                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                               <span aria-hidden="true">&times;</span>
                                           </button>
                                       </div>
                                       <div class="modal-body">
                                           <img class="card-img-top" src="${contextPath}/Resources/images/adminhomeimages/images/1.jpg" alt="Card image cap">
                                           <p class="paragraph-agileits-w3layouts my-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fringilla ornare
                                               purus id tempor. Ut non volutpat libero.Donec pellentesque, mi id rhoncus
                                               sagittis, ipsum augue vehicula elit, nec mollis metus lectus quis nibh.</p>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <!-- /Modal -->
                       </div>
                   </div>
                   <div class="card">
                       <img class="card-img-top" src="${contextPath}/Resources/images/adminhomeimages/images/2.jpg" alt="Card image cap">
                       <div class="card-body">
                           <h5 class="card-title">Title goes here</h5>
                           <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.
                               This content is a little bit longer.</p>
                           <a href="#" class="btn more mt-3" data-toggle="modal" data-target="#exampleModal1">Read More</a>
                           <!-- Modal -->
                           <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
                               <div class="modal-dialog" role="document">
                                   <div class="modal-content">
                                       <div class="modal-header">
                                           <h5 class="modal-title" id="exampleModalLabel2">Title goes here</h5>
                                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                               <span aria-hidden="true">&times;</span>
                                           </button>
                                       </div>
                                       <div class="modal-body">
                                           <img class="card-img-top" src="${contextPath}/Resources/images/adminhomeimages/images/2.jpg" alt="Card image cap">
                                           <p class="paragraph-agileits-w3layouts my-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fringilla ornare
                                               purus id tempor. Ut non volutpat libero.Donec pellentesque, mi id rhoncus
                                               sagittis, ipsum augue vehicula elit, nec mollis metus lectus quis nibh.</p>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <!-- /Modal -->
                       </div>
                   </div>
                   <div class="card p-xl-3 p-1">
                       <blockquote class="blockquote mb-0 card-body">
                           <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                           <footer class="blockquote-footer mt-2">
                               <small class="text-muted">
                                   Someone famous in
                                   <cite title="Source Title">Source Title</cite>
                               </small>
                               <a href="#" class="btn more mt-3" data-toggle="modal" data-target="#exampleModal2">Read More</a>
                               <!-- Modal -->
                               <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel3" aria-hidden="true">
                                   <div class="modal-dialog" role="document">
                                       <div class="modal-content">
                                           <div class="modal-header">
                                               <h5 class="modal-title" id="exampleModalLabel3">Title goes here</h5>
                                               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                   <span aria-hidden="true">&times;</span>
                                               </button>
                                           </div>
                                           <div class="modal-body">
                                               <p class="paragraph-agileits-w3layouts my-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fringilla
                                                   ornare purus id tempor. Ut non volutpat libero.Donec pellentesque, mi
                                                   id rhoncus sagittis, ipsum augue vehicula elit, nec mollis metus lectus
                                                   quis nibh.</p>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                               <!-- /Modal -->
                           </footer>
                       </blockquote>
                   </div>
                   <div class="card">
                       <img class="card-img-top" src="${contextPath}/Resources/images/adminhomeimages/images/3.jpg" alt="Card image cap">
                       <div class="card-body">
                           <h5 class="card-title">Title goes here</h5>
                           <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                           <p class="card-text">
                               <small class="text-muted">Last updated 3 mins ago</small>
                           </p>
                           <a href="#" class="btn more mt-3" data-toggle="modal" data-target="#exampleModal3">Read More</a>
                           <!-- Modal -->
                           <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel4" aria-hidden="true">
                               <div class="modal-dialog" role="document">
                                   <div class="modal-content">
                                       <div class="modal-header">
                                           <h5 class="modal-title" id="exampleModalLabel4">Title goes here</h5>
                                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                               <span aria-hidden="true">&times;</span>
                                           </button>
                                       </div>
                                       <div class="modal-body">
                                           <img class="card-img-top" src="${contextPath}/Resources/images/adminhomeimages/images/3.jpg" alt="Card image cap">
                                           <p class="paragraph-agileits-w3layouts my-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fringilla ornare
                                               purus id tempor. Ut non volutpat libero.Donec pellentesque, mi id rhoncus
                                               sagittis, ipsum augue vehicula elit, nec mollis metus lectus quis nibh.</p>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <!-- /Modal -->
                       </div>
                   </div>
                   <div class="card">
                       <div class="card-body">
                           <h5 class="card-title">Title goes here</h5>
                           <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                           <p class="card-text">
                               <small class="text-muted">Last updated 3 mins ago</small>
                           </p>
                           <a href="#" class="btn more mt-3" data-toggle="modal" data-target="#exampleModal4">Read More</a>
                           <!-- Modal -->
                           <div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel5" aria-hidden="true">
                               <div class="modal-dialog" role="document">
                                   <div class="modal-content">
                                       <div class="modal-header">
                                           <h5 class="modal-title" id="exampleModalLabel5">Title goes here</h5>
                                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                               <span aria-hidden="true">&times;</span>
                                           </button>
                                       </div>
                                       <div class="modal-body">
                                           <p class="paragraph-agileits-w3layouts my-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fringilla ornare
                                               purus id tempor. Ut non volutpat libero.Donec pellentesque, mi id rhoncus
                                               sagittis, ipsum augue vehicula elit, nec mollis metus lectus quis nibh.</p>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <!-- /Modal -->
                       </div>
                   </div>
                   <div class="card">
                       <img class="card-img" src="${contextPath}/Resources/images/adminhomeimages/images/4.jpg" alt="Card image">
                   </div>
                   <div class="card">
                       <div class="card-body">
                           <h5 class="card-title">Title goes here</h5>
                           <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This
                               card has even longer content than the first to show that equal height action.</p>
                           <p class="card-text">
                               <small class="text-muted">Last updated 3 mins ago</small>
                           </p>
                           <a href="#" class="btn more mt-3" data-toggle="modal" data-target="#exampleModal5">Read More</a>
                           <!-- Modal -->
                           <div class="modal fade" id="exampleModal5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel6" aria-hidden="true">
                               <div class="modal-dialog" role="document">
                                   <div class="modal-content">
                                       <div class="modal-header">
                                           <h5 class="modal-title" id="exampleModalLabel6">Title goes here</h5>
                                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                               <span aria-hidden="true">&times;</span>
                                           </button>
                                       </div>
                                       <div class="modal-body">
                                           <img class="card-img-top" src="${contextPath}/Resources/images/adminhomeimages/images/4.jpg" alt="Card image cap">
                                           <p class="paragraph-agileits-w3layouts my-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fringilla ornare
                                               purus id tempor. Ut non volutpat libero.Donec pellentesque, mi id rhoncus
                                               sagittis, ipsum augue vehicula elit, nec mollis metus lectus quis nibh.</p>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <!-- /Modal -->
                       </div>
                   </div>
                   <div class="card">
                       <img class="card-img-top" src="${contextPath}/Resources/images/adminhomeimages/images/5.jpg" alt="Card image cap">
                       <div class="card-body">
                           <h5 class="card-title">Title goes here</h5>
                           <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.
                               This content is a little bit longer.</p>
                           <a href="#" class="btn more mt-3" data-toggle="modal" data-target="#exampleModal6">Read More</a>
                           <!-- Modal -->
                           <div class="modal fade" id="exampleModal6" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel7" aria-hidden="true">
                               <div class="modal-dialog" role="document">
                                   <div class="modal-content">
                                       <div class="modal-header">
                                           <h5 class="modal-title" id="exampleModalLabel7">Title goes here</h5>
                                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                               <span aria-hidden="true">&times;</span>
                                           </button>
                                       </div>
                                       <div class="modal-body">
                                           <img class="card-img-top" src="${contextPath}/Resources/images/adminhomeimages/images/5.jpg" alt="Card image cap">
                                           <p class="paragraph-agileits-w3layouts my-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fringilla ornare
                                               purus id tempor. Ut non volutpat libero.Donec pellentesque, mi id rhoncus
                                               sagittis, ipsum augue vehicula elit, nec mollis metus lectus quis nibh.</p>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <!-- /Modal -->
                       </div>
                   </div>
               </div>--%>
        </section>
        <!---728x90--->

        <!--// Cards Header & Footer -->
        <!-- Material form contact -->
        <div class="card">

            <h5 class="card-header info-color white-text text-center py-4">
                <strong> </strong>
            </h5>

            <!--Card content-->
            <div class="card-body px-lg-5 pt-0">

                <div class="container">
                    <table id="myTable" class=" table order-list">
                        <thead>
                        <tr>
                            <td style="width: 10px">Title</td>
                            <td style="width: 10px">Name</td>
                            <td style="width: 200px">E-mail</td>
                            <td style="width: 300px">B.Date</td>
                            <td style="width: 300px">H.Date</td>
                            <td style="width: 200px">Vehicle</td>
                            <%--<td>Phone</td>--%>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <input type="text" contenteditable="false" style="width: 20px" name="name" class="form-control" />
                            </td>
                            <td>
                                <input type="mail" name="mail"  class="form-control"/>
                            </td>
                            <td>
                                <input type="text" name="phone"  class="form-control"/>
                            </td>
                            <td><a class="deleteRow"></a>

                            </td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td   style="text-align: left;">
                                <input type="button" class="btn btn-lg btn-block " id="addrow" value="Add Row" />
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        </tfoot>
                    </table>
                </div>



                <script>

                    function calculateRow(row) {
                        var price = +row.find('input[name^="price"]').val();

                    }

                    function calculateGrandTotal() {
                        var grandTotal = 0;
                        $("table.order-list").find('input[name^="price"]').each(function () {
                            grandTotal += +$(this).val();
                        });
                        $("#grandtotal").text(grandTotal.toFixed(2));
                    }
                </script>













            </div>
            <!-- Material form contact -->

            <!--// Cards Header & Footer -->

            <!--// Cards content -->

            <!-- Copyright -->

            <!--// Copyright -->
        </div>
    </div>


    <!-- Required common Js -->
    <script src='${contextPath}/Resources/js/adminhomejs/js/jquery-2.2.3.min.js'></script>
    <!-- //Required common Js -->

    <!-- Sidebar-nav Js -->
    <script>
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>
    <!--// Sidebar-nav Js -->

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
    <!-- //Js for bootstrap working -->

</body>


<!-- Mirrored from p.w3layouts.com/demos_new/template_demo/31-07-2018/modernize-demo_Free/509727166/web/cards.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 07 Sep 2018 01:28:50 GMT -->
</html>
