<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HotelMenu.aspx.cs" Inherits="OFOS.HotelMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <center>
                            

                            <asp:Button CssClass="b" ID="Button_soup" runat="server" Text="SOUP" OnClick="Button_soup_onclick" />
                            <asp:Button CssClass="b" ID="Button_starter" runat="server" Text="STARTER" OnClick="Button_starter_onclick" />
                            <asp:Button CssClass="b" ID="Button_rice" runat="server" Text="RICE" OnClick="Button_rice_onclick" />
                            <asp:Button CssClass="b" ID="Button_noodles" runat="server" Text="NOODLES" OnClick="Button_noodles_onclick" />
                            <asp:Button CssClass="b" ID="Button_MainCourse" runat="server" Text="MAIN COURSE" OnClick="Button_maincourse_onclick" />
                            <asp:Button CssClass="b" ID="Button_dessert" runat="server" Text="DESSERT" OnClick="Button_dessert_onclick" />


                            <div class="w3-content w3-section" style="max-width: 550px" id="pic" runat="server">
                                <br />
                                <center>
                                    <img class="mySlides w3-animate-fading" src="PIC\noodles.jpg" height="450px" width="550px" />
                                    <img class="mySlides w3-animate-fading" src="PIC\man.jpg" height="450px" width="550px" />
                                    <img class="mySlides w3-animate-fading" src="PIC\szh_f.JPG" height="450px" width="550px" />
                                    <img class="mySlides w3-animate-fading" src="PIC\rice.PNG" height="450px" width="550px" />
                                    <img class="mySlides w3-animate-fading" src="PIC\chop.PNG" height="450px" width="550px" />
                                    <img class="mySlides w3-animate-fading" src="PIC\schewan-vegetables.jpg" height="450px" width="550px" />
                                    <img class="mySlides w3-animate-fading" src="PIC\choco.jpg" height="450px" width="550px" />
                                    <img class="mySlides w3-animate-fading" src="PIC\manchurian.jpg" height="450px" width="550px" />
                                    <img class="mySlides w3-animate-fading" src="PIC\c_v.jpg" height="450px" width="550px" />
                                </center>
                            </div>

                            <script>
                                var myIndex = 0;
                                carousel();

                                function carousel() {
                                    var i;
                                    var x = document.getElementsByClassName("mySlides");
                                    for (i = 0; i < x.length; i++) {
                                        x[i].style.display = "none";
                                    }
                                    myIndex++;
                                    if (myIndex > x.length) { myIndex = 1 }
                                    x[myIndex - 1].style.display = "block";
                                    setTimeout(carousel, 3000);
                                }
                            </script>
                             
                           
                            <asp:GridView ID="griditem" CssClass="gridview" HeaderStyle-CssClass="header"
                                RowStyle-CssClass="row" runat="server" AutoGenerateColumns="false"
                                CellSpacing="10" CellPadding="12" HeaderStyle-Font-Bold="true">
                                <Columns>

                                    <asp:BoundField DataField="Item_no" HeaderText="ITEM NO" ReadOnly="true" SortExpression="Item_no" />
                                    <asp:BoundField DataField="Item_name" HeaderText="ITEM NAME" ReadOnly="true" SortExpression="Name" />
                                    <asp:BoundField DataField="Description" HeaderText="DESCRIPTION" ReadOnly="true" SortExpression="Description" />
                                    <asp:ImageField DataImageUrlField="Image_url" ControlStyle-Width="120"
                                        ControlStyle-Height="120" HeaderText="IMAGE" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Price" HeaderText="PRICE"
                                        ReadOnly="true" SortExpression="Price" />

                                    <asp:TemplateField HeaderText="QUANTITY">
                                        <ItemTemplate>
                                            <asp:TextBox ID="tb_quantity" runat="server" TextMode="number" Width="70" />
                                            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="<img src='error.png' width='25' height='25' />"
                                                ControlToValidate="tb_quantity" Type="Integer" MinimumValue="1" MaximumValue="10" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="l1" Text="Added to Cart" runat="server" Visible="false" />
                                            <asp:Button ID="button_cart" runat="server" Text="Add To Cart"
                                                OnClick="griditem_Click" CssClass="button button3" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </center>
</asp:Content>
