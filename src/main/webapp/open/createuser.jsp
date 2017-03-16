<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {height: 450px}

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }

        /* Set black background color, white text and some padding */
        footer {
            background-color: #555;
            color: white;
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }
            .row.content {height:auto;}
        }
    </style>
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/open/login.jsp">Login</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="/secure/movies">Home</a></li>
                <li><a href="/open/homeusers">HomeUsers</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/secure/logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <c:if test="${succes_user_create_msg != null}">
        <div class="alert alert-success">
            <c:out value="${succes_user_create_msg}"/>
        </div>
    </c:if>
    <div class="row">
        <form class="form-signin" action="/open/createuser" method="post">
            <h2 class="form-signin-heading">Please sign up</h2>
            <label for="inputEmail" class="sr-only">username</label>
            <input type="text" id="inputEmail" class="form-control" placeholder="username" name="username" value="<c:out value="${selectedUser.username}"/>" required autofocus>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input type="text" id="displayname" class="form-control" placeholder="displayname" name="displayName" value="<c:out value="${selectedUser.displayName}"/>"required autofocus>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="password" required name="password" value="<c:out value="${selectedUser.password}"/>">
            <input type="hidden" name="id"  value="<c:out default="0" value="${selectedUser.id}"/>">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>

        </form>
    </div>
</div>
<br>
<br>
<br>
<br>
<footer class="container-fluid text-center">
    <p>Wagners Web App</p>
</footer>

</body>
</html>
