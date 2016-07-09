<html>
<head>
        <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    
    <table>
<#list engineers as engineer>
    <tr>
    
        <td>${engineer.name} ${engineer.surname}</td>
    </tr>
</#list>  
</table>
</body>
</html>