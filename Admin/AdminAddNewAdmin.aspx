<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAddNewAdmin.aspx.cs" Inherits="TicketReservationSystem.Admin.AdminAddNewAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="AdminAddNewAdmin.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="formClass">
           
        <div class="loginLabelBlock">
            <img src="Icons_Images/Icon_create.png"/>
            <p class="LoginLabelTop">New admin</p>    
        </div>
        
        <div class="RequiredField">
            <asp:RequiredFieldValidator ID="Required_AdminID" runat="server" ErrorMessage="*" ControlToValidate="TxtAdminID" ForeColor="Red"></asp:RequiredFieldValidator>  
        </div>
        <asp:Textbox ID="TxtAdminID" cssClass="input" placeholder="Admin ID" runat="server"/><br />
        
        <div class="RequiredField" style="margin-top: 24px;">
            <asp:RequiredFieldValidator ID="Required_NIC" runat="server" ErrorMessage="*" ControlToValidate="TxtNIC_Admin" ForeColor="Red"></asp:RequiredFieldValidator>  
        </div>
        <asp:Textbox ID="TxtNIC_Admin" cssClass="input" placeholder="NIC/Passport" runat="server"/><br />
        
        <div class="RequiredField" style="margin-top: 24px;">
            <asp:RequiredFieldValidator ID="RequiredPassword" runat="server" ErrorMessage="*" ControlToValidate="TxtPassword_Admin" ForeColor="Red"></asp:RequiredFieldValidator>  
        </div>
        <asp:Textbox ID="TxtPassword_Admin" cssClass="input" placeholder="Password" TextMode="Password" runat="server"/><br />
        
        <div class="RequiredField" style="margin-top: 24px;">
            <asp:RequiredFieldValidator ID="RequiredRePassword" runat="server" ErrorMessage="*" ControlToValidate="TxtRePassword_Admin" ForeColor="Red"></asp:RequiredFieldValidator>  
        </div>
        <asp:Textbox ID="TxtRePassword_Admin" cssClass="input" placeholder="Re - Password" TextMode="Password" runat="server"/><br />
        
        <div>

        </div>

        <asp:Label ID="LblMsg" runat="server" cssClass="SuccessMsgAdmin" Text="Successfully Created" Visible="False"></asp:Label>
        <asp:Label ID="LblErrorMsg" runat="server" cssClass="errorMsg_Admin" Text="Admin ID already exist" Visible="False"></asp:Label>

        <asp:Button ID="BtnCreate" cssClass="button" Text="Create" Font-Size="11pt" runat="server" OnClick="BtnCreate_Click"/>
        
        <div >
            <p class="signUpLabel">Go back <a href="AdminHome.aspx">Home</a></p> 
        </div>

        
    </div>

    </form>
    <asp:SqlDataSource runat="server" ID="DataSourceAdmin" ConnectionString="<%$ ConnectionStrings:DBCS %>" InsertCommand="INSERT INTO admin(adminid, password, nic) VALUES (,,)" SelectCommand="SELECT admin.* FROM admin"></asp:SqlDataSource>
</body>
</html>
