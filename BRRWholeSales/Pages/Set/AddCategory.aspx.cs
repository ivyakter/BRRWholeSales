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

public partial class Pages_Set_AddCategory : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["DBcon"].ConnectionString;
    SqlConnection con = new SqlConnection();
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Id"] != null)
            {
                getCategorybyid();
                btnupdate.Visible = true;
                btnSave.Visible = false;
            }
            else
            {

                GetNumber();
                btnSave.Visible = true;


            }

        }

    }

    private void getCategorybyid()
    {
        Int64 id = Convert.ToInt64(Request.QueryString["Id"]);
        DataTable dt = mydal.getCategorybyid(id);
        if (dt.Rows.Count > 0)
        {
            txtcatid.Text = dt.Rows[0]["CatID"].ToString();
            txtcategoryname.Text = dt.Rows[0]["Name"].ToString();
            txttitle.Text= dt.Rows[0]["Title"].ToString();
            txtdesc.Text= dt.Rows[0]["Description"].ToString();
            lblmaincatID.Text= dt.Rows[0]["CatID"].ToString();
            rptredit.Visible = true;
            rptredit.DataSource = dt;
            rptredit.DataBind();
            Image2.Visible = true;
           
         
            imgCurrent1.Visible = false;
            fuImg03.Visible = false;
            fuImg02.Visible = false;
            fuImg01.Visible = false;
            FileUploadedit.Visible = true;
        }
    }

    public void GetNumber()
    {
        DataTable CategoryID = mydal.GetCategoryNo();
        txtcatid.Text = CategoryID.Rows[0][0].ToString();
    }




    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtcatid.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ale", "alert('Please Give CategoryID');", true);
        }
        else
        {
            string[] insert = new string[20];

            insert[0] = txtcatid.Text;
            insert[1] = txtcategoryname.Text;



            bool Save = mydal.InsertCategory(insert);

            ///Image//
            ///






            if (Save == true)
            {

                string CatID = "0";
                DataTable PIDsearch = mydal.SelectMaxCatID();
                if (PIDsearch.Rows.Count > 0)
                {
                    CatID = PIDsearch.Rows[0]["CatID"].ToString();
                }

                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    //Insert and upload Images

                    if (fuImg01.HasFile)
                    {
                        string SavePath = Server.MapPath("~/CategoryImage/") + CatID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);
                        }
                        string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                        fuImg01.SaveAs(SavePath + "\\" + txtcategoryname.Text.ToString().Trim() + "Big" + Extention);
                        SqlCommand cmd3 = new SqlCommand("insert into CategoryImages values('" + CatID + "',N'" + txtcategoryname.Text.ToString().Trim() + "Big" + "','" + Extention + "','580x300','"+txttitle.Text+"','"+txtdesc.Text+"')", con);
                        cmd3.ExecuteNonQuery();
                    }

                    if (fuImg02.HasFile)
                    {
                        string SavePath = Server.MapPath("~/CategoryImage/") + CatID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);
                        }
                        string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                        fuImg02.SaveAs(SavePath + "\\" + txtcategoryname.Text.ToString().Trim() + "Small1" + Extention);


                        SqlCommand cmd4 = new SqlCommand("insert into CategoryImages values('" + CatID + "',N'" + txtcategoryname.Text.ToString().Trim() + "Small1" + "','" + Extention + "','271x150','" + txttitle.Text + "','" + txtdesc.Text + "')", con);
                        cmd4.ExecuteNonQuery();
                    }

                    if (fuImg03.HasFile)
                    {
                        string SavePath = Server.MapPath("~/CategoryImage/") + CatID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);
                        }
                        string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                        fuImg02.SaveAs(SavePath + "\\" + txtcategoryname.Text.ToString().Trim() + "Small2" + Extention);


                        SqlCommand cmd4 = new SqlCommand("insert into CategoryImages values('" + CatID + "',N'" + txtcategoryname.Text.ToString().Trim() + "Small2" + "','" + Extention + "','271x150','" + txttitle.Text + "','" + txtdesc.Text + "')", con);
                        cmd4.ExecuteNonQuery();
                    }

                }

                string strconfirmd = "<script>if(window.confirm('Save Successfull')){window.location.href='AddCategory.aspx'}</script>";
                ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirmd, false);
                txtcategoryname.Text = null;
            }



            //if (fuImg01.HasFile)
            //{

            //    string filejpg = System.IO.Path.GetExtension(fuImg01.FileName);
            //    if (filejpg == ".jpg" || filejpg == ".jpeg" || filejpg == ".png")
            //    {

            //        fuImg01.PostedFile.SaveAs(Server.MapPath("~\\CategoryImage\\" + txtcategoryname.Text + "Big" + filejpg));
            //    }
            //}

            //if (fuImg02.HasFile)
            //{

            //    string filejpg2 = System.IO.Path.GetExtension(fuImg02.FileName);
            //    if (filejpg2 == ".jpg" || filejpg2 == ".jpeg" || filejpg2 == ".png")
            //    {

            //        fuImg02.PostedFile.SaveAs(Server.MapPath("~\\CategoryImage\\" + txtcategoryname.Text + "Small" + filejpg2));
            //    }
            //}




            //ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Submit Successfylly');", true);
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error",
                    "alert('Something wrong please try again');", true);
            }
        }
    }





    protected void btnupdate_Click(object sender, EventArgs e)
    {
        Int64 id = Convert.ToInt64(Request.QueryString["Id"]);
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            if (FileUploadedit.HasFile)
            {
                string SavePath = Server.MapPath("~/CategoryImage/") + lblmaincatID.Text;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extention = Path.GetExtension(FileUploadedit.PostedFile.FileName);
                FileUploadedit.SaveAs(SavePath + "\\" + txtcategoryname.Text.ToString().Trim() + Extention);
                SqlCommand cmd3 = new SqlCommand("update CategoryImages set Name= N'" + txtcategoryname.Text.ToString().Trim() + "', Extention='" + Extention + "' where CatIMGID='" + id + "' ", con);
                cmd3.ExecuteNonQuery();
            }

            SqlCommand cmd4 = new SqlCommand("update CategoryImages set Title='" + txttitle.Text + "',Description='" + txtdesc.Text + "' where CatIMGID='" + id + "' ", con);
            cmd4.ExecuteNonQuery();
        }



        Response.Redirect("ListCategory.aspx");
    }
}