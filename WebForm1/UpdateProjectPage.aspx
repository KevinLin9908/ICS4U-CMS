<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProjectPage.aspx.cs" Inherits="WebForm1.UpdateProjectPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Update Project<br />
            <br />
            Project Name:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="ButtonSave" runat="server" Text="Save" />
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" />
        </div>
    </form>
</body>
</html>
