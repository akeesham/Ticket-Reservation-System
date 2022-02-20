
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="TicketReservationSystem.UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS/styleSheetLogin.css" />
</head>
<body>
    <form id="form1" runat="server">

            <div class="formClass">
           
            <div class="loginLabelBlock">
                <img src="Images/Icon_user.png"/>
                <p class="LoginLabelTop">User Login</p>    
            </div>
        
            <asp:TextBox ID="TxtUserName" cssClass="input" placeholder="Username" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="TxtPassword" cssClass="input" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
            <br />

            <div class="CheckBox">
            <asp:CheckBox ID="ChkShowpasswordUser"  cssClass="CheckBox" AutoPostBack="true" onCheckedChanged="ChkShowpasswordUser_CheckedChanged" runat="server" /><label class="ChkShowPass" for="ChkShow">Show Password</label>
            </div>
    
            <asp:Label ID="LblError" runat="server" cssClass="errorMsg" Text="Incorrect Username or Password" Visible="False"></asp:Label>

            <asp:Button ID="BtnLogin" cssClass="button" Text="Login" Font-Size="11pt" runat="server" OnClick="BtnLogin_Click"/>
        
            <div style="margin-top:30px">
                <p class="signUpLabel">Don't have an account? <a href="UserSignUp.aspx">Create one</a></p> 
            </div>
        
        </div>

        <asp:Button ID="BtnAdminLogin" cssClass="buttonAdmin"  Text="Login as Admin" OnClick="BtnAdminLogin_Click" Font-Size="11pt" runat="server"/>
        
        

    </form>
    <asp:SqlDataSource ID="DataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT users.* FROM users"></asp:SqlDataSource>
</body>
</html>
