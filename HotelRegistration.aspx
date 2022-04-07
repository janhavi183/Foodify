<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HotelRegistration.aspx.cs" Inherits="OFOS.HotelRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
    .card {
	width: 70rem;
    margin: auto;
    background: white;
    position:center;
    align-self: center;
    top: 50rem;
    border-radius: 1.5rem;
    box-shadow: 4px 3px 20px #3535358c;
    display:flex;
    flex-direction: row;
    
}

.leftside {
	background: #030303;
	width: 20rem;
	display: inline-flex;
    align-items: center;
    justify-content: center;
	border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}

.product {
    object-fit: cover;
	width: 20em;
    height: 45em;
    border-radius: 2%;
}

.rightside {
    background-color: #ffffff;
	width: 50rem;
	border-bottom-right-radius: 1.5rem;
    border-top-right-radius: 1.5rem;
    padding: 1rem 2rem 3rem 3rem;
}

p{
    display:block;
    font-size: 1.1rem;
    font-weight: 400;
    margin: .8rem 0;
    width:30rem;
}

.inputbox
{
    color:#030303;
	width: 100%;
    padding: 0.5rem;
    border: none;
    border-bottom: 1.5px solid #ccc;
    margin-bottom: 1rem;
    border-radius: 0.3rem;
    font-family: 'Roboto', sans-serif;
    color: #615a5a;
    font-size: 1.1rem;
    font-weight: 500;
  outline:none;
}

.expcvv {
    display:flex;
    justify-content: space-between;
    padding-top: 0.2rem;
}

.expcvv_text{
    padding-right: 1rem;
}
.expcvv_text2{
    padding:0 1rem;
}

