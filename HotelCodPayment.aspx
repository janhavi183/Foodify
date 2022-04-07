<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HotelCodPayment.aspx.cs" Inherits="OFOS.HotelCodPayment" %>

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
.expcvv {
    display:flex;
    justify-content: space-between;
    padding-top: 0.6rem;
}
.expcvv_text{
    padding-right: 1rem;
}

.rightside {
    background-color: #ffffff;
	width: 60rem;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
	border-bottom-right-radius: 1.5rem;
    border-top-right-radius: 1.5rem;
    padding: 1rem 2rem 3rem 3rem;
}

p{
    display:block;
    font-size: 1.1rem;
    font-weight: 400;
    margin: 1.0rem 0;
    width:30rem;
}

.inputbox
{
    color:#030303;
	width: 100%;
    padding: 0.5rem;
    border: none;
    border-bottom: 1.5px solid #ccc;
    margin-bottom: 0.5rem;
    border-radius: 0.3rem;
    font-family: 'Roboto', sans-serif;
    color: #615a5a;
    font-size: 1rem;
    font-weight: 500;
  outline:none;
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
    margin-top: 2px;
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
          <div class="rightside">
          <form action="">
            <%--<h1>CheckOut</h1>--%>
            <h2>Delivery Address</h2>
              <asp:Label ID="Label1" runat="server" Text="" class="p" ></asp:Label>
            <p>NAME :</p>

             <asp:TextBox ID="Name" runat="server" class="inputbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name must be provided"
                    Display="Dynamic" ControlToValidate="Name" ForeColor="Red" Font-Size="Medium">
                </asp:RequiredFieldValidator>
            <%--<input type="text" ID="Name" runat="server" class="inputbox" name="name" required />--%>
            <div class="expcvv">
              <p>HOUSE NO :</p>

              <asp:TextBox ID="House_no" runat="server" class="inputbox" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="House no must be provided"
                    Display="Dynamic" ControlToValidate="House_no" ForeColor="Red" Font-Size="Medium">
                </asp:RequiredFieldValidator>
            <%--<input type="number" class="inputbox" ID="Acc_no" runat="server" name="card_number"  required />--%>
              <p>ADDRESS :</p>
            <asp:TextBox ID="Street" runat="server" class="inputbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please provide the street"
                    Display="Dynamic" ControlToValidate="Street" ForeColor="Red" Font-Size="Medium">
                </asp:RequiredFieldValidator>
           </div>
           <div class="expcvv">
            <p>CITY :</p>
            <asp:DropDownList ID="D_city" runat="server" style="margin-right: 20px"  class="inputbox" >
                    <asp:ListItem>Navi Mumbai</asp:ListItem>
                    <asp:ListItem>Mumbai</asp:ListItem>

                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter the city"
                    Display="Dynamic" ControlToValidate="D_city" ForeColor="Red" Font-Size="Medium">
                </asp:RequiredFieldValidator>
              <p>CONTACT NO :</p>
               <asp:TextBox ID="Contact" runat="server" class="inputbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter your contact number"
                    Display="Dynamic" ControlToValidate="Contact" ForeColor="Red" Font-Size="Medium">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="rev_contact" runat="server" ControlToValidate="Contact"
                    ValidationExpression="[0-9]{10}" ErrorMessage="Please enter upto 10 digits."
                    ForeColor="Red" Font-Size="Small" />
              </div>
            <p></p>
             <asp:Button ID="Button2" runat="server" Text="DELIVER" OnClick="Button2_Click" class="button" />
             </div>
            <%--<select class="inputbox" name="card_type" id="card_type" required>
              <option value="">--Select a Card Type--</option>
              <option value="Visa">Visa</option>
              <option value="RuPay">RuPay</option>
              <option value="MasterCard">MasterCard</option>
            </select<%-->--%>
<%--<div class="expcvv">

            <p class="expcvv_text">Expiry</p>
            <input type="date" class="inputbox" name="exp_date" id="exp_date" required />

            <p class="expcvv_text2">CVV</p>
             <asp:TextBox ID="Acc_pwd" runat="server" class="inputbox" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Text="*"
                    Display="Dynamic" ControlToValidate="Acc_pwd" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>--%>
            <%--<input type="password" class="inputbox" name="cvv" id="cvv" required />--%>

        <%--</div>
            <p></p>
              <asp:Button ID="Button1" runat="server" class="button" Text="Pay" OnClick="Button1_Click"/>
                <asp:Button ID="Button2" runat="server" class="button" Text="Continue with COD" OnClick="Button2_Click" CausesValidation="false" />  --%>          <%--<button type="submit" class="button">CheckOut</button>--%>
          </form>
        </div>
      <%--</div>--%>
             
    <%--<table align="center" style="width: 80%;color:white">
        <tr>
            <td colspan="2"><font size="5" color="#00ccff"><b><u>DELIVERY ADDRESS</u></b> </font></td>
        </tr>
        <tr>
            <td colspan="2">
                <h3><b>
                    <asp:Label ID="Label1" runat="server" Text="" ForeColor="White"></asp:Label>
                </b></h3>
            </td>
        </tr>
        <tr>
            <td style="width: 200px">NAME :</td>
            <td>
                <asp:TextBox ID="Name" runat="server" Width="240px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name must be provided"
                    Display="Dynamic" ControlToValidate="Name" ForeColor="Red" Font-Size="Medium">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>HOUSE NO :</td>
            <td>
                <asp:TextBox ID="House_no" runat="server" Width="240px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="House no must be provided"
                    Display="Dynamic" ControlToValidate="House_no" ForeColor="Red" Font-Size="Medium">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>STREET :</td>
            <td>
                <asp:TextBox ID="Street" runat="server" Width="240px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please provide the street"
                    Display="Dynamic" ControlToValidate="Street" ForeColor="Red" Font-Size="Medium">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>CITY :</td>
            <td>
                <asp:DropDownList ID="D_city" runat="server" style="margin-left: 0px"  BackColor="#595959">
                    <asp:ListItem>Navi Mumbai</asp:ListItem>
                    <asp:ListItem>Mumbai</asp:ListItem>

                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter the city"
                    Display="Dynamic" ControlToValidate="D_city" ForeColor="Red" Font-Size="Medium">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>CONTACT NO :</td>
            <td>
                <asp:TextBox ID="Contact" runat="server" Width="240px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter your contact number"
                    Display="Dynamic" ControlToValidate="Contact" ForeColor="Red" Font-Size="Medium">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="rev_contact" runat="server" ControlToValidate="Contact"
                    ValidationExpression="[0-9]{10}" ErrorMessage="Please enter upto 10 digits."
                    ForeColor="Red" Font-Size="Small" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Button2" runat="server" Text="DELIVER" OnClick="Button2_Click" CssClass="button button2" />
            </td>
        </tr>
    </table>--%>




</asp:Content>
