<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Hotel.aspx.cs" Inherits="OFOS.Hotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .auto-style1 {
        font-family: "Courier New", Courier, monospace;
        color: #FFFFFF;
    }
    .auto-style2 {
        color: #FFFFFF;
    }
    .auto-style3 {
        color: #FFFFCC;
    }
    .centerdiv{
    /*width: 30rem;*/
    margin: auto;
    background: white;
    position:center;
    align-self: center;
    top: 50rem;
    border-radius: 0rem;
    box-shadow: 4px 3px 20px #3535358c;
     font-family: 'Roboto', sans-serif !important;
     font-weight: 300;  
     font-size: 1.5rem;
     padding-bottom:5px;
    

    /*display:flex;
    height:600px;*/*/
    /*flex-direction: row;*/
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="home" >
        <h1 class="auto-style1">Delivering Deliciousness</h1>
        <p class="auto-style3"><span class="auto-style2">Ordering Food From Your Favourite Restaurants Is Just A Click Away </p>
        <%--<p class="auto-style2">Lorem ipsum dolor sit amet consectetur, adipisicing elit. </p>--%>
    </div>
    <div id="hotel">
     <div style="width:630px; " class="centerdiv">
          <% for (int i = 0; i < dtHotel.Rows.Count; i++)
                { %>
         <div style="display: inline-block; border: solid 5px black; padding:5px; width: 202px; ">
          <a href="HotelMenu.aspx?HotelID=<%=dtHotel.Rows[i]["Id"].ToString() %>">
                    <img src="IMAGES/Hotel/<%=dtHotel.Rows[i]["Id"].ToString() %>.png"  style="width: 180px; height:180px;"/><br />
                     <%=dtHotel.Rows[i]["HotelName"].ToString() %>
                
           </a>
           
         </div>
          <%} %>

     </div>
     </div>
   <%-- <table style="background: white;" align="center" cellpadding="3" cellspacing="3">
        


        <tr>
            <% for (int i = 0; i < dtHotel.Rows.Count; i++)
                { %>
            <%if (i%3==0) %>
            <td style="width: 200px; align-content: center;">
                <a href="HotelMenu.aspx?HotelID=<%=dtHotel.Rows[i]["Id"].ToString() %>">
                    <img src="IMAGES/Hotel/<%=dtHotel.Rows[i]["Id"].ToString() %>.png" /><br />
                    <%=dtHotel.Rows[i]["HotelName"].ToString() %> 
                
                </a>
            </td>
            <td style="width: 4px; background: black;"></td>
            <%} %>
        </tr>
    </table>--%>
</asp:Content>
