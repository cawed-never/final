<%@ Page Title="" Language="C#" MasterPageFile="~/SessionIndex.Master" AutoEventWireup="true" CodeBehind="editPage.aspx.cs" Inherits="WebApplication3.editPage" %>

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
                            <h2>修改紀錄</h2>
                            <div class="byline" style="text-align: left; font-size: 26px;">

                                <br />

                                <table style="border-color: gray; position: relative; top: auto; left: -200px; width: 1500px; text-align: left; margin: auto; padding: 0em; line-height: 1em; font-family: Microsoft JhengHei; font-size: 12pt; color: rgba(255,255,255,.8);"
                                    border="0">
                                    <thead>

                                        <tr>
                                            <th></th>
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


                                        </tr>
                                    </thead>

                                    <%foreach (string test in MyEList)
                                        { %>
                                    <% string[] sqlarray = test.Split(',');%>

                                    <tr>
                                        <td>你的資料為</td>

                                        <%for (int i = 1; i < sqlarray.Length - 1; i++)
                                            {%>
                                        <td><%=sqlarray[i]%></td>
                                        <%} %>
                                    </tr>
                                    <%} %>
                                </table>
                                <br />
                                <br />
                                姓名：
                            <asp:Label ID="EName" runat="server" Text=""></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            學號：
                            <asp:Label ID="ENumber" runat="server" Text=""></asp:Label>
                                <br />
                                登錄服務活動學年：
                            <asp:TextBox ID="year" runat="server"></asp:TextBox>
                                <br />
                                服務類別：
                               <asp:DropDownList ID="ServiceType" runat="server" DataSourceID="服務類別" DataTextField="服務類別" DataValueField="服務類別"></asp:DropDownList>
                                <asp:SqlDataSource ID="服務類別" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnection %>" SelectCommand="SELECT [Id], [服務類別] FROM [Type]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Type] WHERE [Id] = @original_Id AND (([服務類別] = @original_服務類別) OR ([服務類別] IS NULL AND @original_服務類別 IS NULL))" InsertCommand="INSERT INTO [Type] ([Id], [服務類別]) VALUES (@Id, @服務類別)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Type] SET [服務類別] = @服務類別 WHERE [Id] = @original_Id AND (([服務類別] = @original_服務類別) OR ([服務類別] IS NULL AND @original_服務類別 IS NULL))">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_Id" Type="Int32" />
                                        <asp:Parameter Name="original_服務類別" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Id" Type="Int32" />
                                        <asp:Parameter Name="服務類別" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="服務類別" Type="String" />
                                        <asp:Parameter Name="original_Id" Type="Int32" />
                                        <asp:Parameter Name="original_服務類別" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <br />
                                服務日期：
                                <asp:TextBox ID="Sday" runat="server"></asp:TextBox>
                                <asp:Button ID="Start" runat="server" Text="開始日期" OnClick="Start_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至　　
                                <asp:TextBox ID="Eday" runat="server"></asp:TextBox>
                                <asp:Button ID="End" runat="server" Text="結束日期" OnClick="End_Click" />
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
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       
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
                                    <asp:ListItem Value="社團">社團</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                服務時數：
                                <asp:TextBox ID="Time" runat="server"></asp:TextBox>
                                <br />
                                電子證明文件：
                                <asp:FileUpload ID="file" runat="server" />
                                <br />
                                <asp:Button ID="修改資料" runat="server" Text="修改資料" OnClick="修改資料_Click" />


                                <asp:Label ID="UpdateMessage" runat="server" Text=""></asp:Label>
                            </div>

                        </header>

                    </section>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
