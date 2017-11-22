<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewProjectPage.aspx.cs" Inherits="WebForm1.NewProjectPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Create a New Project!"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Project Name: "></asp:Label>
            <asp:TextBox ID="ProjectNameTxtBox" runat="server" Width="193px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="SaveButton" runat="server" OnClick="SaveButton_Click" Text="Save" />
            <asp:Button ID="CancelButton" runat="server" OnClick="CancelButton_Click" Text="Cancel"/>
        </div>
    </form>
</body>
</html>
