<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminManageOrders.aspx.cs" Inherits="OFOS.AdminManageOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         .button2 {
    background-color: #00b712;
    background-image: linear-gradient(315deg, #00b712 0%, #5aff15 74%);
    /* background: linear-gradient( 135deg, #753370 0%, #298096 100%);*/
    padding: 10px;
    border: none;
    border-radius: 10px;
    color: black;
    font-weight: 600;
    font-size: 1.4rem;
    margin-top: 2px;
    width: 220px;
    letter-spacing: .11rem;
    outline: none;
    /*background-color: #3DFF33;
	border-radius: 4px;*/
}
          .button4 {
    background-color: #ff0000;
    background-image: linear-gradient(315deg, #ff0000 0%, #ff6a00 74%);
    /* background: linear-gradient( 135deg, #753370 0%, #298096 100%);*/
    padding: 10px;
    border: none;
    border-radius: 10px;
    color: black;
    font-weight: 600;
    font-size: 1.4rem;
    margin-top: 2px;
    width: 220px;
    letter-spacing: .11rem;
    outline: none;
    /*background-color: #3DFF33;
	border-radius: 4px;*/
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" style="width: 100%;">
        <tr>
            <td><font size="5" color="#00ccff"><b><u>Manage Orders</u></b></font></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gridorder"
                    CssClass="gridview1" HeaderStyle-CssClass="header" runat="server"
                    AutoGenerateColumns="False" AllowPaging="true" PageSize="20" OnPageIndexChanging="SubmitAppraisalGrid_PageIndexChanging">
                    <Columns>
                                         <asp:TemplateField>
                            <ItemTemplate >
                                 <img src="IMAGES/Hotel/<%# Eval("HotelID").ToString() %>.png" style="width:200px; height:200px;" /><br />
                                 <%# Eval("HotelName").ToString() %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Order_ID" HeaderText="ORDER ID" ReadOnly="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true" />

                        <asp:BoundField DataField="Total_QTY" HeaderText="QUANTITY" ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="ToTAL_Amt" HeaderText="AMOUNT" ReadOnly="true" ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center" />
                       
                        <asp:BoundField DataField="Order_Date" HeaderText="Order_Date" ReadOnly="true" Visible="true" />

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lbtype" runat="server" Text='<%# GetOrderStatus(Convert.ToInt32(Eval("ORD_Status"))) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Work flow">
                            <ItemTemplate>
                                <asp:Button runat="server"
                                    CommandArgument='<%# Convert.ToString(Eval("ORD_Status")) +"$" + Convert.ToString(Eval("Order_ID")) %>'
                                    CommandName="ThisBtnClick"
                                    OnClick="Unnamed_Click" CssClass="button2"
                                    Text="Move to Next Step" Visible='<%# GetVisibleStatus(Convert.ToInt32(Eval("ORD_Status"))) %>' />

                                 <asp:Button runat="server"
                                    CommandArgument='<%# Convert.ToString(Eval("ORD_Status")) +"$" + Convert.ToString(Eval("Order_ID")) %>'
                                    CommandName="ThisBtnClick"
                                    OnClick="Cancel_Click" CssClass="button4"
                                    Text="Cancel Order" Visible='<%# GetVisibleStatus(Convert.ToInt32(Eval("ORD_Status"))) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                         
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
