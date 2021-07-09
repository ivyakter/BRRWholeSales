using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_EmailSubcription : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSubcriptionEmail();

        }
    }

    protected void LoadSubcriptionEmail()
    {
        DataTable dt = mydal.LoadSubcriptionEmail();
        if (dt.Rows.Count>0)
        {
            GvEmail.DataSource = dt;
            GvEmail.DataBind();
        }
    }

    protected void GvEmail_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

 
}