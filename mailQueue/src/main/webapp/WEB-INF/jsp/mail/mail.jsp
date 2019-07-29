<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>New mail</title>
    <link rel="stylesheet" href="../resources/css/main.css"/>
</head>
<body>
<%@include file="../fragments/header.jspf" %>
<h1 align="center">Create new e-mail</h1>
<sf:form action="/mail/create" method="POST" id="mailForm" enctype="multipart/form-data" modelAttribute="mail">
    <table width="350" border="0" cellpadding="4" cellspacing="1" align="center">
        <tr>
            <td width="130" align="right">To</td>
            <td width="270" align="left"><sf:input path="recipients" size="28"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><font color="red"><sf:errors path="recipients"/></font></td>
        </tr>
        <tr>
            <td align="right" width="140"> Title</td>
            <td align="left"><sf:input path="title" size="28"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><font color="red"><sf:errors path="title"/></font></td>
        </tr>
        <tr>
            <td align="right" width="140"> Message</td>
            <td align="left"><sf:input path="message" size="28"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><font color="red"><sf:errors path="message"/></font></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="Add to queue"/></td>
        </tr>
    </table>
</sf:form>
</body>
</html>