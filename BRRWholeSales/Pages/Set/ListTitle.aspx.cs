using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_ListTitle : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getTitleList();
        }
    }
    protected void getTitleList()
    {
        DataTable dt = mydal.getTitleSetList();
        gv.DataSource = dt;
        gv.DataBind();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            Button lnkbtn = sender as Button;
            GridViewRow row = lnkbtn.NamingContainer as GridViewRow;
            Label lblid = (Label)row.Cells[2].FindControl("lblid");

            bool delete = mydal.TitleSetDeletebyid(lblid.Text);
            getTitleList();
        }
        catch (Exception ex)
        { }

    }

    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        gv.DataBind();
        getTitleList();
    }
}