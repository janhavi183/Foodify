<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUpdateMenu.aspx.cs" Inherits="OFOS.AdminUpdateMenu" %>
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
    font-size: 1.2rem;
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
      
      
       
       
              <center><h1>UPDATE MENU</h1></center>

    
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
     
    <br />
    
        <p style="margin-left: 100px">

            <asp:Button ID="Button1" runat="server" CssClass="button2 " Height="31px" Text="ADD ITEM(S)" Width="253px" OnClick="Button1_Click" />
        </p>
                    <br />
        <p style="margin-left: 100px">

            <asp:Button ID="Button2" runat="server" CssClass="button2"  Height="31px" Text="MODIFY EXISTING ITEMS" Width="252px" OnClick="Button2_Click" />
        </p>
    
</asp:Content>
