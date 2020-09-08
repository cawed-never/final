using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class editPage : System.Web.UI.Page
    {
        public List<string> MyEList;
        string GetID, dataID, SNumber, SName, LYear, ServiceTypes, StartDate, EndDate, LabelLocal, LContent, LZone, LTime, eFile;

        protected void EndCalendar_SelectionChanged(object sender, EventArgs e)
        {
            Eday.Text = EndCalendar.SelectedDate.ToString("yyyy/MM/dd");
            EndCalendar.Visible = false;
        }

        protected void StartCalendar_SelectionChanged(object sender, EventArgs e)
        {
            Sday.Text = StartCalendar.SelectedDate.ToString("yyyy/MM/dd");
            StartCalendar.Visible = false;
        }

        protected void End_Click(object sender, EventArgs e)
        {
            StartCalendar.Visible = false;
            EndCalendar.Visible = true;
        }

        protected void Start_Click(object sender, EventArgs e)
        {
            EndCalendar.Visible = false;
            StartCalendar.Visible = true;
        }

        protected void 修改資料_Click(object sender, EventArgs e)
        {
            if (file.HasFile)
            {
                try
                {
                    SqlConnection cn = new SqlConnection();
                    GetID = Request.QueryString["ID"];

                    string Number = Session["UserAccount"].ToString();
                    string Name = Session["UserName"].ToString();


                    cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;
                    cn.Open();  // 連接資料庫

                    HttpPostedFile postedFile = this.file.PostedFile;
                    String fileName = "";
                    String filePath = "~/File/" + Number + "/";
                    fileName = Path.GetFileName(postedFile.FileName);

                    if (Directory.Exists(Server.MapPath(filePath)) == false)
                    {
                        Directory.CreateDirectory(Server.MapPath(filePath));
                    }
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

                     

                                string sqlstr = "UPDATE [服務時數填寫] SET [登入服務活動的年期(EX:1072)] ='"
                            + year.Text + "',[服務類別] = N'" + ServiceType.SelectedValue +
                             "',[開始日期]='" + Sday.Text + "',[結束日期]='" + Eday.Text
                            + "',[服務單位] = N'" + Local.Text + "',[服務內容] = N'"
                            + Content.Text + "',[主辦(EX:校內/校外/社團)]= N'" + Zone.Text +
                            "',[服務時數]='" + Time.Text + "',[電子證明文件] = N'" + finalFilePath +
                            "' WHERE [ID] ='" + GetID + "'";
                                //建立SqlCommand物件cmd

                                SqlCommand cmd = new SqlCommand(sqlstr, cn);
                                cmd.ExecuteNonQuery();
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('修改成功！')", true);
                                Response.AddHeader("Refresh", "0");
                            }
                            else
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('請選擇檔案')", true);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    foreach (var item in new DirectoryInfo(Server.MapPath("~/Files/")).GetFiles("*.*", SearchOption.AllDirectories))
                    {
                        Response.Write(item + "<br/>");
                    }
                    UpdateMessage.Text = "發生錯誤：" + ex.Message.ToString();
                }
            }
            else
            {
                UpdateMessage.Text = "沒有選擇要上傳的檔案！";
            }

        }

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

            string Number = Session["UserAccount"].ToString();
            string Name = Session["UserName"].ToString();

            EName.Text = Name;
            ENumber.Text = Number;

            GetID = Request.QueryString["ID"];
            SqlConnection cn = new SqlConnection();
            // 連接字串指定連接資料庫
            cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;
            cn.Open();  // 連接資料庫

            string sqlstr = "SELECT * FROM [服務時數填寫] WHERE [ID] = " + GetID;
            //建立SqlCommand物件cmd
            SqlCommand cmd = new SqlCommand(sqlstr, cn);
            cmd.ExecuteNonQuery();
            SqlDataAdapter drMembers = new SqlDataAdapter(cmd);
            DataTable dtEdit = new DataTable();

            drMembers.Fill(dtEdit);

            MyEList = new List<string>();


            foreach (DataRow row in dtEdit.Rows)
            {
                dataID = row["ID"].ToString();
                SNumber = row["學號"].ToString();
                //Label1.Text = name.ToString();
                SName = row["姓名"].ToString();
                LYear = row["登入服務活動的年期(EX:1072)"].ToString();
                ServiceTypes = row["服務類別"].ToString();
                StartDate = row["開始日期"].ToString();
                EndDate = row["結束日期"].ToString();
                LabelLocal = row["服務單位"].ToString();
                LContent = row["服務內容"].ToString();
                LZone = row["主辦(EX:校內/校外/社團)"].ToString();
                LTime = row["服務時數"].ToString();
                eFile = row["電子證明文件"].ToString();


                string ResultEdit = dataID + "," + SNumber + "," + SName + "," + LYear + "," + ServiceTypes + "," + StartDate + "," + EndDate
                    + "," + LabelLocal + "," + LContent + "," + LZone + "," + LTime + "," + eFile;
                MyEList.Add(ResultEdit);
            }

            cn.Close();
        }
    }
}