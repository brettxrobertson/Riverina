<html>
<head>
        <link href="/css/bootstrap.css" rel="stylesheet" />
        <link href="/css/mycss.css" rel="stylesheet">
        
</head>
<body>
    <div>Session ID ${session.attribute("sessionId")}</div>
    <table>
<#list jobs as job>
    <tr>
    
        <td>${job.description}</td>
    </tr>
</#list>  
</table>

<a href="/logout" class="button">
<span>LOGOUT</span>
</body>
</html>