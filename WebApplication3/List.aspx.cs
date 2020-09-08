using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;/*組合想要使用的字串*/
using System.Configuration;
using System.Data;

namespace WebApplication3
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string  Name, Address, URL, CPerson, Phone;
        public List<string> lista;

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
            type.Text = "兒童福利";
            if (!Page.IsPostBack)/*如果是第一次連到這一頁*/
            {
                SqlConnection cn = new SqlConnection();
                {
                    cn.ConnectionString = ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;

                    cn.Open();
                    string sql = "SELECT * FROM [Services]";
                    SqlCommand cmd = new SqlCommand(sql, cn);
                   

                    SqlDataAdapter drMembers = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    drMembers.Fill(dt);
                    lista = new List<string>();
                    foreach (DataRow row in dt.Rows)
                    {
                        Name = row["Name"].ToString();
                        Address = row["Address"].ToString();
                        URL = row["URL"].ToString();
                        CPerson = row["Contact Person"].ToString();
                        Phone = row["Tel"].ToString();
                        string result = Name + "," + Address + "," + URL + "," + CPerson + "," + Phone;
                        lista.Add(result);
                    }
                    SqlDataReader reader = cmd.ExecuteReader();
                    reader.Read();
                    reader.Close();
                    cn.Close();
                }
            }
        }

        protected void Disable_Click(object sender, EventArgs e)
        {
            type.Text = "社會福利";
            
                SqlConnection cn = new SqlConnection();
                
                    cn.ConnectionString = ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;

                    cn.Open();
                    string sql = "SELECT * FROM [Disable]";
                    SqlCommand cmd = new SqlCommand(sql, cn);

                    SqlDataAdapter drMembers = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    drMembers.Fill(dt);
                    lista = new List<string>();
                    foreach (DataRow row in dt.Rows)
                    {
                        Name = row["Name"].ToString();
                        Address = row["Address"].ToString();
                        URL = row["URL"].ToString();
                        CPerson = row["Contact Person"].ToString();
                        Phone = row["Tel"].ToString();
                        string result = Name + "," + Address + "," + URL + "," + CPerson + "," + Phone;
                        lista.Add(result);
                    }
                    SqlDataReader reader = cmd.ExecuteReader();
                    reader.Read();
                    reader.Close();
                    cn.Close();
            
        }

        protected void Older_Click(object sender, EventArgs e)
        {
            type.Text = "長者關懷";
            SqlConnection cn = new SqlConnection();

            cn.ConnectionString = ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;

            cn.Open();
            string sql = "SELECT * FROM [Older]";
            SqlCommand cmd = new SqlCommand(sql, cn);
   
            SqlDataAdapter drMembers = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            drMembers.Fill(dt);
            lista = new List<string>();
            foreach (DataRow row in dt.Rows)
            {
                Name = row["Name"].ToString();
                Address = row["Address"].ToString();
                URL = row["URL"].ToString();
                CPerson = row["Contact Person"].ToString();
                Phone = row["Tel"].ToString();
                string result = Name + "," + Address + "," + URL + "," + CPerson + "," + Phone;
                lista.Add(result);
            }
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            reader.Close();
            cn.Close();

        }

        protected void Other_Click(object sender, EventArgs e)
        {
            type.Text = "其他服務";
            SqlConnection cn = new SqlConnection();
            {
                cn.ConnectionString = ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;

                cn.Open();
                string sql = "SELECT * FROM [Other]";
                SqlCommand cmd = new SqlCommand(sql, cn);

                SqlDataAdapter drMembers = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                drMembers.Fill(dt);
                lista = new List<string>();
                foreach (DataRow row in dt.Rows)
                {
                    Name = row["Name"].ToString();
                    Address = row["Address"].ToString();
                    URL = row["URL"].ToString();
                    CPerson = row["Contact Person"].ToString();
                    Phone = row["Tel"].ToString();
                    string result = Name + "," + Address + "," + URL + "," + CPerson + "," + Phone;
                    lista.Add(result);
                }
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                reader.Close();
                cn.Close();
            }
        }

        protected void Services_Click(object sender, EventArgs e)
        {
            type.Text = "兒童福利"; 
            SqlConnection cn = new SqlConnection();
            {
                cn.ConnectionString = ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString;

                cn.Open();
                string sql = "SELECT * FROM [Services]";
                SqlCommand cmd = new SqlCommand(sql, cn);

                SqlDataAdapter drMembers = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                drMembers.Fill(dt);
                lista = new List<string>();
                foreach (DataRow row in dt.Rows)
                {
                    Name = row["Name"].ToString();
                    Address = row["Address"].ToString();
                    URL = row["URL"].ToString();
                    CPerson = row["Contact Person"].ToString();
                    Phone = row["Tel"].ToString();
                    string result = Name + "," + Address + "," + URL + "," + CPerson + "," + Phone;
                    lista.Add(result);
                }
                SqlDataReader reader = cmd.ExecuteReader();

                reader.Read();
                reader.Close();
                cn.Close();
            }
        }
    }
}

