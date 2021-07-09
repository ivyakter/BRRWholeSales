using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_quick_view : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["PID"] != null)
            {
                loadSingleImagebyPID();
                loadthreeImagebyPID();
                loadProductInfobyPID();
            }

        }
    }

    public void loadSingleImagebyPID()
    {
        int PID =Convert.ToInt32(Request.QueryString["PID"]);

        DataTable dt = mydal.GetProductByPIDsingleimage(PID);
        if (dt.Rows.Count > 0)
        {
            rptrsingleimage.DataSource = dt;
            rptrsingleimage.DataBind();
            rptrsingleimage.Visible = true;

           
        }
    }

    public void loadthreeImagebyPID()
    {
        string PID = Request.QueryString["PID"];

        DataTable dt = mydal.GetProductByPIDthreeimage(PID);
        if (dt.Rows.Count > 0)
        {
            rptrthreeimage.DataSource = dt;
            rptrthreeimage.DataBind();
            rptrthreeimage.Visible = true;

            //rptrsidebar.DataSource = dt;
            //rptrsidebar.DataBind();
            //rptrsidebar.Visible = true;
        }
    }



    public void loadProductInfobyPID()
    {
        string PID = Request.QueryString["PID"];

        DataTable dt = mydal.GetProductInfoByPID(PID);
        if (dt.Rows.Count > 0)
        {
            rptrproductinfo.DataSource = dt;
            rptrproductinfo.DataBind();
            rptrproductinfo.Visible = true;
            lblProductcode.Text = dt.Rows[0]["ProductCode"].ToString();
            lblproductname.Text= dt.Rows[0]["PName"].ToString();
            
        }
    }
  
    protected void rptrproductinfo_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        string PID = Request.QueryString["PID"];
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rptrBrandimage = (Repeater)e.Item.FindControl("rptrBrandimage");
            //HiddenField hfCateId = (HiddenField)e.Item.FindControl("hfCateId");
            DataTable dt = new DAL().GetBrandimage(PID);
            if (dt.Rows.Count > 0)
            {
                rptrBrandimage.DataSource = dt;
                rptrBrandimage.DataBind();
            }
            DataTable dt1 = mydal.GetProductInfoByPID(PID);
            if (dt1.Rows.Count > 0)
            {
                Label lblInstock = (Label)e.Item.FindControl("lblInstock");
                if (dt1.Rows[0]["Quantity"].ToString() != "0")
                {
                    lblInstock.Text = "In Stock";
                }
                else
                {
                    lblInstock.Text = "Out of Stock";
                }
            }

            if (!string.IsNullOrEmpty(Session["ShoppingType"] as string))
            {
                string a = Session["ShoppingType"].ToString();
                if (Request.QueryString["ShoppingType"] == "Collection" || Session["ShoppingType"].ToString() == "Collection")
                {
                    Label lblDel = (Label)e.Item.FindControl("lvlDel");
                    lblDel.Visible = false;
                }
                else if (Request.QueryString["ShoppingType"] == "Delivery" || Session["ShoppingType"].ToString() == "Delivery")
                {
                    Label lblCol = (Label)e.Item.FindControl("lvlCol");
                    lblCol.Visible = false;
                }
            }
        }
    }

    protected void btnaddtocart_Click(object sender, EventArgs e)
    {
        if (Session["Loginfo"] != null)
        {
            Button btbag = sender as Button;

            if (Session["ShoppingType"] != null)
            {

                RepeaterItem repeaterval = btbag.NamingContainer as RepeaterItem;

                string pid = ((HiddenField)repeaterval.FindControl("hfPId")).Value;
                string pname = ((HiddenField)repeaterval.FindControl("hfname")).Value;
                string price = ((HiddenField)repeaterval.FindControl("hfprice")).Value;
                //string size = ((RadioButtonList)repeaterval.FindControl("rblSize")).SelectedItem.Text;
                string Barcode = ((HiddenField)repeaterval.FindControl("hfproductid")).Value;
                string Imagename = ((HiddenField)repeaterval.FindControl("hfimagename")).Value;
                string Imageextension = ((HiddenField)repeaterval.FindControl("hfimageExtesion")).Value;
                string hfvatamount = ((HiddenField)repeaterval.FindControl("hfvatamount")).Value;

                if (Session["ShoppingType"].ToString() == "Collection")
                {
                    //Label lblDel = (Label)repeaterval.FindControl("lvlDel");
                    price = ((HiddenField)repeaterval.FindControl("hfCollentionP")).Value;
                }
                else if (Session["ShoppingType"].ToString() == "Delivery ")
                {
                    //Label lblCol = (Label)repeaterval.FindControl("lvlCol");
                    price = ((HiddenField)repeaterval.FindControl("hfprice")).Value;
                }

                int quantity = 1;
                double sum = 0;

                DataTable dt = (DataTable)Session["shoppingcart"];

                if (Session["shoppingcart"] == null)
                {
                    //create the datatable
                    DataTable createdt = new DataTable();
                    createdt.Columns.Add("pid", typeof(string));


                    createdt.Columns.Add("pname", typeof(string));
                    createdt.Columns.Add("quantity", typeof(int));
                    createdt.Columns.Add("price", typeof(double));
                    //createdt.Columns.Add("size", typeof(string));
                    createdt.Columns.Add("Barcode", typeof(string));
                    createdt.Columns.Add("Imagename", typeof(string));
                    createdt.Columns.Add("Imageextension", typeof(string));
                    createdt.Columns.Add("hfvatamount", typeof(double));
                    createdt.Columns.Add("total", typeof(double));


                    //Store first row
                    DataRow row = createdt.NewRow();
                    row["pid"] = pid;
                    row["pname"] = pname;
                    row["quantity"] = quantity;
                    row["price"] = price;
                    row["Barcode"] = Barcode;
                    row["Imagename"] = Imagename;
                    row["Imageextension"] = Imageextension;
                    row["hfvatamount"] = hfvatamount;
                    row["total"] = quantity * double.Parse(price);


                    createdt.Rows.Add(row);
                    Session["shoppingcart"] = createdt;
                    sum = Convert.ToDouble(row["total"]);

                    //MasterPage ms = new MasterPage();
                    //Label count = Page.Master.FindControl("lblcount") as Label;
                    //Label countsmall = Page.Master.FindControl("lblcountinside") as Label;
                    //Label count2 = Page.Master.FindControl("countproduct") as Label;
                    //Label counttext = Page.Master.FindControl("lblcounttext") as Label;
                    //Label Label2 = Page.Master.FindControl("Label2") as Label;
                    //Label Label3 = Page.Master.FindControl("Label3") as Label;

                    //count.Text = "(" + createdt.Rows.Count + ")";
                    //countsmall.Text = "(" + createdt.Rows.Count + ")";
                    //count2.Text = "(" + createdt.Rows.Count + ")";
                    //counttext.Text = "(" + createdt.Rows.Count + ")";
                    //Label2.Text = "(" + sum + ")";
                    //Label3.Text = "(" + sum + ")";
                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    bool exist = false;
                    int a = 0;
                    DataRow foundProductId = dt.Select("pid ='" + pid + "'").FirstOrDefault();
                    if (foundProductId != null)
                    {
                        a = Convert.ToInt32(foundProductId["quantity"].ToString());
                        foundProductId["quantity"] = a + 1;
                        foundProductId["total"] = (a + 1) * double.Parse(price);
                        exist = true;
                    }
                    if (exist != true)
                    {
                        DataRow row = dt.NewRow();
                        row["pid"] = pid;
                        row["pname"] = pname;
                        row["quantity"] = a + quantity;
                        row["price"] = price;
                        row["Barcode"] = Barcode;
                        row["Imagename"] = Imagename;
                        row["Imageextension"] = Imageextension;
                        row["hfvatamount"] = hfvatamount;
                        row["total"] = (a + quantity) * double.Parse(price);
                        dt.Rows.Add(row);
                    }
                    Session["shoppingcart"] = dt;

                    foreach (DataRow dr in dt.Rows)
                    {
                        sum += Convert.ToDouble(dr["total"]);
                        quantity += Convert.ToInt32(dr["quantity"]);
                    }
                    quantity = quantity - 1;
                    //MasterPage ms = new MasterPage();
                    //Label count = Page.Master.FindControl("lblcount") as Label;
                    //Label countsmall = Page.Master.FindControl("lblcountinside") as Label;
                    //Label count2 = Page.Master.FindControl("countproduct") as Label;
                    //Label counttext = Page.Master.FindControl("lblcounttext") as Label;
                    //Label Label2 = Page.Master.FindControl("Label2") as Label;
                    //Label Label3 = Page.Master.FindControl("Label3") as Label;

                    //count.Text = "(" + quantity + ")";
                    //countsmall.Text = "(" + quantity + ")";
                    //count2.Text = "(" + quantity + ")";
                    //counttext.Text = "(" + quantity + ")";
                    //Label2.Text = "(" + sum + ")";
                    //Label3.Text = "(" + sum + ")";

                    Response.Redirect(Request.RawUrl);
                }
            }
            else
            {
                string strconfirm = "<script>if(window.confirm('Select your shopping type first')){window.location.href='MyAccount/MyAccount.aspx'}</script>";
                ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);
                
            }
        }
        else
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('You Need To Login First');", true);

        }
    }
}