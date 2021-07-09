using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_PublicMaster : System.Web.UI.MasterPage
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMenu();
        
        }
    }
    private void LoadMenu()
    {
        DataTable dt = new DAL().GetMenuData();
        rptrcategory.DataSource = dt;
        rptrcategory.DataBind();

    }
}
