using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Report_Orders : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadOrders();
        }
    }

    protected void LoadOrders()
    {

        DataTable dt = mydal.getAllCustomersOrder();
        if (dt.Rows.Count > 0)
        {
            GvExistingOrder.DataSource = dt;
            GvExistingOrder.DataBind();
        }
    }
    protected void Display(object sender, EventArgs e)
    {

        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GvExistingOrder.Rows[rowIndex];

       string OrderID = (row.FindControl("lblorder") as Label).Text;

        var url = String.Format("OrderDetails.aspx?OrderID={0}", OrderID);
        //var url = String.Format("OrderDetails.html?OrderID={0}", OrderID);
        Response.Redirect(url);

        //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
    }







    protected void GvExistingOrder_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvExistingOrder.PageIndex = e.NewPageIndex;
        GvExistingOrder.DataBind();
        LoadOrders();
    }
}