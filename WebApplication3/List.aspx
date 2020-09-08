<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="WebApplication3.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 1920px;
            height: 1085px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="header-wrapper">
        <div id="banner">
            <div class="container">
                <div class="row">
                    <section class="12u">
                        <header>
                            <h2>
                                <asp:Label ID="type" runat="server" Text="兒童福利"></asp:Label></h2>
                            <br />

                            <asp:Button ID="Services" runat="server" Text="兒童福利" OnClick="Services_Click" CssClass="button button-alt" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Older" runat="server" Text="長者關懷" OnClick="Older_Click" CssClass="button button-alt" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Disable" runat="server" Text="社會福利" OnClick="Disable_Click" CssClass="button button-alt" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Other" runat="server" Text="其他服務" OnClick="Other_Click" CssClass="button button-alt" />
                            <br />
                            <br />
                            <br />

                            <table class="ListTable" border="2" id="ListTable">
                                <thead>
                                    <tr width="1500">
                                        <th width="300">服務單位名稱</th>
                                        <th width="300">機構地點</th>
                                        <th width="300">網址</th>
                                        <th width="300">聯絡人</th>
                                        <th width="300">電話</th>
                                    </tr>
                                </thead>
                                <%foreach (string test in lista)
                                    {%>
                                <%string[] sArray = test.Split(',');%>
                                <tbody>
                                    <tr>

                                        <td><%=sArray[0]%></td>
                                        <td><%=sArray[1]%></td>
                                        <td>
                                            <a href="<%=sArray[2]%>" style="color: white; text-align: left;"><%=sArray[2]%></a>
                                        </td>
                                        <td><%=sArray[3]%></td>
                                        <td><%=sArray[4]%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>


                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnection %>" DeleteCommand="DELETE FROM [Services] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Services] ([Id], [Name], [Address], [URL], [Contact Person], [Tel]) VALUES (@Id, @Name, @Address, @URL, @Contact_Person, @Tel)" SelectCommand="SELECT * FROM [Services]" UpdateCommand="UPDATE [Services] SET [Name] = @Name, [Address] = @Address, [URL] = @URL, [Contact Person] = @Contact_Person, [Tel] = @Tel WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Address" Type="String" />
                                    <asp:Parameter Name="URL" Type="String" />
                                    <asp:Parameter Name="Contact_Person" Type="String" />
                                    <asp:Parameter Name="Tel" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Address" Type="String" />
                                    <asp:Parameter Name="URL" Type="String" />
                                    <asp:Parameter Name="Contact_Person" Type="String" />
                                    <asp:Parameter Name="Tel" Type="String" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnection %>" DeleteCommand="DELETE FROM [Disable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Disable] ([Name], [Adress], [URL], [Contact Person], [Tel]) VALUES (@Name, @Adress, @URL, @Contact_Person, @Tel)" SelectCommand="SELECT * FROM [Disable]" UpdateCommand="UPDATE [Disable] SET [Name] = @Name, [Adress] = @Adress, [URL] = @URL, [Contact Person] = @Contact_Person, [Tel] = @Tel WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Adress" Type="String" />
                                    <asp:Parameter Name="URL" Type="String" />
                                    <asp:Parameter Name="Contact_Person" Type="String" />
                                    <asp:Parameter Name="Tel" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Adress" Type="String" />
                                    <asp:Parameter Name="URL" Type="String" />
                                    <asp:Parameter Name="Contact_Person" Type="String" />
                                    <asp:Parameter Name="Tel" Type="String" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnection %>" DeleteCommand="DELETE FROM [Older] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Older] ([Id], [Name], [Adress], [URL], [Contact Person], [Tel]) VALUES (@Id, @Name, @Adress, @URL, @Contact_Person, @Tel)" SelectCommand="SELECT * FROM [Older]" UpdateCommand="UPDATE [Older] SET [Name] = @Name, [Adress] = @Adress, [URL] = @URL, [Contact Person] = @Contact_Person, [Tel] = @Tel WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Adress" Type="String" />
                                    <asp:Parameter Name="URL" Type="String" />
                                    <asp:Parameter Name="Contact_Person" Type="String" />
                                    <asp:Parameter Name="Tel" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Adress" Type="String" />
                                    <asp:Parameter Name="URL" Type="String" />
                                    <asp:Parameter Name="Contact_Person" Type="String" />
                                    <asp:Parameter Name="Tel" Type="String" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnection %>" DeleteCommand="DELETE FROM [Other] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Other] ([Id], [Name], [Adress], [URL], [Contact Person], [Tel]) VALUES (@Id, @Name, @Adress, @URL, @Contact_Person, @Tel)" SelectCommand="SELECT * FROM [Other]" UpdateCommand="UPDATE [Other] SET [Name] = @Name, [Adress] = @Adress, [URL] = @URL, [Contact Person] = @Contact_Person, [Tel] = @Tel WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Adress" Type="String" />
                                    <asp:Parameter Name="URL" Type="String" />
                                    <asp:Parameter Name="Contact_Person" Type="String" />
                                    <asp:Parameter Name="Tel" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Adress" Type="String" />
                                    <asp:Parameter Name="URL" Type="String" />
                                    <asp:Parameter Name="Contact_Person" Type="String" />
                                    <asp:Parameter Name="Tel" Type="String" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <span class="byline">資料來源：國北護校網</span>

                        </header>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured Area -->
    <!-- Featured Ends Here -->

    <!-- Page -->

    <div id="page">
    </div>

    <!-- /Page -->
</asp:Content>
