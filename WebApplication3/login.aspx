<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication3.login1" %>

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
                            <h2 style="font-family: Microsoft JhengHei;">
                                <asp:Label ID="IndexType" runat="server" Text="登入"></asp:Label>
                            </h2>
                            <div>
                                <p style="font-family: Microsoft JhengHei; font-size: 16px; color: white;">
                                    帳號
                                <asp:TextBox ID="Acc" runat="server" Height="32px" Width="226px"></asp:TextBox><br />
                                </p>
                                <p style="font-family: Microsoft JhengHei; font-size: 16px; color: white;">
                                    密碼
                                <asp:TextBox ID="Pw" runat="server" Height="32px" Width="226px" TextMode="Password"></asp:TextBox><br />
                                </p>

                                <p></p>
                                <asp:Button ID="Log" runat="server" CssClass="button button-alt" Text="登入系統" OnClick="Log_Click" />

                                <br />
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text="" Font-name="Microsoft JhengHei" Font-Size="16px" ForeColor="white"></asp:Label>


                            </div>
                            <div class="byline">
                                <asp:Label ID="Content" runat="server" Text=""></asp:Label>
                            </div>
                        </header>
                    </section>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
