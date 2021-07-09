using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_CategoryPage : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadProductbyCategory();
            LoadAllSubCategory();
            LoadCategoryImagebycatis();
        }
    }

    protected void LoadAllSubCategory()
    {
        SubcatFoodcupboars();
        SubcatFresh();
        SubcatDrinkandbreverage();
        Subcatdairyandchese();
        SubcatFrozenfood();
        SubcatCookingoilandfat();
        SubcatPackaginganddisposable();
        SubcatHygieneandcleaning();
    }

    protected void LoadCategoryImagebycatis()
    {
        var CatID = Request.QueryString["CatID"];
        DataTable LoadBigImageinCategorypage = mydal.LoadBigImageinCategorypage(CatID);
        if (LoadBigImageinCategorypage.Rows.Count > 0)
        {
            LoadBigImageinCategory.DataSource = LoadBigImageinCategorypage;
            LoadBigImageinCategory.DataBind();
            LoadBigImageinCategory.Visible = true;
        }
    }

    protected void LoadProductbyCategory()
    {
        if (Request.QueryString["Subcatid"] != null && Request.QueryString["ParentId"] != null)
        {
            string subcatid = Request.QueryString["Subcatid"].ToString();
            string ParentId = Request.QueryString["ParentId"].ToString();

            lblSubcatid.Text = subcatid;
            lblParentid.Text = ParentId;

            if (Request.QueryString["CatID"] != "" && Request.QueryString["Subcatid"] == "" && Request.QueryString["ParentId"] == "")
            {
                var CatID = Request.QueryString["CatID"];
                lblcatid.Text = CatID.ToString();

                DataTable dt = mydal.GetProductByCategoryname(CatID);
                if (dt.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dt;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dtfromsubcat;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {
                    lblproduct.Visible = true;
                }
            }
        }
        else
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            DataTable dt = mydal.GetProductByCategoryname(CatID);
            if (dt.Rows.Count > 0)
            {
                rptrFoodcupboardnewarrivals.DataSource = dt;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {
                lblproduct.Visible = true;
            }
        }
    }

    protected void LoadProductByNameAsc()
    {
        if (Request.QueryString["Subcatid"] != null && Request.QueryString["ParentId"] != null)
        {
            string subcatid = Request.QueryString["Subcatid"].ToString();
            string ParentId = Request.QueryString["ParentId"].ToString();

            lblSubcatid.Text = subcatid;
            lblParentid.Text = ParentId;
            if (Request.QueryString["CatID"] != "" && Request.QueryString["Subcatid"] == "" && Request.QueryString["ParentId"] == "")
            {
                var CatID = Request.QueryString["CatID"];
                lblcatid.Text = CatID.ToString();

                DataTable dt = mydal.GetProductByNameAsc(CatID);
                if (dt.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dt;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dtfromsubcat;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {
                    lblproduct.Visible = true;
                }
            }
        }
        else
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            DataTable dt = mydal.GetProductByNameAsc(CatID);
            if (dt.Rows.Count > 0)
            {
                rptrFoodcupboardnewarrivals.DataSource = dt;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {
                lblproduct.Visible = true;
            }
        }

    }

    protected void LoadProductByNameDesc()
    {
        if (Request.QueryString["Subcatid"] != null && Request.QueryString["ParentId"] != null)
        {
            string subcatid = Request.QueryString["Subcatid"].ToString();
            string ParentId = Request.QueryString["ParentId"].ToString();

            lblSubcatid.Text = subcatid;
            lblParentid.Text = ParentId;
            if (Request.QueryString["CatID"] != "" && Request.QueryString["Subcatid"] == "" && Request.QueryString["ParentId"] == "")
            {
                var CatID = Request.QueryString["CatID"];
                lblcatid.Text = CatID.ToString();

                DataTable dt = mydal.GetProductByNameDesc(CatID);
                if (dt.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dt;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dtfromsubcat;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {
                    lblproduct.Visible = true;
                }
            }
        }
        else
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            DataTable dt = mydal.GetProductByNameDesc(CatID);
            if (dt.Rows.Count > 0)
            {
                rptrFoodcupboardnewarrivals.DataSource = dt;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {
                lblproduct.Visible = true;
            }
        }

    }

    protected void LoadProductByPriceHighToLow()
    {
        if (Request.QueryString["Subcatid"] != null && Request.QueryString["ParentId"] != null)
        {
            string subcatid = Request.QueryString["Subcatid"].ToString();
            string ParentId = Request.QueryString["ParentId"].ToString();

            lblSubcatid.Text = subcatid;
            lblParentid.Text = ParentId;
            if (Request.QueryString["CatID"] != "" && Request.QueryString["Subcatid"] == "" && Request.QueryString["ParentId"] == "")
            {
                var CatID = Request.QueryString["CatID"];
                lblcatid.Text = CatID.ToString();

                DataTable dt = mydal.GetProductByPriceHighToLow(CatID);
                if (dt.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dt;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dtfromsubcat;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {
                    lblproduct.Visible = true;
                }
            }
        }
        else
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            DataTable dt = mydal.GetProductByPriceHighToLow(CatID);
            if (dt.Rows.Count > 0)
            {
                rptrFoodcupboardnewarrivals.DataSource = dt;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {
                lblproduct.Visible = true;
            }
        }

    }

    protected void LoadProductByPriceLowToHigh()
    {
        if (Request.QueryString["Subcatid"] != null && Request.QueryString["ParentId"] != null)
        {
            string subcatid = Request.QueryString["Subcatid"].ToString();
            string ParentId = Request.QueryString["ParentId"].ToString();

            lblSubcatid.Text = subcatid;
            lblParentid.Text = ParentId;
            if (Request.QueryString["CatID"] != "" && Request.QueryString["Subcatid"] == "" && Request.QueryString["ParentId"] == "")
            {
                var CatID = Request.QueryString["CatID"];
                lblcatid.Text = CatID.ToString();

                DataTable dt = mydal.GetProductByPriceLowToHigh(CatID);
                if (dt.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dt;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dtfromsubcat;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {
                    lblproduct.Visible = true;
                }
            }
        }
        else
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            DataTable dt = mydal.GetProductByPriceLowToHigh(CatID);
            if (dt.Rows.Count > 0)
            {
                rptrFoodcupboardnewarrivals.DataSource = dt;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {
                lblproduct.Visible = true;
            }
        }

    }

    protected void LoadTop12Products()
    {
        if (Request.QueryString["Subcatid"] != null && Request.QueryString["ParentId"] != null)
        {
            string subcatid = Request.QueryString["Subcatid"].ToString();
            string ParentId = Request.QueryString["ParentId"].ToString();

            lblSubcatid.Text = subcatid;
            lblParentid.Text = ParentId;
            if (Request.QueryString["CatID"] != "" && Request.QueryString["Subcatid"] == "" && Request.QueryString["ParentId"] == "")
            {
                var CatID = Request.QueryString["CatID"];
                lblcatid.Text = CatID.ToString();

                DataTable dt = mydal.GetTop12Products(CatID);
                if (dt.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dt;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dtfromsubcat;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {
                    lblproduct.Visible = true;
                }
            }
        }
        else
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            DataTable dt = mydal.GetTop12Products(CatID);
            if (dt.Rows.Count > 0)
            {
                rptrFoodcupboardnewarrivals.DataSource = dt;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {
                lblproduct.Visible = true;
            }
        }
    }

    protected void LoadTop24Products()
    {
        if (Request.QueryString["Subcatid"] != null && Request.QueryString["ParentId"] != null)
        {
            string subcatid = Request.QueryString["Subcatid"].ToString();
            string ParentId = Request.QueryString["ParentId"].ToString();

            lblSubcatid.Text = subcatid;
            lblParentid.Text = ParentId;
            if (Request.QueryString["CatID"] != "" && Request.QueryString["Subcatid"] == "" && Request.QueryString["ParentId"] == "")
            {
                var CatID = Request.QueryString["CatID"];
                lblcatid.Text = CatID.ToString();

                DataTable dt = mydal.GetTop24Products(CatID);
                if (dt.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dt;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dtfromsubcat;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {
                    lblproduct.Visible = true;
                }
            }
        }
        else
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            DataTable dt = mydal.GetTop24Products(CatID);
            if (dt.Rows.Count > 0)
            {
                rptrFoodcupboardnewarrivals.DataSource = dt;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {
                lblproduct.Visible = true;
            }
        }
    }

    protected void LoadTop48Products()
    {
        if (Request.QueryString["Subcatid"] != null && Request.QueryString["ParentId"] != null)
        {
            string subcatid = Request.QueryString["Subcatid"].ToString();
            string ParentId = Request.QueryString["ParentId"].ToString();

            lblSubcatid.Text = subcatid;
            lblParentid.Text = ParentId;
            if (Request.QueryString["CatID"] != "" && Request.QueryString["Subcatid"] == "" && Request.QueryString["ParentId"] == "")
            {
                var CatID = Request.QueryString["CatID"];
                lblcatid.Text = CatID.ToString();

                DataTable dt = mydal.GetTop48Products(CatID);
                if (dt.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dt;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dtfromsubcat;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {
                    lblproduct.Visible = true;
                }
            }
        }
        else
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            DataTable dt = mydal.GetTop48Products(CatID);
            if (dt.Rows.Count > 0)
            {
                rptrFoodcupboardnewarrivals.DataSource = dt;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {
                lblproduct.Visible = true;
            }
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

    private void SubcatFoodcupboars()
    {
        DataTable dt = mydal.GetSubcatFoodandcipboard();
        if (dt.Rows.Count > 0)
        {
            rptrSubCateFoodcupboard.DataSource = dt;
            rptrSubCateFoodcupboard.DataBind();
        }
    }
    private void SubcatFresh()
    {
        DataTable dt = mydal.GetSubcatFresh();
        if (dt.Rows.Count > 0)
        {
            rptrforFresh.DataSource = dt;
            rptrforFresh.DataBind();
        }
    }
    private void SubcatDrinkandbreverage()
    {
        DataTable dt = mydal.GetSubcatdrinkandbreverage();
        if (dt.Rows.Count > 0)
        {
            rptrdrinkandbreverage.DataSource = dt;
            rptrdrinkandbreverage.DataBind();
        }
    }
    private void Subcatdairyandchese()
    {
        DataTable dt = mydal.GetSubcatdairyandchese();
        if (dt.Rows.Count > 0)
        {
            rptrdairyandchese.DataSource = dt;
            rptrdairyandchese.DataBind();
        }
    }
    private void SubcatFrozenfood()
    {
        DataTable dt = mydal.GetSubcatFrozenfood();
        if (dt.Rows.Count > 0)
        {
            rptrfrozenfood.DataSource = dt;
            rptrfrozenfood.DataBind();
        }
    }

    private void SubcatCookingoilandfat()
    {
        DataTable dt = mydal.GetSubcatCookingoilandfat();
        if (dt.Rows.Count > 0)
        {
            rptrcookingoilandfat.DataSource = dt;
            rptrcookingoilandfat.DataBind();
        }
    }

    private void SubcatPackaginganddisposable()
    {
        DataTable dt = mydal.GetSubcatPackaginganddisposable();
        if (dt.Rows.Count > 0)
        {
            rptrpackaginganddisposable.DataSource = dt;
            rptrpackaginganddisposable.DataBind();
        }
    }

    private void SubcatHygieneandcleaning()
    {
        DataTable dt = mydal.GetSubcatHygieneandcleaning();
        if (dt.Rows.Count > 0)
        {
            rptrhygieneandcleaning.DataSource = dt;
            rptrhygieneandcleaning.DataBind();
        }
    }

    protected void ddlOrderBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlOrderBy.SelectedValue == "0")
        {
            btnA2Z.Visible = true;
            btnZ2A.Visible = true;
            btnH2L.Visible = false;
            btnL2H.Visible = false;
        }
        else if (ddlOrderBy.SelectedValue == "1")
        {
            btnA2Z.Visible = false;
            btnZ2A.Visible = false;
            btnH2L.Visible = true;
            btnL2H.Visible = true;
        }
    }

    protected void btnA2Z_Click(object sender, EventArgs e)
    {
        LoadProductByNameAsc();
    }

    protected void btnZ2A_Click(object sender, EventArgs e)
    {
        LoadProductByNameDesc();
    }

    protected void btnH2L_Click(object sender, EventArgs e)
    {
        LoadProductByPriceHighToLow();
    }

    protected void btnL2H_Click(object sender, EventArgs e)
    {
        LoadProductByPriceLowToHigh();
    }

    protected void ddlFilterByNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlFilterByNumber.SelectedValue == "0")
        {
            LoadTop12Products();
        }
        else if (ddlFilterByNumber.SelectedValue == "1")
        {
            LoadTop24Products();
        }
        else if (ddlFilterByNumber.SelectedValue == "2")
        {
            LoadTop48Products();
        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        string a = lvlnumber1.Text;
        string b = lvlnumber2.Text;
    }
}