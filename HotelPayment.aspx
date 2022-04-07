<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HotelPayment.aspx.cs" Inherits="OFOS.HotelPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" style="width: 80%">
        <tr>
            <td><font size="5" color="#00ccff"><b><u>PAYMENT&nbsp; DETAILS</u></b></font></td>
        </tr>

        <tr>
            <td>
                <h2><font color="#00ccff">Final Order List</font></h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gridorder" DataSourceID="sql1" DataKeyNames="Item_no,Order_Id"
                    CssClass="gridview1" HeaderStyle-CssClass="header" RowStyle-CssClass="row" runat="server"
                    AutoGenerateColumns="False" HeaderStyle-Font-Bold="true">
                    <columns>
                        <asp:BoundField DataField="Item_name" HeaderText="ITEM NAME" ReadOnly="true" ItemStyle-Font-Bold="true" />
                        <asp:BoundField DataField="Price" HeaderText="PRICE" ReadOnly="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true" />
                        <asp:BoundField DataField="Quantity" HeaderText="QUANTITY" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true" />
                        <asp:BoundField DataField="Amount" HeaderText="AMOUNT" ReadOnly="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true" />
                        <asp:BoundField DataField="Order_Id" HeaderText="Order_Id" ReadOnly="true" Visible="false" />
                        <asp:BoundField DataField="Item_no" HeaderText="Item_no" ReadOnly="true" Visible="false" />

                    </columns>
                </asp:GridView>

                <asp:SqlDataSource ID="sql1" runat="server"
                    ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Aayushi.Mehta\Source\Repos\OnlineFoodOrderingSystem_C4\OFOS\OFOS\App_Data\ofos.mdf;Integrated Security=True"
                    SelectCommand="SELECT im.Item_name,od.Price,od.Quantity,od.Amount,od.Order_Id,od.Item_no
                            FROM [dbo].[Order_Details] od INNER JOIN [dbo].[Item_Master] im 
                             ON od.Item_no=im.Item_no WHERE od.Order_Id=@Order_Id">
                    <selectparameters>
                        <asp:SessionParameter Name="Order_Id" SessionField="order_id" />
                    </selectparameters>

                </asp:SqlDataSource>
            </td>
        </tr>
        <h2>
        <tr>
            <td><font color="#00ccff" size="5">Total Amount:</font><asp:Label ID="Label2" runat="server" Text="Label" ForeColor="White"></asp:Label></td>
        </tr>
        </h2>
        <h2>
        <tr>
            <td><font color="#00ccff" size="4">PAY  BY:</font></td>
        </tr>
        </h2>
        <tr>
            <td>

                <asp:Button ID="Button1" runat="server" Text="Online Transaction" OnClick="Button1_Click"
                    CssClass="button button2" />
                <asp:Button ID="Button2" runat="server" Text="Cash On Delivery" Width="248px"
                    OnClick="Button2_Click" CssClass="button button2" />
            </td>
        </tr>
    </table>
    <center>
</asp:Content>
