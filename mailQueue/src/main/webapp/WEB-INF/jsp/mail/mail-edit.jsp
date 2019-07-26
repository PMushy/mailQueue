<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/header.css"/>
    <title>Edit mail</title>
</head>
<body>
<h2>Edit mail</h2>
<%@include file="../fragments/header.jspf" %>
<form:form action="/mail/mail-edit/${mail.id}" method="POST" modelAttribute="mail">
    To: <form:input path="recipients"/> <br/>
    Title: <form:input path="title"/> <br/>
    Message: <form:input path="message"/> <br/>
    <form:hidden path="id"/>
    <input type="submit" value="Save"/>
</form:form>
</body>
</html>