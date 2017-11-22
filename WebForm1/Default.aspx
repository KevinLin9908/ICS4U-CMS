<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebTest.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Learning</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="TitleLabel" runat="server" Text="Reminder System" Font-Underline="True" Font-Size="XX-Large" Font-Bold="True" Font-Italic="True"></asp:Label>
            <br />
            <br />
            <br />            
            <%--<asp:Label ID="UserLabel" runat="server" Text="UserName (Email Address):"></asp:Label> <asp:TextBox ID="UserTextBox" runat="server"></asp:TextBox><br />
            <asp:Label ID="PasswordLabel" runat="server" Text="Password:"></asp:Label><asp:TextBox ID="PasswordTextBox" runat="server"></asp:TextBox> <br />
           --%> 
            <asp:Button ID="SignInButton" runat="server" Text="Sign In" OnClick="SignInButton_Click" /><asp:Button ID="SignUpButton" runat="server" Text="Sign Up" OnClick="SignUpButton_Click" />
            <br />
            <br />
            <br />            

        </div>
    </form>
</body>
</html>
