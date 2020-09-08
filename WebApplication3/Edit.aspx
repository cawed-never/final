<%@ Page Title="" Language="C#" MasterPageFile="~/SessionIndex.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="WebApplication3.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            height: 16px;
        }

        .auto-style8 {
            width: 143px;
            height: 16px;
        }

        .auto-style9 {
            width: 75px;
            height: 16px;
        }

        .auto-style11 {
            width: 56px;
            height: 16px;
        }

        .auto-style13 {
            width: 100px;
            height: 16px;
        }

        .auto-style14 {
            width: 124px;
            height: 16px;
        }

        .auto-style15 {
            height: 16px;
            width: 129px;
        }

        .auto-style16 {
            width: 30px;
            height: 16px;
        }

        .auto-style18 {
            width: 99px;
        }

        .auto-style19 {
            width: 99px;
            height: 16px;
        }

        .auto-style20 {
            width: 60px;
            height: 16px;
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
                            <br />
                            <h2>
                                <asp:Label ID="Label1" runat="server" Text="我的服務時數列表"></asp:Label></h2>

                            <br />

                            <asp:Label ID="Number" runat="server" Text="" Visible="false"></></asp:Label>

                            <asp:Label ID="Name" runat="server" Text="" Visible="false"></asp:Label>
                            <table style="border-color: gray; position: relative; top: auto; left: -100px; width: 1500px; text-align: left; margin: auto; padding: 0em; line-height: 1em; font-family: Microsoft JhengHei; font-size: 12pt; color: rgba(255,255,255,.8);"
                                border="6">
                                <thead>

                                    <tr>
                                        <th>ID</th>
                                        <th class="auto-style6">學號</th>
                                        <th class="auto-style19">姓名</th>
                                        <th class="auto-style13">登入服務活動<br />
                                            年期(EX:1072)</th>
                                        <th class="auto-style8">服務類別</th>
                                        <th class="auto-style14">開始日期</th>
                                        <th class="auto-style15">結束日期</th>
                                        <th class="auto-style6">服務單位</th>
                                        <th class="auto-style6">服務內容</th>
                                        <th class="auto-style9">主辦
                                                <br />
                                            (EX:校內/校外/社團)</th>
                                        <th class="auto-style20">服務時數</th>
                                        <th class="auto-style16">電子證明文件</th>
                                        <th class="auto-style11">動作</th>
                                    </tr>
                                </thead>

                                <%foreach (string test in MyList)
                                    { %>
                                <% string[] sqlarray = test.Split(',');  %>

                                <tbody>
                                    <tr>
                                        <%for (int i = 0; i < sqlarray.Length - 1; i++)
                                            {%>
                                        <td><%=sqlarray[i]%></td>
                                        <%} %>
                                        <td class="auto-style18">
                                            <asp:Button ID="Download" runat="server" Text="下載" OnClick="Download_Click" />
                                        </td>
                                        <td>
                                          
                                            <% string location = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath; %>
                                            <% string delData = "Edit.aspx?ID=" + sqlarray[0];%>
                                            <% string updateData = "editPage.aspx?ID=" + sqlarray[0];%>
                                            <% string url = location + updateData; %>
                                           <input type='button' onclick="location.href='<%=delData%>'" value='選擇'>
                                            <input type='button' onclick="location.href='<%=updateData%>'" value='修改'>
                                          <%--  <asp:Button ID="UpdateData" runat="server" Text="修改" OnClick="UpdateData_Click" PostBackUrl="~/editPage.aspx"/>
                                    --%>
                                            <asp:Button ID="Delete" runat="server" Text="刪除" OnClientClick="ConfirmBox();" OnClick="Delete_Click" />


                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </header>

                    </section>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
