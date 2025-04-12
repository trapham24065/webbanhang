<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="BTL.src.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In</title>
    <link rel="stylesheet" href="./CSS/SignIn.css" />
</head>
<body>
    <form id="form1" runat="server" action="./SignIn.aspx" method="POST" onsubmit="return validation()">
       <div class="container">
        <div class="login-section">
            <div class="login-form">
                <h2 class="slogan-login">Log in</h2>
                <div class="input-form">
                    <input spellcheck="false" id="username" type="text"  name="username"/>
                    <label for="username">Login name</label>
                </div>
                <p id="errorUsername" runat="server"></p>
                <div class="input-form">
                    <input id="password" type="password" name="password"/>
                    <label for="password">Password</label>
                </div>
                <p id="errorPassword" runat="server"></p>

                <input class="btn-login" type="submit" value="Log in" />

                <div class="action-account">
                    <a href="#">Forgot password?</a>
                    <a href="./SignUp.aspx">Create a new account</a>
                </div>
            </div>
        </div>
    </div>
    </form>
    <script src="JS/SignIn.js"></script>
</body>
</html>
