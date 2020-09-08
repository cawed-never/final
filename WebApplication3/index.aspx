<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication3.WebForm1" %>
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
								<h2><asp:Label ID="IndexType" runat="server" Text="國北護服務學習說明"></asp:Label></h2>
                                <br>
                                <asp:Button ID="How" runat="server" Text="國北護服務時數實施辦法" CssClass="button button-alt" OnClick="How_Click" />
                                <asp:Button ID="QA" runat="server" Text="Q & A" CssClass="button button-alt" OnClick="QA_Click" />
                                <br />
                                 <br />
                                 <br />
                                <div style="position: relative;
                                            top: auto;
                                            text-align: left;
                                            margin: auto;
                                            padding: 0em;
                                            line-height: 2em;
                                            font-family: Microsoft JhengHei;
                                            font-size: 15pt;
                                            color: rgba(255,255,255,.8);">
                                <asp:Label ID="Content" runat="server" Text="鼓勵北護學生利用課餘時間積極參與服務，貢獻所學所能服務社會及學校，如
                                對弱勢族群的關懷、社團服務，以熱情的心服務大眾；為了表揚參與服務志工
                                優良者，由課指組依據服務學習系統，統計服務時數優良事蹟，推薦績優志工
                                於畢業典禮中表揚，詳細請見「績優志工服務獎勵辦法」，一起把服務這分精神繼續發揚下去。"></asp:Label>
                                </div>
                             
							
							</header>
                             <a href="javascript: return false;" class="button button-alt" onclick="ShowImage()" >流程圖</a>
                             <br />
                             <br />
                             <br />
                             <div id="flowChart">     
                             </div>
							
						</section>
					</div>
				</div>
			</div>	
        </div>
		<!-- Featured Area -->
		
		
		<!-- Featured Ends Here -->

		<!-- Page -->
        
            
		<!-- /Page -->

</asp:Content>
