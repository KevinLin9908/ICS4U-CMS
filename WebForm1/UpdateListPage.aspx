<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateListPage.aspx.cs" Inherits="WebForm1.UpdateListPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Update TaskList
            <br />
            <br />
            TaskListName:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Project:&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ProjectName" DataValueField="ProjectName">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebFormConnectionString %>" SelectCommand="SELECT [ProjectName] FROM [Project]"></asp:SqlDataSource>
            <br />
            <asp:Button ID="ButtonSave" runat="server" Text="Save" />
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" />
        </div>
    </form>
</body>
</html>
