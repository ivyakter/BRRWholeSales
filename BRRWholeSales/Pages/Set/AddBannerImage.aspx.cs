using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_AddBannerImage : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["DBcon"].ConnectionString;
    SqlConnection con = new SqlConnection();
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //GetNumber();

            btnSave.Visible = true;

        }
    }




    //public void GetNumber()
    //{
    //    DataTable BrandID = mydal.GetImageNo();
    //    txtimageid.Text = BrandID.Rows[0][0].ToString();
    //}



    protected void btnSave_Click(object sender, EventArgs e)
    {
        //string[] insert = new string[20];
        //insert[0] = txtimagename.Text;
        //insert[1] = txtimagedesctop.Text;
        //insert[2] = txtimagedescbottom.Text;

        //bool IsSuccess = mydal.insertsliderimage(insert);

        //if (IsSuccess == true)
        //{
        //    string ID = "0";
        //    DataTable PIDsearch = mydal.SelectSliderimageMaxID();
        //    if (PIDsearch.Rows.Count > 0)
        //    {
        //        ID = PIDsearch.Rows[0]["ID"].ToString();
        //    }

        //        if (fuImg01.HasFile)
        //        {
        //            string SavePath = Server.MapPath("~/SliderImage/") + ID;
        //            if (!Directory.Exists(SavePath))
        //            {
        //                Directory.CreateDirectory(SavePath);
        //            }
        //            string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
        //            fuImg01.SaveAs(SavePath + "\\" + txtimagename.Text.ToString().Trim() + "01" + Extention);

        //            bool updateimage = mydal.UpdateImage(Extention, ID, txtimagename.Text);

        //        }

        //}

        if (fuImg01.HasFile)
        {

            string filejpg = System.IO.Path.GetExtension(fuImg01.FileName);
            if (filejpg == ".jpg")
            {

                fuImg01.PostedFile.SaveAs(Server.MapPath("~\\HeaderBanner\\" + txtposition.Text + filejpg));
            }
            else
            {
                string strconfirmd1 = "<script>if(window.confirm('Only .jpg Format Is Allowed')){window.location.href='AddBannerImage.aspx'}</script>";
                ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirmd1, false);
            }
        }
        clear();

        string strconfirmd = "<script>if(window.confirm('Save Successfull')){window.location.href='AddBannerImage.aspx'}</script>";
        ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirmd, false);
    }

    private void clear()
    {
        txtposition.Text = "";
        //txtimagedesctop.Text = "";
        //txtimagedescbottom.Text = "";
    }

    protected void btnshowhide_Click(object sender, EventArgs e)
    {
        if (ddlbannershowhide.SelectedValue=="select")
        {
            string strconfirmd = "<script>if(window.confirm('Please Select Show Or Hide')){window.location.href='AddBannerImage.aspx'}</script>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirmd, false);
        }
        else
        {
            bool insertBannerShowhide = mydal.insertBannerShowhide(ddlbannershowhide.SelectedValue);
        }
    }
}