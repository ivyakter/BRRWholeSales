using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_ListBrand : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getBrand();
        }
    }
    protected void getBrand()
    {
        DataTable dt = mydal.getBrand();
        gv.DataSource = dt;
        gv.DataBind();
    }


    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        gv.DataBind();
        getBrand();
    }
    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void gv_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gv.EditIndex = e.NewEditIndex;
        getBrand();
    }
    protected void gv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gv.EditIndex = -1;
        getBrand(); 

    }
    protected void gv_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string[] insert = new string[10];
            insert[0] = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtbid")).Text;
            insert[1] = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtbrandname")).Text;
        

            bool Edit = mydal.EditBrand(insert);



            string Pname = ((Label)gv.Rows[e.RowIndex].FindControl("lblNamefromtblimage")).Text;
            string BID = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtbid")).Text;
            string lblPIMGID = ((Label)gv.Rows[e.RowIndex].FindControl("lblPIMGID")).Text;
            FileUpload fu = (FileUpload)gv.Rows[e.RowIndex].FindControl("FileUpload1");


            if (fu.HasFile)
            {
                string SavePath = Server.MapPath("~/BrandImage/") + BID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extention = Path.GetExtension(fu.PostedFile.FileName);
                fu.SaveAs(SavePath + "\\" + Pname.ToString() + Extention);

                bool updatephoto = mydal.updatephoto(BID, Pname, Extention, lblPIMGID);



            }
            gv.EditIndex = -1;
            getBrand(); 
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdDelete")
        {
            //string uid = Session["Uname"].ToString();
            string ProductID = e.CommandArgument.ToString();

            bool deletefromtblproduct = mydal.DeleteBrand(ProductID);
            //bool deletefrombarcode = mydal.DeleteProductformbarcode(ProductID);

            // fro deleting the directory folder too 
            //we need to delete all the files inside the directory folder too . 

            string path = Server.MapPath("~/BrandImage/") + ProductID;
            string[] files = Directory.GetFiles(path, "*", SearchOption.AllDirectories);
            foreach (string file in files)
            {
                File.Delete(file);
            }
            //then delete folder
            Directory.Delete(path);


            bool deletefromprdImage = mydal.deletefromBrandImage(ProductID);

            if (deletefromtblproduct == true && deletefromprdImage == true)
            {
                string strconfirm = "<script>if(window.confirm('Deleting Successfull')){window.location.href='ListBrand.aspx'}</script>";

                ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Something wrong please try again');", true);

            }
            getBrand(); 
        }
    }
}