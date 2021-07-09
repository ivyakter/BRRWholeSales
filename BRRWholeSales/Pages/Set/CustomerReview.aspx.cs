using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_CustomerReview : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            ShowInfo();
        }
    }

    protected void ShowInfo()
    {
        DataTable dt = mydal.GetCustomerReview();
        addGrid.DataSource = dt;
        addGrid.DataBind();


    }

    protected void addGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        addGrid.PageIndex = e.NewPageIndex;
        addGrid.DataBind();
        ShowInfo();
    }

    protected void addGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdDelete")
        {
            string ID = e.CommandArgument.ToString();
            mydal.DeleteCustomerReview(ID);
            ShowInfo();
        }
    }


    protected void txtCustomerSearch_TextChanged(object sender, EventArgs e)
    {
        DataTable dt = mydal.GetCustomerreviewByEmail(txtCustomerSearch.Text);
        if (dt.Rows.Count > 0)
        {
            addGrid.DataSource = dt;
            addGrid.DataBind();
        }
        else
        {
            ShowInfo();
        }
    }
}