<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="WebForm1.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
        </div>
    </form>
</body>
</html>
