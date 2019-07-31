<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <title>Map service</title>
    <style type="text/css">
       
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script> 
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    
    <div id="openweathermap-widget-15"></div>
    <script>window.myWidgetParam ? window.myWidgetParam : window.myWidgetParam = [];  
    window.myWidgetParam.push({id: 15,cityid: '2643743',appid: '84ac436b251ba211b816950cd0b486d8',units: 'metric',containerid: 'openweathermap-widget-15',  });  
    (function() {var script = document.createElement('script');script.async = true;script.charset = "utf-8";script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(script, s);  })();
    
    <div id="openweathermap-widget-12"></div>
    window.myWidgetParam.push({id: 12,cityid: '1838524',appid: '84ac436b251ba211b816950cd0b486d8',units: 'metric',containerid: 'openweathermap-widget-12',  });  (function() {var script = document.createElement('script');script.async = true;script.charset = "utf-8";script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(script, s);  })();
    
    </script>
    </body>
</html>