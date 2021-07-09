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

public partial class Pages_Set_EditProduct : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["DBcon"].ConnectionString;
    SqlConnection con = new SqlConnection();

    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetOrderedforEdit();
        }
    }

    private void GetOrderedforEdit()
    {
        DataTable dt = mydal.GetProductforEdit();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetOrderedforEdit();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string[] insert = new string[20];
            insert[0] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPID")).Text;
            insert[1] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPName")).Text;
            insert[2] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPPrice")).Text;
            insert[3] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPSelPrice")).Text;
            //insert[4] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPDescription")).Text;
            //insert[5] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPProductDetails")).Text;
            insert[8] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtUnit")).Text;
            insert[9] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtcollprice")).Text;
            insert[10] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtOccation")).Text;
            insert[11] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtOccationDesc")).Text;
            insert[12] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtOccationRemain")).Text;

            bool Edit = mydal.EditProduct(insert);



            string Pname = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblNamefromtblimage")).Text;
            string PID = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPID")).Text;
            string lblPIMGID = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblPIMGID")).Text;
            FileUpload fu = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");


            if (fu.HasFile)
            {
                string SavePath = Server.MapPath("~/ProductImage/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extention = Path.GetExtension(fu.PostedFile.FileName);
                fu.SaveAs(SavePath + "\\" + Pname.ToString() + Extention);

                bool updatephoto = mydal.updatephoto(PID, Pname, Extention, lblPIMGID);



            }
            GridView1.EditIndex = -1;
            GetOrderedforEdit();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }


    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetOrderedforEdit();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            Repeater rprt = (Repeater)e.Row.FindControl("rprt");
            HiddenField hfCateId = (HiddenField)e.Row.FindControl("hfId");
            ////DataTable dt = new DAL().GetImageformImagetable(hfCateId.Value);
            DataTable dt = new DAL().GetImageformImagetable1(hfCateId.Value);
            if (dt.Rows.Count > 0)
            {
                rprt.DataSource = dt;
                rprt.DataBind();
            }
        }



        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{


        //}
    }
    
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        GetOrderedforEdit();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdDelete")
        {
            //string uid = Session["Uname"].ToString();
            string ProductID = e.CommandArgument.ToString();

            bool deletefromtblproduct = mydal.DeleteProduct(ProductID);
            //bool deletefrombarcode = mydal.DeleteProductformbarcode(ProductID);

            // fro deleting the directory folder too 
            //we need to delete all the files inside the directory folder too . 

            string path = Server.MapPath("~/ProductImage/") + ProductID;
            string[] files = Directory.GetFiles(path, "*", SearchOption.AllDirectories);
            foreach (string file in files)
            {
                File.Delete(file);
            }
            //then delete folder
            Directory.Delete(path);


            bool deletefromprdImage = mydal.deletefromPrdImage(ProductID);

            if (deletefromtblproduct == true && deletefromprdImage == true)
            {
                string strconfirm = "<script>if(window.confirm('Deleting Successfull')){window.location.href='EditProduct.aspx'}</script>";

                ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Something wrong please try again');", true);

            }
            GetOrderedforEdit();
        }
    }
    protected void txtproductname_TextChanged(object sender, EventArgs e)
    {
        //DataTable dt = mydal.searchproductbyname(txtproductname.Text);
        DataTable dt = mydal.searchproductbyCode(txtproductname.Text);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            GetOrderedforEdit();
        }
    }
    
}