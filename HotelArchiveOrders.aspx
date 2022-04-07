<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HotelArchiveOrders.aspx.cs" Inherits="OFOS.HotelArchiveOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table align="center" style="width: 100%;">
        <tr>
            <td><font size="5" color="#00ccff"><b><u>Track Orders</u></b></font></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gridorder"
                    CssClass="gridview1" HeaderStyle-CssClass="header" RowStyle-CssClass="row" runat="server"
                    AutoGenerateColumns="False" OnSelectedIndexChanged="gridorder_SelectedIndexChanged">
                    <Columns>
                          <asp:TemplateField>
                            <ItemTemplate>
                                 <img src="IMAGES/Hotel/<%# Eval("HotelID").ToString() %>.png" /><br />
                                 <%# Eval("HotelName").ToString() %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Order_ID" HeaderText="ORDER ID" ReadOnly="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true" />

                        <asp:BoundField DataField="Total_QTY" HeaderText="QUANTITY" ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="ToTAL_Amt" HeaderText="AMOUNT" ReadOnly="true" ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center" />
                        <%--<asp:BoundField DataField="ORD_Status" HeaderText="ORD_Status" ReadOnly="true" Visible="true" />--%>
                        <asp:BoundField DataField="Order_Date" HeaderText="Order_Date" ReadOnly="true" Visible="true" />

                        <asp:TemplateField HeaderText="ORDER Status">
                            <ItemTemplate>
                                <asp:Label ID="lbtype" runat="server" HeaderText="ORD_Status" Text='<%# GetOrderStatus(Convert.ToInt32(Eval("ORD_Status"))) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>

</asp:Content>
