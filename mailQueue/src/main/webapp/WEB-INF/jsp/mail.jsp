<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>New mail</title>
</head>
<body>
<%@include file="fragments/header.jspf" %>
<h1>Create new e-mail</h1>

<from:form action="/send-mail" method="POST" modelAttribute="mail">
    To: <form:input path="recipients"/><br/>
    Title: <form:input path="title"/><br/>
    Message text: <form:input path="message"/><br/>

    <form:hidden path="sender" value="mail.getEmail"/>
    <input type="submit" value="Send"/>
    <input type="checkbox" value="Add to queue"/>
</from:form>
</body>
</html>