<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit mail</title>
    <link rel="stylesheet" href="/resources/css/main.css"/>
</head>
<body>
<%@include file="../fragments/header.jspf" %>
<h2>Edit mail</h2>
<form:form action="/mail/mail-edit/${mail.id}" method="POST" modelAttribute="mail">
    To: <form:input path="recipients"/> <br/>
    Title: <form:input path="title"/> <br/>
    Message: <form:input path="message"/> <br/>
    <form:hidden path="id"/>
    <input type="submit" value="Save"/>
</form:form>
</body>
</html>