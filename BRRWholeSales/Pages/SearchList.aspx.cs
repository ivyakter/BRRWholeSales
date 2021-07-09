using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ProductDetails : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["PName"] != null)
            {
                lblhiddenPID.Text = Request.QueryString["PName"].ToString();
                loadHotDeals();
                loadHotBestsellers();
                LoadRelatedProduct();
            }
        }
    }

    protected void LoadRelatedProduct()
    {
        string PName = Request.QueryString["PName"];
        DataTable dt = mydal.GetRelatedProduct1(PName);
        if (dt.Rows.Count > 0)
        {
            rptrrelatedproduct.DataSource = dt;
            rptrrelatedproduct.DataBind();
            rptrrelatedproduct.Visible = true;
        }
    }

    public void loadHotDeals()
    {
        DataTable dt = mydal.GetHotDealsProduct();
        if (dt.Rows.Count > 0)
        {
            rptrHotdealsProducts.DataSource = dt;
            foreach (RepeaterItem ri in rptrHotdealsProducts.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrHotdealsProducts.DataBind();
            rptrHotdealsProducts.Visible = true;
        }
    }

    protected void Allsuperdeals_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pages/SuperDealsGrid.aspx");
    }
    public void loadHotBestsellers()
    {
        DataTable dt = mydal.GetHotBestSeller();
        if (dt.Rows.Count > 0)
        {
            rptrHotbestsellersProducts.DataSource = dt;

            foreach (RepeaterItem ri in rptrHotbestsellersProducts.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }

            }
            rptrHotbestsellersProducts.DataBind();
            rptrHotbestsellersProducts.Visible = true;
        }
    }
    protected void addtocart_Click(object sender, EventArgs e)
    {
        if (Session["Loginfo"] != null)
        {
            LinkButton btbag = sender as LinkButton;
            RepeaterItem repeaterval = btbag.NamingContainer as RepeaterItem;

            string pid = ((HiddenField)repeaterval.FindControl("hfPId")).Value;
            string pname = ((HiddenField)repeaterval.FindControl("hfname")).Value;
            string price = ((HiddenField)repeaterval.FindControl("hfprice")).Value;
            //string size = ((RadioButtonList)repeaterval.FindControl("rblSize")).SelectedItem.Text;
            string Barcode = ((HiddenField)repeaterval.FindControl("hfproductid")).Value;
            string Imagename = ((HiddenField)repeaterval.FindControl("hfimagename")).Value;
            string Imageextension = ((HiddenField)repeaterval.FindControl("hfimageExtesion")).Value;
            string hfvatamount = ((HiddenField)repeaterval.FindControl("hfvatamount")).Value;

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

                MasterPage ms = new MasterPage();
                Label count = Page.Master.FindControl("lblcount") as Label;
                Label countsmall = Page.Master.FindControl("lblcountinside") as Label;
                Label count2 = Page.Master.FindControl("countproduct") as Label;
                Label counttext = Page.Master.FindControl("lblcounttext") as Label;
                count.Text = "(" + createdt.Rows.Count + ")";
                countsmall.Text = "(" + createdt.Rows.Count + ")";
                count2.Text = "(" + createdt.Rows.Count + ")";
                counttext.Text = "(" + createdt.Rows.Count + ")";
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
                }
                MasterPage ms = new MasterPage();
                Label count = Page.Master.FindControl("lblcount") as Label;
                Label countsmall = Page.Master.FindControl("lblcountinside") as Label;
                Label count2 = Page.Master.FindControl("countproduct") as Label;
                Label counttext = Page.Master.FindControl("lblcounttext") as Label;


                count.Text = "(" + dt.Rows.Count + ")";
                countsmall.Text = "(" + dt.Rows.Count + ")";
                count2.Text = "(" + dt.Rows.Count + ")";
                counttext.Text = "(" + dt.Rows.Count + ")";
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('You Need To Login First');", true);
        }
    }

}