.button{
    background: linear-gradient(
135deg
, #753370 0%, #298096 100%);
    padding: 15px;
    border: none;
    border-radius: 50px;
    color: white;
    font-weight: 400;
    font-size: 1.2rem;
    margin-top: 10px;
    width:100%;
    letter-spacing: .11rem;
    outline:none;
}

.button:hover
{
	transform: scale(1.05) translateY(-3px);
    box-shadow: 3px 3px 6px #38373785;
}

@media only screen and (max-width: 1000px) {
    .card{
        flex-direction: column;
        width: auto;
      
    }

    .leftside{
        width: 100%;
        border-top-right-radius: 0;
        border-bottom-left-radius: 0;
      border-top-right-radius:0;
      border-radius:0;
    }

    .rightside{
        width:auto;
        border-bottom-left-radius: 1.5rem;
        padding:0.5rem 3rem 3rem 2rem;
       border-radius:0;
    }
}
    
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <div class="card">
        <div class="leftside">
          <img
            src="PIC/card.jpg"
            class="product"
            alt="Food"
          />
        </div>
        <div class="rightside">
          <form action="">
            <h1>Registration</h1>
            <%--<h2>Payment Information</h2>--%>
              <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Green"></asp:Label>
              <%--<asp:Label ID="Label10" runat="server" Text="" CssClass="p" ForeColor="white"></asp:Label>--%>
            <p>USERNAME :</p>
             <asp:TextBox ID="tb_username" runat="server" class="inputbox"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfv_username" runat="server" ErrorMessage="Username must be provided."
                Display="Dynamic" ControlToValidate="tb_username" ForeColor="Red" Font-Size="Small" />
              <p>NAME:</p>
             <asp:TextBox ID="tb_name" runat="server" class="inputbox"></asp:TextBox>
              <div class="expcvv">
              <p>PASSWORD:</p>
             <asp:TextBox ID="tb_pwd" TextMode="Password" runat="server" class="inputbox"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfv_pwd" runat="server" ErrorMessage="You must enter a password."
                                        Display="Dynamic" ControlToValidate="tb_pwd" ForeColor="Red" Font-Size="Small" />
              
              
              <p>RE-ENTER PASSWORD:</p>
             <asp:TextBox ID="tb_repwd" TextMode="Password" runat="server" class="inputbox"></asp:TextBox>
              <asp:CompareValidator ID="cv_repwd" runat="server" ErrorMessage="Your password does not match."
                                        ControlToCompare="tb_pwd" ControlToValidate="tb_repwd" ForeColor="Red" Font-Size="Small" />
              </div>
              <div class="expcvv">
              <p>EMAIL ID:</p>
             <asp:TextBox ID="tb_email" runat="server" class="inputbox"></asp:TextBox>
              <asp:RegularExpressionValidator ID="rev_email" runat="server" ErrorMessage="This email is not in the correct format."
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tb_email"
                                        ForeColor="Red" Font-Size="Small" />
              <p>CONTACT NO:</p>
             <asp:TextBox ID="tb_contact" runat="server" class="inputbox"></asp:TextBox>
              <asp:RegularExpressionValidator ID="rev_contact" runat="server" ControlToValidate="tb_contact"
                                        ValidationExpression="[0-9]{10}" ErrorMessage="Please enter upto 10 digits."
                                        ForeColor="Red" Font-Size="Small" />
              </div>
              <div class="expcvv">
              <p>FLAT NO:</p>
             <asp:TextBox ID="tb_house" runat="server" class="inputbox"></asp:TextBox>
              <p>ADDRESS:</p>
             <asp:TextBox ID="tb_street" runat="server" class="inputbox"></asp:TextBox>
             </div>
              <p>CITY:</p>
              <asp:DropDownList ID="DropDownList1_city" runat="server" class="inputbox">
               <asp:ListItem>Mumbai</asp:ListItem>
               <asp:ListItem>Navi Mumbai</asp:ListItem>
               </asp:DropDownList>
              <asp:Button ID="Button1_register" runat="server" Text="Register Me" OnClick="Button1_register_Click" class="button"/>

           
         
              
            <%--<button type="submit" class="button">CheckOut</button>--%>
          </form>
        </div>
</div>
    
        <%--<div class="auto-style6">
            <img src="../PIC/logo3.jpg" alt="alternate text" class="auto-style5" />
            <h2>Registration </h2>

                   <h3>
                        <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Green"></asp:Label>
                    </h3>
                        <table  style="padding:40px;" align="center" class="auto-style10" >
                            <tr>
                                <td style="text-align:right" >
                                    <asp:Label ID="Label1" runat="server" Text="Username : " class="lblusername"></asp:Label></td>
                                <td style="text-align: left" class="auto-style11">
                                    <asp:TextBox ID="tb_username" runat="server" Width="228px"></asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td >
                                    <asp:RequiredFieldValidator ID="rfv_username" runat="server" ErrorMessage="Username must be provided."
                                        Display="Dynamic" ControlToValidate="tb_username" ForeColor="Red" Font-Size="Small" />
                                </td>
                            </tr>

                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label2" runat="server" Text="Name : " class="lblusername"></asp:Label></td>
                                <td style="text-align: left" class="auto-style11">
                                    <asp:TextBox ID="tb_name" runat="server" Width="228px"></asp:TextBox></td>

                            </tr>
                             <tr>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="text-align: right" >
                                    <asp:Label ID="Label3" runat="server" Text="Password : " class="lblusername"></asp:Label></td>
                                <td style="text-align: left" class="auto-style11">
                                    <asp:TextBox ID="tb_pwd" runat="server" TextMode="Password" Width="228px"></asp:TextBox></td>
                               
                            </tr>
                            <tr>
                                <td></td>
                                 <td >
                                    <asp:RequiredFieldValidator ID="rfv_pwd" runat="server" ErrorMessage="You must enter a password."
                                        Display="Dynamic" ControlToValidate="tb_pwd" ForeColor="Red" Font-Size="Small" />
                                </td>
                            </tr>

                            <tr>
                                <td style="text-align: right" >
                                    <asp:Label ID="Label4" runat="server" Text="Reenter Password : " class="lblusername"></asp:Label></td>
                                <td style="text-align: left" class="auto-style11" >
                                    <asp:TextBox ID="tb_repwd" runat="server" TextMode="Password" Width="228px"></asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:CompareValidator ID="cv_repwd" runat="server" ErrorMessage="Your password does not match."
                                        ControlToCompare="tb_pwd" ControlToValidate="tb_repwd" ForeColor="Red" Font-Size="Small" /></td>
                            </tr>

                            <tr>
                                <td style="text-align:right" >
                                    <asp:Label ID="Label5" runat="server" Text="Email ID : " class="lblusername"></asp:Label></td>
                                <td style="text-align: left" class="auto-style11" >
                                    <asp:TextBox ID="tb_email" runat="server" Width="228px"></asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:RegularExpressionValidator ID="rev_email" runat="server" ErrorMessage="This email is not in the correct format."
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tb_email"
                                        ForeColor="Red" Font-Size="Small" />
                                </td>
                            </tr>

                            <tr>
                                <td style="text-align: right" >
                                    <asp:Label ID="Label6" runat="server" Text="Contact No. : " class="lblusername"></asp:Label></td>
                                <td style="text-align: left" class="auto-style11" >
                                    <asp:TextBox ID="tb_contact" runat="server" Width="228px"></asp:TextBox></td>
                               
                            </tr>
                            <tr>
                                <td></td>
                                 <td >
                                    <asp:RegularExpressionValidator ID="rev_contact" runat="server" ControlToValidate="tb_contact"
                                        ValidationExpression="[0-9]{10}" ErrorMessage="Please enter upto 10 digits."
                                        ForeColor="Red" Font-Size="Small" />

                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" >
                                    <asp:Label ID="Label7" runat="server" Text="Flat No. : "  class="lblusername"></asp:Label></td>
                                <td style="text-align: left" class="auto-style11" >
                                    <asp:TextBox ID="tb_house" runat="server" Width="228px"></asp:TextBox></td>
                               
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" >
                                    <asp:Label ID="Label8" runat="server" Text="Address:" class="lblusername"></asp:Label></td>
                                <td style="text-align: left" class="auto-style11" >
                                    <asp:TextBox ID="tb_street" runat="server" Width="228px"></asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" >
                                    <asp:Label ID="Label9" runat="server" Text="City:" class="lblusername"></asp:Label></td>
                                <td style="text-align: left" class="auto-style11" >
                                    <asp:DropDownList ID="DropDownList1_city" runat="server" Style="margin-left: 0px" Width="228px">
                                        <asp:ListItem>Mumbai</asp:ListItem>
                                        <asp:ListItem>Navi Mumbai</asp:ListItem>

                                    </asp:DropDownList></td>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td  colspan="2">
                                    <asp:Button ID="Button1_register" runat="server" Text="Register Me" OnClick="Button1_register_Click" CssClass="b1" style="font-family: Century; color:#000099; font-size: medium; background-color:#FFD700; margin-right: 104px; align-items:center; font-style: italic; margin-left: 40px; font-weight: bold; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" Width="40%" Height="35px"/>
                                </td>
                            </tr>
                        </table>

                    </div>--%>
         </body>

                
</asp:Content>
