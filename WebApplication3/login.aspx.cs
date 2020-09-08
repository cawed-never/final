using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;/*組合想要使用的字串 string builder*/
using System.IO;/*加入*/
using System.Data;/*加入*/
using System.Configuration;/*加入*/


namespace WebApplication3
{
    public partial class login1 : System.Web.UI.Page
    {
        string Account, Password,Name;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Log_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection cn = new SqlConnection();
                {
                    // 連接字串指定連接LeeLabDB資料庫
                    cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;
                    cn.Open();  // 連接資料庫

                    string sqlstr = "Select * from [User] where [Account]='" + Acc.Text + "' and [Password]='" + Pw.Text + "'";
                    // 建立SqlCommand物件cmd
                    SqlCommand cmd = new SqlCommand(sqlstr, cn);
                    SqlDataAdapter drMembers = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable(); //建立虛擬DatsSet
                    drMembers.Fill(dt); //將資料填入資料表       
                    Session["UserName"] = "";
                    foreach (DataRow row in dt.Rows)
                    {
                        Account = row["Account"].ToString();
                        Password = row["Password"].ToString();
                        Name = row["Name"].ToString();
                        Session["UserAccount"] = Account;
                        Session["UserID"] = Password;
                        Session["UserName"] = Name;
                    }
                    if (Account == null || Password == null)
                    {
                        
                        Label2.Text = "帳號或密碼，登入失敗";
                    }
                    else {
                        SqlDataReader reader = cmd.ExecuteReader();
                        reader.Read();
                        reader.Close();
                        //Response.Redirect("index.aspx");
                        //cmd.ExecuteNonQuery();
                        Label2.Text = "登入成功";
                       
                        Response.Redirect("index.aspx");
                    }
                    
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "";
                Label2.Text = "登入失敗：ID不存在或密碼錯誤!";
            }
        }
    }
}