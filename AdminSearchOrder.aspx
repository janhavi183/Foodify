<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminSearchOrder.aspx.cs" Inherits="OFOS.AdminSearchOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="calendar" runat="server" cellspacing="5" cellpadding="5">
        <center>
            <h1>SEARCH FOR PLACED ORDERS</h1>
        </center>
        <table>
            <tr>

                <td style="vertical-align: top;">
                    <asp:Label ID="lbl_city" runat="server" Text="CITY:" Font-Bold="true" Font-Size="Medium" Font-Names="Georgia" />
                    <asp:DropDownList ID="dropdown_city" runat="server">
                        <asp:ListItem>Mumbai</asp:ListItem>
                        <asp:ListItem>Navi Mumbai</asp:ListItem>

                    </asp:DropDownList></td>
                <td style="vertical-align: top;">
                    <asp:Label ID="lbl_user" runat="server" Text="USER:" Font-Bold="true" Font-Size="Medium" Font-Names="Georgia" />
                    <asp:RadioButton ID="rdBtn_regi" runat="server" GroupName="grp" Text="Registered User" Font-Size="Small" Font-Names="Georgia" Checked="true"></asp:RadioButton>
                    <span style="display: none;">
                        <asp:RadioButton ID="rdBtn_gst" runat="server" GroupName="grp" Text="Guest" Font-Size="Small" Font-Names="Georgia"></asp:RadioButton>
                    </span>
                </td>
                <td style="vertical-align: top;">
                    <asp:Label ID="lbl_dt" runat="server" Text="DATE:" Font-Bold="true" Font-Size="Medium" Font-Names="Georgia" />
                    <asp:Label ID="label" runat="server" Text="Select the date for which you want to check placed orders:"></asp:Label>
                    <br />
                    <asp:Calendar ID="clndr" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                        <DayStyle Width="14%" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                        <TodayDayStyle BackColor="#CCCC99" />
                    </asp:Calendar>
                </td>
                <td style="vertical-align:top;">
                    <asp:Button ID="btn_s" runat="server" Text="Search" OnClick="btns_Click" CssClass="btn"></asp:Button>
                </td>
            </tr>
        </table>



        <br />

        <br />


        <asp:Label ID="status" runat="server" Text="" Visible="false"></asp:Label>
        <br />

    </div>
    <div id="details" runat="server" visible="false">
        <br />
        <br />
        <asp:GridView ID="gridview2" runat="server" AutoGenerateColumns="true"
            HeaderStyle-ForeColor="#3DFF33" CellSpacing="10" CellPadding="12"
            PagerStyle-CssClass="gridViewPager" PagerStyle-HorizontalAlign="Center" Width="270px" />
        <br />
        <br />

        <b>Order Details</b>
        <br />

        <asp:GridView ID="gridview1" runat="server" AutoGenerateColumns="true"
            HeaderStyle-ForeColor="#3DFF33" CellSpacing="10" CellPadding="12"
            PagerStyle-CssClass="gridViewPager" PagerStyle-HorizontalAlign="Center" Width="270px">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="button" runat="server" Text="Veiw Details" OnClick="gridview1_Click" BorderWidth="0" align="center" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle ForeColor="#3DFF33" />
            <PagerStyle CssClass="gridViewPager" HorizontalAlign="Center" />
        </asp:GridView>
        <br />

        <asp:Label ID="Sts" runat="server" Text="" Visible="false"></asp:Label>

    </div>
</asp:Content>
