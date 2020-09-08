<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="WebApplication3.logout" %>
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
                                <asp:Label ID="IndexType" runat="server" Text="登出"></asp:Label>
                            </h2>
                            <div>
                             
                                <p></p>
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
