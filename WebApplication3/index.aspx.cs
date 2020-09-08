using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string ch, item,Q,A,No;
        public List<string> MyLista;
        public List<string> MyData;

        protected void Page_Preinit(object sender, EventArgs e)
        {

            if (Session["Username"] == null)
            {
                this.MasterPageFile = "~/index.Master";

            }
            else
            {
                this.MasterPageFile = "~/SessionIndex.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void QA_Click(object sender, EventArgs e)
        {
            IndexType.Text = "　Q　&　A　";

           

            StringBuilder sb = new StringBuilder();
            SqlConnection cn = new SqlConnection();

            cn.ConnectionString = ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;

            cn.Open();
            string sql = "SELECT * FROM [Q&A]";
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.ExecuteNonQuery();
            SqlDataAdapter drMembers = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            drMembers.Fill(dt);
            MyLista = new List<string>();
            MyData = new List<string>();

            foreach (DataRow row in dt.Rows)
            {
                No = row["ID"].ToString();
                Q = row["Q"].ToString();
                A = row["A"].ToString();
                string result = No + "," + Q + "," + A;
                MyLista.Add(result);
            }
            SqlDataReader reader = cmd.ExecuteReader();

            //
            sb.Append("<dl></dl>");
            foreach (string test in MyLista)
            {

                string[] sqlar = test.Split(',');
            
                sb.Append("<dt> Ｑ" + sqlar[0] + "："+sqlar[1] + "</dt>");
                string[] sqlar2 = sqlar[2].Split();

                sb.Append("<dd style='margin-left: 2em;'>　A：");
                for (int i = 0; i < sqlar2.Length ; i++)
                {
                    sb.Append(sqlar2[i]);
                }
                sb.Append("</dd>");

            }
            sb.Append("</dl>");
            //

            reader.Read();
            reader.Close();
            cn.Close();


            Content.Text = sb.ToString();
        }

        protected void How_Click(object sender, EventArgs e)
        {

            IndexType.Text = "國北護服務時數實施辦法";

            StringBuilder sbc = new StringBuilder();
            SqlConnection cn = new SqlConnection();

            cn.ConnectionString = ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;

            cn.Open();
            string sql = "SELECT * FROM [Implementation Measures]";
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.ExecuteNonQuery();
            SqlDataAdapter drMembers = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            drMembers.Fill(dt);
            MyLista = new List<string>();
            MyData = new List<string>();


            foreach (DataRow row in dt.Rows)
            {
                ch = row["章節"].ToString();
                item = row["條例"].ToString();
                string result = ch + "," + item;
                MyLista.Add(result);
            }

            SqlDataReader reader = cmd.ExecuteReader();

            sbc.Append("<dl>");
            foreach (string test in MyLista)
            {
                string[] sqlar = test.Split(',');
                string[] sqlar2 = sqlar[1].Split('第');

                sbc.Append("<li>" + sqlar[0] + "<br></li>");
                for (int i = 0; i < sqlar2.Length; i++)
                {
                    sbc.Append("<dd style='margin-left: 4em;'>" + "第" + sqlar2[i] + "</dd><br>");
                }
            }
            sbc.Append("</dl>");


            reader.Read();
            reader.Close();
            cn.Close();


            Content.Text = sbc.ToString();

        }
    }
}