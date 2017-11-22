<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebTest.Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebFormConnectionString %>" SelectCommand="SELECT [ProjectName], [UserId] FROM [Project]"></asp:SqlDataSource>
    <div>
        Welcome
        <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" />
        <br />
        <br />
        <asp:Label ID="lblLastLoginDate" runat="server" />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
        <br />
        <br />
                   <asp:GridView ID="gvProject" runat="server" AutoGenerateColumns="False" CellPadding="4"  
    onpageindexchanging="gvProject_PageIndexChanging"  
    onrowcancelingedit="gvProject_RowCancelingEdit"  
    onrowdatabound="gvProject_RowDataBound" onrowdeleting="gvProject_RowDeleting"  
    onrowediting="gvProject_RowEditing" onrowupdating="gvProject_RowUpdating"  
    onsorting="gvProject_Sorting"> 
<RowStyle BackColor="#F7F6F3" ForeColor="#333333" /> 
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns> 
        <asp:CommandField ShowEditButton="True" /> 
        <asp:CommandField ShowDeleteButton="True" /> 
        <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" ReadOnly="True"  
            SortExpression="ProjectID" /> 
        
        <asp:TemplateField HeaderText="ProjectName" SortExpression="ProjectName"> 
            <EditItemTemplate> 
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ProjectName") %>'></asp:TextBox> 
            </EditItemTemplate> 
            <ItemTemplate> 
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProjectName") %>'></asp:Label> 
            </ItemTemplate> 
        </asp:TemplateField> 
    </Columns> 
                <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" /> 
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" /> 
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" /> 
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" /> 
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView> 
     
 
<asp:LinkButton ID="lbtnAdd" runat="server" onclick="lbtnAdd_Click">AddNew</asp:LinkButton> 
 
 
<asp:Panel ID="pnlAdd" runat="server" Visible="False"> 
    <%--Last name:--%> 
    <%--<asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>--%> 
     
     
    Project name: 
    <asp:TextBox ID="tbProjectName" runat="server"></asp:TextBox> 
     
     
    <asp:LinkButton ID="lbtnSubmit" runat="server" onclick="lbtnSubmit_Click">Submit</asp:LinkButton> 
        
    <asp:LinkButton ID="lbtnCancel" runat="server" onclick="lbtnCancel_Click">Cancel</asp:LinkButton> 
     
</asp:Panel> 
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Task list" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="ProjectId,TaskListId,TaskId" DataSourceID="SqlDataSourceAll">
            <Columns>
                <%--<asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />--%>
                <%--<asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" />--%>
                <asp:CheckBoxField DataField="Progress" HeaderText="Progress" SortExpression="Progress" />
                <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" SortExpression="ProjectName" />
                <asp:BoundField DataField="TaskListName" HeaderText="TaskListName" SortExpression="TaskListName" />
                <asp:BoundField DataField="TaskName" HeaderText="TaskName" SortExpression="TaskName" />
                <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
                <asp:BoundField DataField="PriorityName" HeaderText="PriorityName" SortExpression="PriorityName" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceAll" runat="server" ConnectionString="<%$ ConnectionStrings:WebFormConnectionString %>" SelectCommand="SELECT * FROM [View_1]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceTaskList" runat="server" ConnectionString="<%$ ConnectionStrings:WebFormConnectionString %>" SelectCommand="SELECT [TaskListName], [ProjectId] FROM [TaskList]"></asp:SqlDataSource>
        <br />
    </div>
        <p>
            <asp:Button ID="NewProjectButton" runat="server" OnClick="NewProjectButton_Click" Text="New Project" />
        </p>
        <asp:Button ID="NewListButton" runat="server" OnClick="NewListButton_Click" Text="New List" />
        <br />
        <br />
        <asp:Button ID="NewTaskButton" runat="server" OnClick="NewTaskButton_Click" Text="New Task" />
    </form>
</body>
</html>
