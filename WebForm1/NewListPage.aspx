<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewListPage.aspx.cs" Inherits="WebForm1.NewListPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Create a New List!"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="List Name: "></asp:Label>
            <asp:TextBox ID="NewListNameTxtBox" runat="server" Width="193px"></asp:TextBox>
            <br />
            <br />
            Project :
            <asp:DropDownList ID="ProjectDropDownList" runat="server" DataSourceID="SqlDataSource" DataTextField="ProjectName" DataValueField="ProjectId">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WebFormConnectionString %>" SelectCommand="SELECT [ProjectId], [ProjectName] FROM [Project]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="SaveButton" runat="server" OnClick="SaveButton_Click" Text="Save" />
            <asp:Button ID="CancelButton" runat="server" OnClick="CancelButton_Click" Text="Cancel" />
        </div>
    </form>
</body>
</html>