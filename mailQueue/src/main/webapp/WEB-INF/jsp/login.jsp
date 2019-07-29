<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="../resources/css/main.css"/>
    <title>MailQueue - LoginPage</title>
</head>
<body>
<%@include file="fragments/header.jspf" %>
<h2 align="center">Login</h2>
<form id="loginForm" action="/login" method="POST">
    <table width="350" border="0" cellpadding="4" cellspacing="1" align="center">
        <tr>
            <td colspan="2" align="center">
                <c:if test="${not empty param.error}">
                    <font color="red">Loging faild</font>
                </c:if>
            </td>
        </tr>
        <tr>
            <td align="right" width="140">
                Username
            </td>
            <td align="left">
                <input type="text" name="username" id="username"
                       size="30"/>
            </td>
        </tr>
        <tr>
            <td align="right" width="140">
                Password
            </td>
            <td align="left">
                <input type="password" name="password" id="password" size="30"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Login"/></td>
        </tr>
    </table>
</form>
<%@include file="fragments/footer.jspf" %>
</body>
</html>