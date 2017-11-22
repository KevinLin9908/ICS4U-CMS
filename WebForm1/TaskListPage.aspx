<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskListPage.aspx.cs" Inherits="WebForm1.TaskListPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvTaskList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                OnRowCancelingEdit="gvTaskList_RowCancelingEdit"
                OnRowDataBound="gvTaskList_RowDataBound" OnRowDeleting="gvTaskList_RowDeleting"
                OnRowEditing="gvTaskList_RowEditing" OnRowUpdating="gvTaskList_RowUpdating">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="TaskListID" HeaderText="TaskListID" ReadOnly="True"
                        SortExpression="TaskListID" />

                    <asp:TemplateField HeaderText="TaskListName" SortExpression="TaskListName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TaskListName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("TaskListName") %>'></asp:Label>
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


            <asp:LinkButton ID="lbtnAdd" runat="server" OnClick="lbtnAdd_Click">AddNew</asp:LinkButton>


            <asp:Panel ID="pnlAdd" runat="server" Visible="False">
                <%--Last name:--%>
                <%--<asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>--%> 
     
     
    TaskList name: 
    <asp:TextBox ID="tbTaskListName" runat="server"></asp:TextBox>


                <asp:LinkButton ID="lbtnSubmit" runat="server" OnClick="lbtnSubmit_Click">Submit</asp:LinkButton>

                <asp:LinkButton ID="lbtnCancel" runat="server" OnClick="lbtnCancel_Click">Cancel</asp:LinkButton>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
