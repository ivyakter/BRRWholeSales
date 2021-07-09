using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Report_OrderDetails : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["OrderID"] != null)
            {
                LoadOrderByOrderID();
                LoadOrderDetailsByOrderID();
            }
            else
            {
                string strconfirm = "<script>if(window.confirm('Sorry There Is No Record For This Order')){window.location.href='Orders.aspx'}</script>";

                ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);
            }
        }
    }


    protected void LoadOrderByOrderID()
    {
       string orderNo =  Request.QueryString["OrderID"].ToString();
        DataTable OrderID = mydal.LoadOrderByOrderID(orderNo);

        if (OrderID.Rows.Count>0)
        {
            GvExistingOrder.DataSource = OrderID;
            GvExistingOrder.DataBind();
        }

    }

    protected void LoadOrderDetailsByOrderID()
    {
        string orderNo = Request.QueryString["OrderID"].ToString();
        DataTable details = mydal.LoadOrderByOrderID(orderNo);

        if (details.Rows.Count > 0)
        {
            //rptr1.DataSource = OrderID;
            //rptr1.DataBind();

            lblorderdetails.Text = orderNo;
            lbladdress.Text = details.Rows[0]["Address"].ToString();
            lbladdress2.Text= details.Rows[0]["Address"].ToString();
            lblemail.Text= details.Rows[0]["Email"].ToString();
            lblcreateddate.Text= details.Rows[0]["Date"].ToString();
            lblphone.Text= details.Rows[0]["Phone"].ToString();
        }

    }



    protected void ddlaction_SelectedIndexChanged(object sender, EventArgs e)
    {
        string orderNo = Request.QueryString["OrderID"].ToString();

        bool updateAction = mydal.UpdateAction(ddlaction.SelectedItem.Text, orderNo);

        if (updateAction == true)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Update Success');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Something Went Wrong');", true);
        }
    }
    double total1 = 0;
    double total2 = 0;
    protected void GvExistingOrder_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            var lblAmount = e.Row.FindControl("lblAmount") as Label;

            if (lblAmount != null)
            {
                total1 += double.Parse(lblAmount.Text);
            }
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblAmountTotal = (Label)e.Row.FindControl("lblAmountTotal");

            lblAmountTotal.Text = total1.ToString();

            //lblAmountTotal.Text = lblAmountTotal.Text;
        }
    }
}