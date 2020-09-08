using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Preinit(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                this.MasterPageFile = "~/index.Master";
                Response.Redirect("~/index.aspx");
            }
            else
            {
                this.MasterPageFile = "~/SessionIndex.Master";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Number.Text = Session["UserAccount"].ToString();
            Name.Text = Session["UserName"].ToString();
            Next.Visible = false;
        }

        protected void start_Click(object sender, EventArgs e)
        {
            EndCalendar.Visible = false;
            StartCalendar.Visible = true;
        }

        protected void end_Click(object sender, EventArgs e)
        {
            StartCalendar.Visible = false;
            EndCalendar.Visible = true;
        }

        protected void StartCalendar_SelectionChanged(object sender, EventArgs e)
        {
            Sday.Text = StartCalendar.SelectedDate.ToString("yyyy/MM/dd");
            StartCalendar.Visible = false;
        }

        protected void EndCalendar_SelectionChanged(object sender, EventArgs e)
        {
            Eday.Text = EndCalendar.SelectedDate.ToString("yyyy/MM/dd");
            EndCalendar.Visible = false;
        }

        protected void Upload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    SqlConnection cn = new SqlConnection();
                    // 連接字串指定連接資料庫
                    cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;
                    cn.Open();  // 連接資料庫


                    HttpPostedFile postedFile = this.FileUpload1.PostedFile;
                    String fileName = "";
                    String filePath = "~/File/" + Number.Text + "/";
                    fileName = Path.GetFileName(postedFile.FileName);

                    if (Directory.Exists(Server.MapPath(filePath)) == false)
                    {
                        Directory.CreateDirectory(Server.MapPath(filePath));
                    }
                    else
                    {
                        if (string.IsNullOrEmpty(year.Text) || string.IsNullOrEmpty(Sday.Text) || string.IsNullOrEmpty(Sday.Text) ||
                             string.IsNullOrEmpty(Eday.Text) || string.IsNullOrEmpty(Local.Text) || string.IsNullOrEmpty(Content.Text) ||
                              string.IsNullOrEmpty(Time.Text))
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('每個欄位都必須填寫')", true);
                        }
                        else
                        {
                            Double n;
                            int m;
                            DateTime st = Convert.ToDateTime(Sday.Text);
                            DateTime et = Convert.ToDateTime(Eday.Text);
                            if (!int.TryParse(year.Text, out m))
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('登錄學年必須為數字')", true);
                            }
                            else if (!Double.TryParse(Time.Text, out n))
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('服務時數必須為數字')", true);
                            }
                            else if (st >= et)
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('開始日期不能大於結束日期')", true);
                            }
                            else
                            {
                                if (fileName != "")
                                {
                                    String fileType = Path.GetExtension(fileName);
                                    postedFile.SaveAs(MapPath(filePath + fileName));
                                    string finalFilePath = MapPath(filePath + fileName);

                                    string sqlstr = "INSERT INTO [服務時數填寫] ([學號],[姓名],[登入服務活動的年期(EX:1072)],[服務類別]," +
                                           "[開始日期],[結束日期],[服務單位],[服務內容],[主辦(EX:校內/校外/社團)],[服務時數],[電子證明文件]) VALUES " +
                                           "('" + Number.Text + "',N'" + Name.Text + "','" + year.Text + "',N'" +
                                           DropDownList1.SelectedValue + "','" + Sday.Text + "','" + Eday.Text + "',N'" +
                                           Local.Text + "',N'" + Content.Text + "',N'" + Zone.Text + "','" + Time.Text + "',N'" + finalFilePath + "')";

                                    //建立SqlCommand物件cmd
                                    SqlCommand cmd = new SqlCommand(sqlstr, cn);

                                    cmd.ExecuteNonQuery();
                                    SystemMes.Text = "新增資料成功！";
                                    Upload.Visible = false;
                                    Next.Visible = true;
                                }
                                else
                                {
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('請選擇檔案')", true);
                                }
                            }
                        }
                    }
              
                }
                catch (Exception ex)
                {
                    UploadMes.Text = "發生錯誤：" + ex.Message.ToString();
                }
            }
            else
            {
                UploadMes.Text = "沒有選擇要上傳的檔案！";
            }
        }

        protected void Next_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/add.aspx");
        }
    }
}