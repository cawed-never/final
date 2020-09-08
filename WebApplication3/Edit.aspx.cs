using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Edit : System.Web.UI.Page
    {

        public List<string> MyList, MyData;


        string GetID, dataID, SNumber, scount, SName, LYear, ServiceTypes, StartDate, EndDate, LabelLocal, LContent, LZone, LTime, eFile;

        protected void Download_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('你必須先選擇資料')", true);
            }
            else
            {
                dataID = Request.QueryString["ID"];
                SqlConnection cn = new SqlConnection();
                // 連接字串指定連接資料庫
                cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;
                cn.Open();  // 連接資料庫

                string sqlstr = "SELECT [電子證明文件] FROM [服務時數填寫] WHERE [ID] = " + dataID;
                //建立SqlCommand物件cmd
                SqlCommand cmd = new SqlCommand(sqlstr, cn);
                cmd.ExecuteNonQuery();
                SqlDataAdapter drMembers = new SqlDataAdapter(cmd);
                DataTable dtEdit = new DataTable();
                drMembers.Fill(dtEdit);

                MyData = new List<string>();

                StringBuilder sb = new StringBuilder();
                foreach (DataRow row in dtEdit.Rows)
                {
                    eFile = row["電子證明文件"].ToString();

                    string Resultcount = eFile;
                    MyData.Add(Resultcount);
                }


                cn.Close();
             
                String filePath = "~/File/" + Number.Text + "/";
                string finalFilePath = MyData[0];
                System.Net.WebClient wc = new System.Net.WebClient(); 
                byte[] xfile = null;
                string docupath = Request.PhysicalApplicationPath;
                xfile = wc.DownloadData(finalFilePath);
                string xfileName = System.IO.Path.GetFileName(finalFilePath);
                HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + HttpContext.Current.Server.UrlEncode(xfileName));
                HttpContext.Current.Response.ContentType = "application/octet-stream";
                HttpContext.Current.Response.BinaryWrite(xfile); 
                HttpContext.Current.Response.End();
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

        protected void Delete_Click(object sender, EventArgs e)
        {
            if (Session["Username"].ToString() == null || Session["UserAccount"].ToString() == null)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('你必須先登入系統')", true);//彈窗提示檔案已存在
            }
            else
            {
                Number.Text = Session["UserAccount"].ToString();
                Name.Text = Session["UserName"].ToString();
                dataID = Request.QueryString["ID"];
                if (dataID == null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('請先選取你要使用的資料')", true);//彈窗提示檔案已存在
                }
                else
                {

                    Console.Write(dataID);
                    SqlConnection cn = new SqlConnection();
                    // 連接字串指定連接資料庫
                    cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;
                    cn.Open();  // 連接資料庫



                    string sqlstr = "DELETE FROM [服務時數填寫] WHERE [ID] = " + dataID;
                    //建立SqlCommand物件cmd
                    SqlCommand cmd = new SqlCommand(sqlstr, cn);
                    cmd.ExecuteNonQuery();

                    cn.Close();
                }
                Response.AddHeader("Refresh", "0");
            }
        }

        protected void UpdateData_Click(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"].ToString() == null || Session["UserAccount"].ToString() == null)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('你必須先登入系統')", true);//彈窗提示檔案已存在
            }
            else
            {
                Number.Text = Session["UserAccount"].ToString();
                Name.Text = Session["UserName"].ToString();

                SqlConnection cn = new SqlConnection();
                {
                    cn.ConnectionString = ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;

                    cn.Open();

                    string sql = "SELECT * FROM [服務時數填寫] WHERE [學號] = '" + Number.Text + "'";

                    string sqlcount = "SELECT count(ID) AS [筆數] FROM [服務時數填寫] WHERE [學號] = '" + Number.Text + "'";

                    SqlCommand cmd = new SqlCommand(sql, cn);
                    SqlCommand cmdcount = new SqlCommand(sqlcount, cn);

                    SqlDataAdapter drMembers = new SqlDataAdapter(cmd);

                    DataTable dtEdit = new DataTable();

                    drMembers.Fill(dtEdit);


                    MyList = new List<string>();

                    StringBuilder sb = new StringBuilder();

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
                        MyList.Add(ResultEdit);
                    }


                    SqlDataReader reader = cmd.ExecuteReader();
                    reader.Read();
                    reader.Close();
                    cn.Close();
                }
            }
        }
    }
}