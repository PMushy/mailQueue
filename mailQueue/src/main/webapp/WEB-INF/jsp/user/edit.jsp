<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit user</title>
</head>
<body>
<%@include file="../fragments/header.jspf" %>
<h2 align="center">Edit user: ${user.nick} ID: ${user.id}</h2>
<form:form action="/user/edit/${user.id}" method="POST" modelAttribute="user" >
    <form:hidden path="id"/>
    <form:hidden path="password"/>

    <table width="500" border="0" cellpadding="4" cellspacing="1"
           align="center">
        <tr>
            <td width="130" align="right" >Nick</td>
            <td width="270" align="left"><form:input path="nick" size="28" /></td>
        </tr>
        <tr>
            <td width="130" align="right" >Email</td>
            <td width="270" align="left"><form:input path="email" size="28" /></td>
        </tr>
        <tr>
            <td width="130" align="right" >Role</td>
            <td width="270" align="left"><form:input path="roles" size="28" /></td>
        </tr>
        <tr>
            <td width="130" align="right" >Active</td>
            <td width="270" align="left"><form:input path="active" size="28" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center" bgcolor="#fff">
                <input type="submit" value="Save" />
                <input type="button" value="Cancel" onclick="window.location.href='${pageContext.request.contextPath}/user/users'"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>