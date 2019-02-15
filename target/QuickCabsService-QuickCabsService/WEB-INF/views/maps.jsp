<%-- 
    Document   : maps
    Created on : Jul 15, 2018, 6:59:35 AM
    Author     : Chathura
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   <link rel="stylesheet" href="/maps/documentation/javascript/cgc/demos.css">
   <style>
       #map{
           height: 400px;
           width: 100%;
       }
   </style>
  </head>
  <body>
    <div id="map"></div>
    <input type="submit" value="map" onclick="initMap()" />
    <script>
      function initMap() {
        var myLatLng = {lat: -80.2572, lng: 6.0516};

        // Create a map object and specify the DOM element
        // for display.
        var map = new google.maps.Map(document.getElementById('map'), {
          center: myLatLng,
          zoom: 4
        });

        // Create a marker and set its position.
        var marker = new google.maps.Marker({
          map: map,
          position: myLatLng,
          title: 'Hello World!'
        });
      }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD40eED0-1ai8VC9z1i_OMNoQAegXO932c&callback=initMap"
        async defer></script>
        
        AIzaSyD40eED0-1ai8VC9z1i_OMNoQAegXO932c
  </body>
</html>
