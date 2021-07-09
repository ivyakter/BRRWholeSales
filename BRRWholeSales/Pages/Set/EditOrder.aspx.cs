using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class Pages_Set_EditOrder : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Load();
            LoadipAddress();
        }
    }

    private void Load()
    {
        if (Request.QueryString["ID"] != null)
        {
            string id = Request.QueryString["ID"].ToString();
            string orderId = Request.QueryString["OrderId"].ToString();
            DataTable dt = mydal.GetCustomerOrder(id, orderId);
            DataTable dt2 = mydal.GetCustomerInfo(id);
            if (dt.Rows.Count > 0 && dt2.Rows.Count > 0)
            {
                txtOrderId.Text = orderId;
                txtOrderId2.Text = orderId;
                txtOrderType.Text = dt.Rows[0]["ShoppingType"].ToString();
                txtDeliveryDate.Text = dt.Rows[0]["DeliveyDate"].ToString();
                txtOrderDate.Text = dt.Rows[0]["Date"].ToString().Split(' ')[0];
                if (dt2.Rows.Count == 0) { return; }
                txtName.Text = dt2.Rows[0]["FirstName"].ToString();
                txtEmail.Text = dt2.Rows[0]["Email"].ToString();
                txtContectNo.Text = dt2.Rows[0]["Phone"].ToString();
                txtShippingAddress.Text = dt2.Rows[0]["HouseNo"].ToString() + ", " + dt2.Rows[0]["Address"].ToString() + ", " + dt2.Rows[0]["Country"].ToString() + ", " + dt2.Rows[0]["PostCode"].ToString() + ". ";
                txtBillingAddress.Text = dt2.Rows[0]["HouseNo"].ToString() + ", " + dt2.Rows[0]["Address"].ToString() + ", " + dt2.Rows[0]["Country"].ToString() + ", " + dt2.Rows[0]["PostCode"].ToString() + ". ";
                txtNote.Value = dt.Rows[0]["Note"].ToString();
                ddlStatus2.SelectedItem.Text = dt.Rows[0]["Status"].ToString();
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
    private void LoadipAddress()
    {
        string userip = Request.UserHostAddress;
        if (Request.UserHostAddress != null)
        {
            Int64 macinfo = new Int64();
            string macsrc = macinfo.ToString("X");
            if (macsrc == "0")
            {
                if (userip == "127.0.0.1")
                {
                    //ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('Visited Localhost')", true);
                    txtCustomerIP.Text = userip;
                }
                else
                {
                    txtCustomerIP.Text = userip;
                }
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["ID"].ToString();
        string orderId = Request.QueryString["OrderId"].ToString();
        string status = ddlStatus2.SelectedItem.Text;
        string billingAddress = txtBillingAddress.Text;
        string note = txtNote.Value;
        bool updateStatus = mydal.UpdateCustomerStatus(id, orderId, status, billingAddress, note);

        if (updateStatus)
        {
            string url = "~/Pages/Set/EditOrder.aspx?ID="+id+" &OrderId="+orderId+"";
            Response.Redirect(url);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Message", "alert('Something Wrong! Try again!')", true);
        }
    }
    decimal totalVat = 0;
    decimal totalNet = 0;
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            totalVat += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Vat"));
            totalNet += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Total"));

            Label lblPrice = (Label)e.Row.FindControl("lblPrice");
            Label lblNetAmount = (Label)e.Row.FindControl("lblNetAmount");
            decimal price = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Price"));
            lblPrice.Text = price.ToString();
           // lblNetAmount.Text = totalNet.ToString();
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lvlVat = (Label)e.Row.FindControl("lvlVat");
            lvlVat.Text = totalVat.ToString();
            Label lvlNet = (Label)e.Row.FindControl("lvlNet");
            lvlNet.Text = totalNet.ToString();
            Label lvlPaid = (Label)e.Row.FindControl("lvlPaid");
            lvlPaid.Text = (totalVat + totalNet).ToString();
        }
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string url = "../Report/OrderDetails.aspx?OrderID="+ Request.QueryString["OrderId"] ;
        //Response.Redirect(url);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('"+url+"','_newtab');", true);
    }
}