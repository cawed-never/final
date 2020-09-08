using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class login : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"].ToString() == null)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "message", "alert('你必須先登入系統')", true);//彈窗提示檔案已存在
            }
            else
            {
                string Name = Session["Username"].ToString();
                user.Text = "　　　　" + Name + "　歡迎使用  ";
            }
        }

        protected void ListPage_Load(object sender, EventArgs e)
        {

        }

        protected void IndexPage_Load(object sender, EventArgs e)
        {

        }

        protected void AddPage_Load(object sender, EventArgs e)
        {

        }

        protected void EditPage_Load(object sender, EventArgs e)
        {

        }

    }
}