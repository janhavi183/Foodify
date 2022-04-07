<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="OFOS.Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
     <meta charset="utf-8"/>
    
    <link rel="stylesheet" href="alogin/css/stylenew.css" media="screen" type="text/css" />
     <style>
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
    <title>Admin Login</title>
</head>

<body>
   

    <%--<div class="align">--%>
        
    <div class="card">
    
    <div class="rightside">
        <form id="form1" runat="server">
            
        <br />
        <h2>ADMIN LOGIN</h2>

            <center><asp:Label ID="status" runat="server" ForeColor="White" /></center>
            <br />
            <br />

        <%--<div class="form__field">--%>
           
          <asp:Label ID="lbl_login_admin" runat="server" CssClass="p">
              <span class="hidden" >UserName</span></asp:Label>
                    
                &nbsp;&nbsp;&nbsp;
            
            <asp:TextBox ID="tb_admin" runat="server" placeholder="UserName"  CssClass="inputbox" ></asp:TextBox>
        <%--</div>--%>
            <br />
            <br />
            
         <%--<div class="form__field"> --%>
                
              <asp:Label ID="lbl_login_pwd" runat="server" CssClass="p">
                <span class="hidden">Password</span>    
              </asp:Label>
            
                &nbsp;&nbsp;&nbsp;
                   
            <asp:TextBox ID="tb_pwd" runat="server" TextMode="Password" placeholder="Password" CssClass="inputbox"></asp:TextBox>
        <%--</div>--%>
            <br />
            <br />
            <br />
            <br />
       <%-- <div class="form__field">--%>
            <asp:Button ID="button_login_admin" CssClass="button" runat="server" Text="LOGIN" OnClick="Admin_Login_Click" />
        <%--</div>--%>
             </form>
          

    </div>
        </div>
    </div>
</body>
</html>
s