using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_ListCustomerForAdmin : System.Web.UI.Page
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
        DataTable dt = mydal.GetCustomerInfo();
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
            mydal.DeleteCustomerInfo(ID);
            ShowInfo();
        }
    }

    protected void addGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        addGrid.EditIndex = -1;
        ShowInfo();
    }

    protected void addGrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        addGrid.EditIndex = e.NewEditIndex;
        ShowInfo();
    }

    protected void addGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string[] insert = new string[10];
            insert[0] = ((TextBox)addGrid.Rows[e.RowIndex].FindControl("txtpostcode")).Text;
            insert[1] = ((TextBox)addGrid.Rows[e.RowIndex].FindControl("txtemail")).Text;
            insert[2] = ((TextBox)addGrid.Rows[e.RowIndex].FindControl("txtPassword")).Text;
            insert[3] = ((TextBox)addGrid.Rows[e.RowIndex].FindControl("txtPhone")).Text;
            insert[4] = ((Label)addGrid.Rows[e.RowIndex].FindControl("lblid")).Text;
            bool Edit = mydal.EditCustomer(insert);

            addGrid.EditIndex = -1;
            ShowInfo();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void txtCustomerSearch_TextChanged(object sender, EventArgs e)
    {
        DataTable dt = mydal.GetCustomerInfoByEmail(txtCustomerSearch.Text);
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