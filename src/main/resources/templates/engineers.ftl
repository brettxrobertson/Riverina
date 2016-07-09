<html>
<head>
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