<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HotelMyAccount.aspx.cs" Inherits="OFOS.HotelMyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       .centerdiv{
    width: 20rem;
    margin: auto;
    background: white;
    position:center;
    align-self: center;
    top: 50rem;
    border-radius: 0.5rem;
    box-shadow: 4px 3px 20px #3535358c;
    display:flex;
    flex-direction: row;
    border-top-left-radius: 0.5rem;
    border-bottom-left-radius: 0.5rem;
	border-bottom-right-radius: 0.5rem;
    border-top-right-radius: 0.5rem;
    padding: 1rem 1rem 1rem 1rem;
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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" style="width: 100%;color:white">
        <tr>
            <td>
                 <asp:DetailsView ID = "AccDetails" runat = "server" AutoGenerateRows = "False" DataSourceID = "sql1" 
                onDataBound="AccDetails_DataBound" onItemUpdating="AccDetails_ItemUpdating" CssClass="centerdiv"
                 CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
                <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <Fields >
                    <asp:BoundField DataField = "Username" HeaderText = "Username" ReadOnly = "True" />
                    
                    <asp:Templatefield HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label ID="lblpwd" runat="server" Text='<%#Eval("Password") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="tbpwd" runat="server" />
                            <asp:RequiredFieldValidator id="rfv1" runat="server" ErrorMessage="Please provide password." ControlToValidate="tbpwd" />
                        </EditItemTemplate>
                    </asp:Templatefield>

                    <asp:Templatefield HeaderText="Email ID">
                        <ItemTemplate>
                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("Email") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="tbemail" runat="server" />
                            <asp:RegularExpressionValidator id="rev_email" runat="server" ErrorMessage="Your email is not in the correct format." 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tbemail" />
                        </EditItemTemplate>
                    </asp:Templatefield>
                    
                    <asp:Templatefield HeaderText="Contact No">
                        <ItemTemplate>
                            <asp:Label ID="lblcnt" runat="server" Text='<%#Eval("Contact_no") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="tbcnt" runat="server" />
                            <asp:RegularExpressionValidator ID="rev_contact" runat="server" ControlToValidate="tbcnt" 
                                ValidationExpression="[0-9]{10}" ErrorMessage="Please enter upto 10 digits." />
                        </EditItemTemplate>
                    </asp:Templatefield>

                    <asp:BoundField DataField = "House_no" HeaderText = "Your House_no" />
                    <asp:BoundField DataField = "Street" HeaderText = "Your Address" />
                  
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("City") %>' />
                        </ItemTemplate>                        
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlcity" runat="server">
                                <asp:ListItem>Mumbai</asp:ListItem>
                                <asp:ListItem>Navi Mumbai</asp:ListItem>
                            </asp:DropDownList> 
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                </Fields>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
            </asp:DetailsView>

            <asp:Sqldatasource ID="sql1" runat="server" 

            SelectCommand="select Username, Password, Email, Contact_no, House_no, Street, City from [dbo].[Customers]
                 where Username=@Username"
            UpdateCommand="update [dbo].[Customers] set Password=@Password, Email=@Email, Contact_no=@Contact_no,
                 House_no=@House_no, Street=@Street, City=@City where Username=@Username">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="user" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Contact_no" Type="String" />
                    <asp:Parameter Name="House_no" Type="String" />
                    <asp:Parameter Name="Street" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:SessionParameter Name="Username" SessionField="user" />
                </UpdateParameters>
            </asp:Sqldatasource>

            </td>
        </tr>
           <tr>
            <td>
                  <asp:Label ID="lbl1" runat="server" Text="" ForeColor="white"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
