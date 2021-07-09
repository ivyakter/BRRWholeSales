using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_OfferTitleSet : System.Web.UI.Page
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
        DataTable Size = mydal.GetTitle();
        txttitleId.Text = Size.Rows[0][0].ToString();
    }


    private void getProblembyid()
    {
        Int64 id = Convert.ToInt64(Request.QueryString["ID"]);
        DataTable dt = mydal.getTitlebyid(id);
        if (dt.Rows.Count > 0)
        {
            txttitleId.Text = dt.Rows[0]["ID"].ToString();
            txttitle.Text = dt.Rows[0]["Title"].ToString();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txttitleId.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ale", "alert('There Is No Size ID');", true);
        }
        else
        {
            string[] insert = new string[10];

            insert[1] = txttitleId.Text;
            insert[2] = txttitle.Text;

            bool Save = mydal.InsertTitle(insert);

            if (Save == true)
            {
                string strconfirm = "<script>if(window.confirm('Adding Successfull')){window.location.href='OfferTitleSet.aspx'}</script>";
                ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);
                txttitleId.Text = null;
                txttitle.Text = null;
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
        string title = txttitle.Text;
        bool update = mydal.UpdateTitle(id, title);
        Response.Redirect("Listtitle.aspx");

    }
}