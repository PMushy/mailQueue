<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/main.css"/>
    <title>MailQueue - RegisterPage</title>
</head>
<body>
<%@include file="fragments/header.jspf" %>
<h2 align="center">Register</h2>
<sf:form id="usersForm" action="/adduser" modelAttribute="user" enctype="multipart/form-data" method="POST">
    <table width="500" border="0" cellpadding="4" cellspacing="1"
           align="center">
        <tr>
            <td width="130" align="right">Nick</td>
            <td width="270" align="left"><sf:input path="nick" size="28"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><font color="red"><sf:errors path="nick"/></font></td>
        </tr>
        <tr>
            <td width="130" align="right">E-mail</td>
            <td width="270" align="left"><sf:input path="email" size="28"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><font color="red"><sf:errors path="email"/></font></td>
        </tr>
        <tr>
            <td width="130" align="right">Password</td>
            <td width="270" align="left"><sf:password path="password" size="28"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><font color="red"><sf:errors path="password"/></font></td>
        </tr>
        <tr>
            <td colspan="2" align="center" bgcolor="#fff">
                <input type="submit" value="Register" class="formbutton"/>
                <input type="reset" value="Cancel"/>
            </td>
        </tr>
    </table>
</sf:form>
<%@include file="fragments/footer.jspf" %>
</body>
</html>