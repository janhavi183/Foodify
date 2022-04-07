<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HotelLogin.aspx.cs" Inherits="OFOS.HotelLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .card {
	width: 30rem;
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

.rightside {
    background-color: #ffffff;
	width: 30rem;
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
    <%--<link href="style.css" rel="stylesheet" type="text/css" />--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <div class="card">
          <div class="rightside">
          <form action="">
            <%--<h1>CheckOut</h1>--%>
            <h2 style="text-align: center">Login</h2>
              <asp:Label ID="status0" runat="server" class="p" />
               <asp:Label ID="status" runat="server" class="p"/>
              <%--<asp:Label ID="Label1" runat="server" Text="" class="p" ></asp:Label>--%>
            <p>USERNAME :</p>
              <asp:TextBox ID="tb_user" runat="server" Placeholder="USERNAME" class="inputbox" />
            <p>PASSWORD :</p>
             <asp:TextBox ID="tb_pwd" runat="server" TextMode="Password" Placeholder="PASSWORD" class="inputbox"  />
            <asp:Button ID="button_login" runat="server" Text="Login" OnClick="Login_Click" class="button"></asp:Button>
            <%--<input type="text" ID="Name" runat="server" class="inputbox" name="name" required />--%>
        </form>
        </div>
        </div>
        </body>
        
</asp:Content>
