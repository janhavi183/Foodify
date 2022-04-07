<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAddMenu.aspx.cs" Inherits="OFOS.AdminAddMenu" %>
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
      <div>
              <center><h1> ADD ITEM </h1></center>
          </div>
    
        <p>
            &nbsp;</p>
        <p style="margin-left: 30px">
            <h5><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h5>
        </p>
        <p>
            &nbsp;</p>
        <p style="margin-left: 40px; width: 900px;">
            <b>ITEM NO :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Width="500px" CssClass=" form-control-static"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Item_Id required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
        </p>
        <p style="margin-left: 40px; width: 900px;">
            <b>ITEM NAME :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Width="500px" CssClass="form-control-static"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Item Name required" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
        
        </p>
        <p style="margin-left: 40px; width: 900px;">
            <b>TYPE :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="dropdown_type" runat="server" Width="500px" CssClass=" form-control-static">
                <asp:ListItem>SOUPS</asp:ListItem>
                <asp:ListItem>STARTERS</asp:ListItem>
                <asp:ListItem>RICE</asp:ListItem>
                <asp:ListItem>NOODLES</asp:ListItem>
                <asp:ListItem>MAIN COURSE</asp:ListItem>
                <asp:ListItem>DESSERTS</asp:ListItem>
            </asp:DropDownList>

        </p>
        <p style="margin-left: 40px; width: 900px;">
            <b>PRICE :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="TextBox4" runat="server" Width="500px" CssClass="form-control-static"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Item Price required" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
        
        </p>
        <p style="margin-left: 40px; width: 900px;">
            <b>DESCRIPTION :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" Width="500px" CssClass="form-control-static"></asp:TextBox>
        </p>
        <p style="margin-left: 40px; width: 900px;">
            <b>IMAGE URL :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox6" runat="server" Width="500px" CssClass="form-control-static"></asp:TextBox>
        </p>
        <p style="margin-left: 40px">
            &nbsp;</p>
        <p style="margin-left: 400px">
            <asp:Button ID="Button1" runat="server" CssClass="button2" Height="32px" OnClick="Button1_Click" Text="ADD " Width="100px"  />
         </p>
</asp:Content>
