<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HotelOnlinePayment.aspx.cs" Inherits="OFOS.HotelOnlinePayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

.card {
	width: 60rem;
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
	width: 35rem;
	border-bottom-right-radius: 1.5rem;
    border-top-right-radius: 1.5rem;
    padding: 1rem 2rem 3rem 3rem;
}

p{
    display:block;
    font-size: 1.1rem;
    font-weight: 400;
    margin: .8rem 0;
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
    padding-top: 0.6rem;
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
    
    <%--<div class="mainscreen">--%>
     <%--<img src="https://image.freepik.com/free-vector/purple-background-with-neon-frame_52683-34124.jpg"  class="bgimg " alt="">--%> 
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
            <h1>CheckOut</h1>
            <h2>Payment Information</h2>
              <asp:Label ID="Label1" runat="server" Text="" CssClass="p" ForeColor="red"></asp:Label>
            <p>Cardholder Name</p>
             <asp:TextBox ID="Name" runat="server"  class="inputbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*"
                    Display="Dynamic" ControlToValidate="Name" ForeColor="red" Font-Size="Medium"></asp:RequiredFieldValidator>
            <%--<input type="text" ID="Name" runat="server" class="inputbox" name="name" required />--%>
            <p>Card Number</p>
              <asp:TextBox ID="Acc_no" runat="server" class="inputbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*"
                    Display="Dynamic" ControlToValidate="Acc_no" ForeColor="red" Font-Size="Medium"></asp:RequiredFieldValidator>
            <%--<input type="number" class="inputbox" ID="Acc_no" runat="server" name="card_number"  required />--%>

            <p>Card Type</p>
            <select class="inputbox" name="card_type" id="card_type" required>
              <option value="">--Select a Card Type--</option>
              <option value="Visa">Visa</option>
              <option value="RuPay">RuPay</option>
              <option value="MasterCard">MasterCard</option>
            </select>
<div class="expcvv">

            <p class="expcvv_text">Expiry</p>
            <input type="date" class="inputbox" name="exp_date" id="exp_date" required />

            <p class="expcvv_text2">CVV</p>
             <asp:TextBox ID="Acc_pwd" runat="server" class="inputbox" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*"
                    Display="Dynamic" ControlToValidate="Acc_pwd" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
            <%--<input type="password" class="inputbox" name="cvv" id="cvv" required />--%>

        </div>
            <p></p>
              <asp:Button ID="Button1" runat="server" class="button" Text="Pay" OnClick="Button1_Click"/>
                <asp:Button ID="Button2" runat="server" class="button" Text="Continue with COD" OnClick="Button2_Click" CausesValidation="false" />
            <%--<button type="submit" class="button">CheckOut</button>--%>
          </form>
        </div>
      </div>
    <%--</div>--%>            
    <%--<div class="heading">
                <font size="5" color="#00ccff"><b><u>ONLINE TRANSACTION</u></b></font>
                </div>
           
        
            
                <h3 class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="" ForeColor="white"></asp:Label></h3>--%>
            
       
    <%--<table  align="center" style="color:white;" class="auto-style10">
        <tr>
            <td style="width:250px">NAME :</td><td>
                 <asp:TextBox ID="Name" runat="server" Width="228px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*"
                    Display="Dynamic" ControlToValidate="Name" ForeColor="red" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>ACCOUNT NO :</td><td><asp:TextBox ID="Acc_no" runat="server" Width="228px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*"
                    Display="Dynamic" ControlToValidate="Acc_no" ForeColor="red" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>ACCOUNT PASSWORD :</td><td><asp:TextBox ID="Acc_pwd" runat="server" Width="228px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*"
                    Display="Dynamic" ControlToValidate="Acc_pwd" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Button1" runat="server" Text="Pay" OnClick="Button1_Click"
                    CssClass="button button2" />
                <asp:Button ID="Button2" runat="server" Text="Continue with COD" OnClick="Button2_Click"
                    CssClass="button button2" CausesValidation="false" />
            </td>
        </tr>
    </table>--%>

</asp:Content>
