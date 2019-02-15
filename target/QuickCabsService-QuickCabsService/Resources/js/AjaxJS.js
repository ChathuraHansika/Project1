$("#btn-test").click(function(){
    //step one

    var httpRequest;

    if(window.XMLHttpRequest){
        httpRequest=new XMLHttpRequest();
    }else if(window.ActiveXObject){
        httpRequest=new ActiveXObject("Microsoft.XMLHTTP");
    }

    // step two
    httpRequest.onreadystatechange=function () {
        if(httpRequest.readyState === 4 && httpRequest.status===200){
            var xml=$(httpRequest.responseXML);
            var partner=xml.find("paala partner").text();
            $("#div-output").text("palage partner:"+partner);

        }

    };

    //step three
    httpRequest.open('GET','database.xml',true);

    //step four optional

    //step five
    httpRequest.send();
});