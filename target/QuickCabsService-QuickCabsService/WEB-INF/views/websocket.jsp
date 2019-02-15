<%--
  Created by IntelliJ IDEA.
  User: chathura
  Date: 8/31/2018
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
<h1 id="hiid"></h1>
</body>
<script>

    var socketConn1 = new WebSocket('ws://localhost:8096/QuickCabsService/my_websocket');
    socketConn1.onmessage = function (event) {
        console.log(event);
        $('#hiid').empty();
        $('#hiid').text(event.data);


    }
</script>
</html>
