<html>
<head>
        <link href="/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div>Session ID ${sessionId}</div>
    <table>
<#list jobs as job>
    <tr>
    
        <td>${job.description}</td>
    </tr>
</#list>  
</table>
</body>
</html>