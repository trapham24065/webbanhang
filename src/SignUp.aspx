<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="BTL.src.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="./CSS/SignUp.css"/>
    <title>Sign Up</title>
</head>
<body>
    <form id="form1" action="./SignUp.aspx" runat="server" method="POST" onsubmit="return validation()">
        <div class="container">
        <div class="login-section">
            <div class="login-form">
                <h2 class="slogan-login">Register</h2>
                <div class="input-form">
                    <input spellcheck="false" id="username" type="text" name="username"/>
                    <label for="username">input name</label>
                </div>
                <p id="errorUsername" runat="server"></p>
                <div class="input-form">
                    <input id="email" type="text"  name="email"/>
                    <label for="email">Email</label>
                </div>
                <p id="errorEmail" runat="server"></p>
                <div class="input-form">
                    <input id="password" type="password" />
                    <label for="password">Password</label>
                </div>
                <p id="errorPassword" runat="server"></p>

                <div class="input-form">
                    <input id="confirm-password" type="password"  name="password"/>
                    <label for="confirm-password">Re-enter the password</label>
                </div>

                <p id="errorConfirmPassword"></p>
                <input class="btn-login" type="submit" value="Register" />

                <div class="action-account">
                    <a href="#">Forgot password?</a>
                    <a href="./SignIn.aspx">Already have an account? Sign in now</a>
                </div>
            </div>
        </div>
    </div>
    </form>
    <script src="JS/SignUp.js"></script>
</body>
</html>
