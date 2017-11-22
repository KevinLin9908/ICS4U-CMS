<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewTaskPage.aspx.cs" Inherits="WebForm1.NewTaskPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Create a New Task!"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Task Name: "></asp:Label>
            <asp:TextBox ID="NewTaskNameTxtBox" runat="server" Width="193px"></asp:TextBox>
            <br />
            <br />
            TaskList:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceTaskList" DataTextField="TaskListName" DataValueField="TaskListName">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceTaskList" runat="server" ConnectionString="<%$ ConnectionStrings:WebFormConnectionString %>" SelectCommand="SELECT [TaskListName] FROM [TaskList]"></asp:SqlDataSource>
            <br />
            <br />
            Task Priority:
            <asp:DropDownList ID="PriorityDropDownList" runat="server">
                <asp:ListItem>High</asp:ListItem>
                <asp:ListItem>Medium</asp:ListItem>
                <asp:ListItem Selected="True">Low</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Date: "></asp:Label>
            <asp:TextBox ID="DateTextBox" runat="server"></asp:TextBox>
            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
            <br />
            <br />
            <br />
            <asp:Button ID="SaveButton" runat="server" OnClick="SaveButton_Click" Text="Save" />
            <asp:Button ID="CancelButton" runat="server" OnClick="CancelButton_Click" Text="Cancel" />
        </div>
    </form>
</body>
</html>