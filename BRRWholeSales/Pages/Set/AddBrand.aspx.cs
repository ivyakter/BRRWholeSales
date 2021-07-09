using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_AddBrand : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["DBcon"].ConnectionString;
    SqlConnection con = new SqlConnection();
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {                  
                GetNumber();             
                btnSave.Visible = true;           
        }
    }

     
    public void GetNumber()
    {
        DataTable BrandID = mydal.GetBrandNo();
        txtbrandid.Text = BrandID.Rows[0][0].ToString();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string[] insert = new string[20];
        insert[0] = txtbrandname.Text;

        bool IsSuccess = mydal.insertBrand(insert);

        if (IsSuccess == true)
        {
            string BID = "0";
            DataTable PIDsearch = mydal.SelectBrandMaxID();
            if (PIDsearch.Rows.Count > 0)
            {
                BID = PIDsearch.Rows[0]["BID"].ToString();
            }

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                //Insert and upload Images

                if (fuImg01.HasFile)
                {
                    string SavePath = Server.MapPath("~/BrandImage/") + BID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                    fuImg01.SaveAs(SavePath + "\\" + txtbrandname.Text.ToString().Trim() + "01" + Extention);
                    SqlCommand cmd3 = new SqlCommand("insert into tblBrandImages values('" + BID + "',N'" + txtbrandname.Text.ToString().Trim() + "01" + "','" + Extention + "')", con);
                    cmd3.ExecuteNonQuery();
                }
            }

        }
        clear();
        ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Submit Successfylly');", true);
    }

    private void clear()
    {
        txtbrandname.Text = "";
        
    }

}