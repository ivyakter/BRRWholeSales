using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_AddSize : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                getProblembyid();
                btnupdate.Visible = true;
                btnSave.Visible = false;
            }
            else
            {
                GetNumber();
                btnupdate.Visible = false;
                btnSave.Visible = true;
            }
        }
    }

    public void GetNumber()
    {
        DataTable Size = mydal.GetSizeNo();
        txtsizeid.Text = "Size/" + Size.Rows[0][0].ToString();
    }


    private void getProblembyid()
    {
        Int64 id = Convert.ToInt64(Request.QueryString["ID"]);
        DataTable dt = mydal.getSizebyid(id);
        if (dt.Rows.Count > 0)
        {
            txtsizeid.Text = dt.Rows[0]["SizeID"].ToString();
            txtsizename.Text = dt.Rows[0]["SizeName"].ToString();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtsizeid.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ale", "alert('There Is No Size ID');", true);
        }
        else
        {
            string[] insert = new string[10];

            insert[1] = txtsizeid.Text;
            insert[2] = txtsizename.Text;

            bool Save = mydal.InsertSizes(insert);

            if (Save == true)
            {
                          
                txtsizeid.Text = null;
                txtsizename.Text = null;
                string strconfirmd = "<script>if(window.confirm('Save Successfull')){window.location.href='AddSize.aspx'}</script>";
                ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirmd, false);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error",
                    "alert('Something wrong please try again');", true);
            }
        }

    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        Int64 id = Convert.ToInt64(Request.QueryString["ID"]);      
        string Sizename = txtsizename.Text;
        bool update = mydal.UpdateSizeList(id, Sizename);
        Response.Redirect("ListSize.aspx");

    }
}