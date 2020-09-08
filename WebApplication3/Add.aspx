<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="WebApplication3.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="header-wrapper">
        <div id="banner">
            <div class="container">
                <div class="row">
                    <section class="12u">
                        <header>

                            <br />
                            <h2>服務時數登記</h2>
                            <div class="byline" style="text-align: left; font-size:26px;">

                                <br />

                                姓名：
                            <asp:Label ID="Name" runat="server" Text=""></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            學號：
                            <asp:Label ID="Number" runat="server" Text=""></asp:Label>
                                <br />
                                登錄服務活動學年(ex:1072)：
                            <asp:TextBox ID="year" runat="server"></asp:TextBox>
                                <br />
                                服務類別：
                             <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="服務類別" DataTextField="服務類別" DataValueField="服務類別"></asp:DropDownList>
                                <asp:SqlDataSource ID="服務類別" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnection %>" SelectCommand="SELECT [Id], [服務類別] FROM [Type]"></asp:SqlDataSource>
                                <br />
                                服務日期：
                                <asp:TextBox ID="Sday" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Button ID="start" runat="server" Text="開始日期" OnClick="start_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至　　
                                <asp:TextBox ID="Eday" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Button ID="end" runat="server" Text="結束日期" OnClick="end_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <div style="position: relative; top: auto; left: 150px">
                                    <asp:Calendar ID="StartCalendar" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="150px" Width="400px" Visible="False" OnSelectionChanged="StartCalendar_SelectionChanged">
                                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                        <OtherMonthDayStyle ForeColor="#999999" />
                                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                        <WeekendDayStyle BackColor="#CCCCFF" />
                                    </asp:Calendar>
                                </div>
                                <div style="position: relative; top: auto; left: 300px">
                                    <asp:Calendar ID="EndCalendar" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="150px" Width="400px" Visible="False" OnSelectionChanged="EndCalendar_SelectionChanged">
                                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                        <OtherMonthDayStyle ForeColor="#999999" />
                                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                        <WeekendDayStyle BackColor="#CCCCFF" />
                                    </asp:Calendar>
                                </div>
                                <br />

                                服務單位：
                                <asp:TextBox ID="Local" runat="server" Width="291px"></asp:TextBox>
                                <br />
                                服務內容：
                                <asp:TextBox ID="Content" runat="server" Width="291px"></asp:TextBox>
                                <br />
                                主辦：
                                <asp:DropDownList ID="Zone" runat="server">
                                    <asp:ListItem Value="校內">校內</asp:ListItem>
                                    <asp:ListItem Value="校外">校外</asp:ListItem>
                                    <asp:ListItem  Value="社團">社團</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                服務時數：
                                <asp:TextBox ID="Time" runat="server"></asp:TextBox>
                                <br />
                                電子證明文件：
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <br />
                                <asp:Button ID="Upload" runat="server" Text="送出" Style="height: 21px" OnClick="Upload_Click" />
                                <asp:Button ID="Next" runat="server" Text="新增下一筆資料" OnClick="Next_Click" />
                                <%--<input type="button" onclick="javascript:location.href='" value="新增下一筆資料" /> --%>
                                
                                <br />
                                 <asp:Label ID="UploadMes" runat="server" Text=""></asp:Label>
                                <br />
                                 <asp:Label ID="SystemMes" runat="server" Text=""></asp:Label>
                            </div>

                        </header>

                    </section>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
