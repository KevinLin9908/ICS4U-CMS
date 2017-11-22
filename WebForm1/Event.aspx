<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="EventApp.Event" %>  
    <!DOCTYPE html>  
    <html xmlns="http://www.w3.org/1999/xhtml">  
  
    <head runat="server">  
        <title></title>  
    </head>  
  
    <body>  
        <form id="form1" runat="server">  
            <div>  
                <h1 style="text-align: center;">  
Enter details and set a day to initiate an event.  
  
</h1> </div>  
            <div style="text-align: center;">  
                <table style="text-align: left; margin:auto; border-color: #000000;  
  
border-width: 2px; background-color: #fff99e;" cellspacing="0" cellpadding="8" rules="none" width="540">  
                    <tr>  
                        <td valign="top">Your Name:</td>  
                        <td valign="top">  
                            <asp:TextBox ID="nameBox" Runat="server" Width="160px" />  
                            <asp:RequiredFieldValidator ID="validateName" 
Runat="server" ErrorMessage="You must enter a name." 
ControlToValidate="nameBox" Display="None" /> </td>  
                        <td valign="middle" rowspan="4">  
                            <asp:Calendar ID="calendar" Runat="server" BackColor="White" /> </td>  
                    </tr>  
                    <tr>  
                        <td valign="top"> Event Name:</td>  
                        <td valign="top">  
                            <asp:TextBox ID="eventBox" Runat="server" Width="160px" />  
                            <asp:RequiredFieldValidator ID="validateEvent" Runat="server" 
ErrorMessage="You must enter an event name." ControlToValidate="eventBox" Display="None" /> </td>  
                    </tr>  
                    <tr>  
                        <td valign="top"> Meeting Room:</td>  
                        <td valign="top">  
                            <asp:DropDownList ID="roomList" Runat="server" Width="160px">  
                                <asp:ListItem Value="1">The Happy Room</asp:ListItem>  
                                <asp:ListItem Value="2">The Angry Room</asp:ListItem>  
                                <asp:ListItem Value="3">The Depressing Room</asp:ListItem>  
                                <asp:ListItem Value="4">The Funked Out Room</asp:ListItem>  
                            </asp:DropDownList>  
                            <asp:RequiredFieldValidator ID="validateRoom" Runat="server" 
ErrorMessage="You must select a room." ControlToValidate="roomList" Display="None" /> </td>  
                    </tr>  
                    <tr>  
                        <td valign="top"> Attendees:</td>  
                        <td valign="top">  
                            <asp:ListBox ID="attendeeList" Runat="server" Width="160px" SelectionMode="Multiple" Rows="6">  
                                <asp:ListItem Value="1">Kevin</asp:ListItem>  
                                <asp:ListItem Value="2">Andy</asp:ListItem>  
                                <asp:ListItem Value="3">Eddy</asp:ListItem>  
                                <asp:ListItem Value="4">Andrew</asp:ListItem>  
                                <asp:ListItem Value="5">Simon</asp:ListItem>  
                                <asp:ListItem Value="6">Michel</asp:ListItem>  
                            </asp:ListBox>  
                            <asp:RequiredFieldValidator ID="validateAttendees" Runat="server" 
ErrorMessage="You must have at least one attendee." ControlToValidate="attendeeList" Display="None" /> </td>  
                    </tr>  
                    <tr>  
                        <td align="center" colspan="3">  
                            <asp:Button ID="submitButton" Runat="server" Width="100%" 
Text="Submit meeting room request" onclick="submitButton_Click" /> </td>  
                    </tr>  
                    <tr>  
                        <td align="center" colspan="3">  
                            <asp:ValidationSummary ID="validationSummary" Runat="server" 
HeaderText="Before submitting your request:" /> </td>  
                    </tr>  
                </table>  
            </div>  
            <table>  
                <tr>  
                    <td height="50"></td>  
                </tr>  
            </table>  
            <table style="text-align: left; margin:auto; border-color: #000000;  
  
border-width: 2px; background-color:lightgoldenrodyellow;" cellspacing="0" cellpadding="8" rules="none" width="540">  
                <tr>  
                    <td>  
                        <p style="text-align:center;"> Results:  
                            <asp:Label Runat="server" ID="resultLabel" Text="None." /> </p>  
                    </td>  
                </tr>  
            </table>  
        </form>  
    </body>  
  
    </html>  