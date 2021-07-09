using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Pages_Set_CustomerOrder : System.Web.UI.Page
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
        DataTable dt = mydal.GetCustomerOrder();
        addGrid.DataSource = dt;
        addGrid.DataBind();
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        DataTable dt = mydal.GetCustomerOrder();
        string id = dt.Rows[0]["Id"].ToString();

        DataTable delete = mydal.DeleteCustomerOrder(id);
        ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Customer Information update');", true);
    }
    protected void txtproductname_TextChanged(object sender, EventArgs e)
    {
        //DataTable dt = mydal.searchproductbyname(txtproductname.Text);
       // DataTable dt = mydal.searchproductbyCode(txtproductname.Text);
        DataTable dt = mydal.GetCustomerOrder(txtOrderId.Text, txtEmail.Text);
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
            mydal.DeleteOrderInfo(ID);
            ShowInfo();
        }
    }
}