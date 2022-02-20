<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="TicketReservationSystem.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS/styleSheetLogin.css" />
</head>
<body>
    <form id="form3" runat="server">
        <div class="formClass">
           
        <div class="loginLabelBlock">
            <img src="Images/Icon_admin.png"/>
            <p class="LoginLabelTop">Admin Login</p>    
        </div>
        
        <asp:TextBox ID="TxtAdminId" cssClass="input" placeholder="Admin ID" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="TxtPasswordAdmin" cssClass="input" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
        <br />
        <div class="CheckBox"> 
        <asp:CheckBox ID="ChkShowpassword"  cssClass="CheckBox" AutoPostBack="true" onCheckedChanged="ChkShowpassword_CheckedChanged" runat="server" /><label class="ChkShowPass" for="ChkShow">Show Password</label>
        </div>

        <asp:Label ID="LblErrorAdmin" runat="server" cssClass="errorMsgAdmin" Text="Incorrect Admin ID or Password" Visible="False"></asp:Label>

        <asp:Button ID="BtnLogin" cssClass="button" Text="Login" Font-Size="11pt" runat="server" OnClick="BtnLogin_Click"/>
        
        <div style="margin-top:30px">
            <p class="signUpLabel"><a href="UserLogin.aspx">Back to user login</a></p> 
        </div>
            
        
    </div>
    </form>
    <asp:SqlDataSource ID="DataSourceAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT admin.* FROM admin"></asp:SqlDataSource>
</body>
</html>
