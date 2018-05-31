<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="visit_info.aspx.vb" Inherits="HAST_visit_info" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 參訪資訊</h5>
			</header>
        </section>
    </div>

		<!-- Main-->		
				
			<!-- Content -->
		
    <section id="two" class="wrapper style3" style="background-color:#e6e3d3; color:#968D59">
				<div class="container">
					<div class="row">
						<div class="7u 12u$(2)">
                            <div class="10u">
							<section class="feature visit">
								<i class="fa fa-map-marker fa-sm"></i>
								<h3 style="color:#66603E">交通資訊</h3>
                                <a href="https://goo.gl/9aXxUK" class="fit" target="_blank" style="background:none;">
                                    <cc1:StaticGMap ID="StaticGMap1" runat="server"  />

                                </a>
                                <br />
								<a href="https://www.sinica.edu.tw/location.htm" target="_blank">中央研究院交通資訊</a>
							</section>
                            </div>
						</div>
						<div class="5u$ 12u$(2)">
                            <div class="12u">
                                <section class="feature visit">
								<i class="icon fa-clock-o fa-sm"></i>
								<h3 style="color:#66603E">開放時間</h3>
								<p>週一至週五 9:00-12:00  13:30-16:30<br />
                                    星期例假及國定假日休館</p>
							</section>
                            </div>
                            <div class="12u">
							<section class="feature visit">
								<i class="icon fa-phone fa-sm"></i>
								<h3 style="color:#66603E">聯絡資訊</h3>
								<p>地址：115臺北市南港區研究院路二段128號<br />
                                電話：(02)2787-2223 劉小姐<br />
                                傳真：(02)2789-1623<br />
                                email：<a href="mailto:hast@gate.sinica.edu.tw">hast@gate.sinica.edu.tw</a>
								</p>
							</section>
                            </div>
						</div>
					</div>
				</div>
			</section>

    <section id="three" class="wrapper style2" style="background-color:#2f2f2f; color:#999">	
		<div class="container">
            <h2 style="color:#997E73">參觀須知</h2>
            <section class="feature visit">
			    <ul>
                    <li>開放時間：週一至週五9:00－12:00 13:30-16:30</li>
                    <li>星期例假及國定假日休館</li>
                    <li>參觀須知：機關團體請一個月前先電話連繫並發公文，說明參觀日期、時間、人數及所屬單位，並按預定時間前來參觀。</li>
                    <li>人員限制：每日可接待二梯次共20人次，每週最多二次共40人次。國小三年級(含)以上。</li>
                    <li><h4>＊因個人實際研究需要使用標本館者，請另行預約。</h4></li>
                    <li>注意事項：
                        <ol>
                            <li>訪客入館請簽名，離館請知會館員。</li>
                            <li>參觀者所攜帶之物品，如背包、雨具等，不得攜入標本陳列室。</li>
                            <li>本館嚴禁攜入新鮮或未經冷凍殺蟲之動植物活體或標本。</li>
                            <li>禁止在標本陳列室內飲食。</li>
                        </ol>
                    </li>                    
                </ul>
            </section>
		</div>
	</section>
        
    <section id="four" class="wrapper style2" style="background-color:#75432F; color:#E5D5C8">	
		<div class="container">
            <h2 style="color:#E5D5C8">研閱本館標本注意事項</h2>
            <section class="feature visit">
                
		    <ol>
                    <li>訪客入館請簽名，離館請知會館員。</li>
                    <li>本館嚴禁攜入新鮮或未經冷凍殺蟲之動植物活體或標本。</li>
                    <li>除開水外，禁止在標本陳列室內飲食。</li>
                    <li>取用標本正面朝上與地面平行，打開屬、種套後，小心拿取標本，切勿抽取。</li>
                    <li>標本脫落部份請放入碎片小袋內。</li>
                    <li>鑑定標本請用「立貼」寫上學名、鑑定者（中英文）、鑑定日期，貼在台紙上，置於桌面待本館人員處理。</li>
                    <li>本館提供解剖顯微鏡、解剖針、立貼、各種工具書等（請洽工作人員）；並提供部份資料庫列印服務（例如：本館典藏Begonia屬植物的採集地點等）。</li>
                    <li>如需摘取標本部分研究材料，請遵守以下規定：
                        <ol style="list-style-type:lower-roman;">
                            <li>須先徵得館主任同意。</li>
                            <li>不可由模式標本或同種標本少於五張者取用任何部分。</li>
                            <li>每張標本至多僅取一朵花之花粉，並儘量不破壞花的完整性。</li>
                            <li>同一張標本不可取兩次相同材料。</li>
                            <li>被取用之標本須貼上標籤，註明取用人、取用日期及取用部位。</li>
                            <li>若摘取材料做SEM、TEM或PCR等研究，應將照片或發表之研究報告致贈本館，並註明採集者、採集號、放大倍率等資料。</li>                            
                        </ol>
                    </li>
                    <li>研究報告中若有引證本館標本，應於發表之報告上加註本館代號（HAST），並將研究著作致贈本館一份。</li>
                    <li>本館標本之出借，原則上只對標本館或機關，而不對個人提供服務。若需借出標本，須有標本館館主任（curator）或單位首長之借函經本館主任同意。<br />非模式標本借期以一年為限，模式標本則以三個月為限；視情況經辦妥續借手續，得以延長。</li>                    
                </ol>
                (1999.08.23修訂)
            </section>
		</div>
	</section>

</asp:Content>

