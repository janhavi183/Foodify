<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminModifyMenu.aspx.cs" Inherits="OFOS.AdminModifyMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div>
        <br />
        <center><h1>MODIFY EXISTING ITEM(S)</h1></center>

    
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <asp:GridView ID="GridView1" runat="server" CssClass="table"  AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" DataKeyNames="Item_no" AllowPaging="true" PageSize="9" 
            HeaderStyle-ForeColor="#3DFF33" CellSpacing="10" CellPadding="12" 
             PagerStyle-CssClass="gridViewPager" PagerStyle-HorizontalAlign="Center" >
            <Columns>
                <asp:BoundField DataField="Item_no" HeaderText="ITEM NO" ReadOnly="True" SortExpression="Item_no" />
                <asp:BoundField DataField="Item_name" HeaderText="ITEM NAME" SortExpression="Item_name" />
                <asp:BoundField DataField="Price" HeaderText="PRICE" SortExpression="Price" />
                <asp:BoundField DataField="Type" HeaderText="TYPE" SortExpression="Type" />
                <asp:BoundField DataField="Description" HeaderText="DESCRIPTION" SortExpression="Description" />
                <asp:BoundField DataField="Image_url" HeaderText="IMAGE URL"  SortExpression="Image_url"/>
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
            </Columns>

        </asp:GridView>  
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="Data Source=DESKTOP-30FC912\SQLEXPRESS;Initial Catalog=OFOS;Integrated Security=True" 
            SelectCommand="SELECT * FROM [Item_Master]" 
            UpdateCommand="UPDATE [Item_Master] SET Item_name=@Item_name, Price=@Price, 
            Description=@Description, Image_url=@Image_url, Type=@Type WHERE Item_no=@Item_no" 
            DeleteCommand="DELETE FROM [Item_Master] WHERE Item_no=@Item_no">

        </asp:SqlDataSource>
    </div>
</asp:Content>
