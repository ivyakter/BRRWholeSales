using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_CategoryGridPage : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString.ToString().Contains("CatID"))
            {
                //pagination
                BindRepeater();
                //LoadProductbyCategory();
                LoadAllSubCategory();
                LoadCategoryImagebycatis();
                loadHotBestsellers();
            }
            if (Request.QueryString.ToString().Contains("PName"))
            {
                loadSearchProduct();
                SubcatFoodcupboars();
                SubcatFresh();
                SubcatDrinkandbreverage();
                Subcatdairyandchese();
                SubcatFrozenfood();
                SubcatCookingoilandfat();
                SubcatPackaginganddisposable();
                SubcatHygieneandcleaning();
                LoadCategoryImagebycatis();
                loadHotBestsellers();
            }
            if (Request.QueryString.ToString().Contains("Subcatid"))
            {
                LoadProductbyCategory();
                LoadAllSubCategory();
                LoadCategoryImagebycatis();
                loadHotBestsellers();
            }
            if (Request.QueryString.ToString().Contains("SuperDeals"))
            {
                LoadSuperDeals();
                SubcatFoodcupboars();
                SubcatFresh();
                SubcatDrinkandbreverage();
                Subcatdairyandchese();
                SubcatFrozenfood();
                SubcatCookingoilandfat();
                SubcatPackaginganddisposable();
                SubcatHygieneandcleaning();
                LoadCategoryImagebycatis();
                loadHotBestsellers();
            }
        }
        // lblproduct.Visible = false;
    }

    private void LoadSuperDeals()
    {
        if (Request.QueryString["SuperDeals"] != null)
        {
            DataTable dt = mydal.GetAllSuperDeals();
            if (dt.Rows.Count > 0)
            {
                //Create the PagedDataSource that will be used in paging
                PagedDataSource pgitems = new PagedDataSource();
                pgitems.DataSource = dt.DefaultView;
                pgitems.AllowPaging = true;

                //Control page size from here 
                pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
                pgitems.CurrentPageIndex = PageNumber;
                if (pgitems.PageCount > 1)
                {
                    rptPaging.Visible = true;
                    ArrayList pages = new ArrayList();
                    for (int i = 0; i <= pgitems.PageCount - 1; i++)
                    {
                        pages.Add((i + 1).ToString());
                    }
                    rptPaging.DataSource = pages;
                    rptPaging.DataBind();
                }
                else
                {
                    rptPaging.Visible = false;
                }

                //Finally, set the datasource of the repeater
                rptrFoodcupboardnewarrivals.DataSource = pgitems;
                rptrFoodcupboardnewarrivals.DataBind();
            }
        }
    }

    protected void linkPnlGrid_Click(object sender, EventArgs e)
    {
        pnlGrid.Visible = true;
        pnlList.Visible = false;
        LoadProductbyCategory();
    }

    protected void linkPnlList_Click(object sender, EventArgs e)
    {
        pnlGrid.Visible = false;
        pnlList.Visible = true;
        LoadProductbyCategoryList();
    }

    //pagination
    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
            {
                return Convert.ToInt32(ViewState["PageNumber"]);
            }
            else
            {
                return 0;
            }
        }
        set { ViewState["PageNumber"] = value; }
    }



    private void loadSearchProduct()
    {
        if (Request.QueryString.ToString().Contains("PName"))
        {
            string PName = Request.QueryString["PName"];
            DataTable dt = mydal.GetRelatedProduct1(PName);

            if (dt.Rows.Count > 0)
            {
                //Create the PagedDataSource that will be used in paging
                PagedDataSource pgitems = new PagedDataSource();
                pgitems.DataSource = dt.DefaultView;
                pgitems.AllowPaging = true;

                //Control page size from here 
                pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
                pgitems.CurrentPageIndex = PageNumber;
                if (pgitems.PageCount > 1)
                {
                    rptPaging.Visible = true;
                    ArrayList pages = new ArrayList();
                    for (int i = 0; i <= pgitems.PageCount - 1; i++)
                    {
                        pages.Add((i + 1).ToString());
                    }
                    rptPaging.DataSource = pages;
                    rptPaging.DataBind();
                }
                else
                {
                    rptPaging.Visible = false;
                }
                //Finally, set the datasource of the repeater

                rptrFoodcupboardnewarrivals.DataSource = pgitems;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {
                Panel1.Visible = true;
            }
        }
    }
    //pagination
    private void BindRepeater()
    {
        //Do your database connection stuff and get your data
        if (Request.QueryString["CatID"] != null)
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            if (CatID == "1") { LoadProductbyCategory1(); return; }
            if (CatID == "13") { LoadProductbyCategory2(); return; }

            //save the result in data table
            DataTable dt = mydal.GetProductByCategoryname1(CatID);

            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }

            //Finally, set the datasource of the repeater
            rptrFoodcupboardnewarrivals.DataSource = pgitems;
            rptrFoodcupboardnewarrivals.DataBind();
        }
    }

    //pagination
    protected void rptPaging_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        if (Request.QueryString.ToString().Contains("CatID"))
        {
            BindRepeater();
        }
        if (Request.QueryString.ToString().Contains("Subcatid"))
        {
            LoadProductbyCategory();
        }
        if (Request.QueryString.ToString().Contains("PName"))
        {
            loadSearchProduct();
        }
        if (Request.QueryString.ToString().Contains("SuperDeals"))
        {
            LoadSuperDeals();
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
        GetCategory();
    }

    public void GetCategory()
    {
        DataTable dt = mydal.getCategorybyName(Request.QueryString["CatID"].ToString());
        if (dt.Rows.Count == 0) return;
        lblCatName.Text = dt.Rows[0]["MenuText"].ToString();
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

    protected void LoadProductbyCategory1()
    {
        DataTable dt = mydal.GetAllPopulars();
        if (dt.Rows.Count > 0)
        {
            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            //Finally, set the datasource of the repeater

            rptrFoodcupboardnewarrivals.DataSource = pgitems;
            rptrFoodcupboardnewarrivals.DataBind();
            rptrFoodcupboardnewarrivals.Visible = true;
        }
    }

    protected void LoadProductbyCategory11()
    {
        DataTable dt = mydal.GetAllPopularsNameAsc();
        if (dt.Rows.Count > 0)
        {
            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = 12;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            //Finally, set the datasource of the repeater

            rptrFoodcupboardnewarrivals.DataSource = pgitems;
            rptrFoodcupboardnewarrivals.DataBind();
            rptrFoodcupboardnewarrivals.Visible = true;
        }
    }

    protected void LoadProductbyCategoryDesc()
    {
        DataTable dt = mydal.GetAllPopularsNameDesc();
        if (dt.Rows.Count > 0)
        {
            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = 12;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            //Finally, set the datasource of the repeater

            rptrFoodcupboardnewarrivals.DataSource = pgitems;
            rptrFoodcupboardnewarrivals.DataBind();
            rptrFoodcupboardnewarrivals.Visible = true;
        }
    }

    protected void LoadProductbyCategoryPriceDesc()
    {
        DataTable dt = mydal.GetAllPopularsPriceDesc();
        if (dt.Rows.Count > 0)
        {
            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = 12;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            //Finally, set the datasource of the repeater

            rptrFoodcupboardnewarrivals.DataSource = pgitems;
            rptrFoodcupboardnewarrivals.DataBind();
            rptrFoodcupboardnewarrivals.Visible = true;
        }
    }
    protected void LoadProductbyCategoryPriceAsc()
    {
        DataTable dt = mydal.GetAllPopularsPriceAsc();
        if (dt.Rows.Count > 0)
        {
            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = 12;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            //Finally, set the datasource of the repeater

            rptrFoodcupboardnewarrivals.DataSource = pgitems;
            rptrFoodcupboardnewarrivals.DataBind();
            rptrFoodcupboardnewarrivals.Visible = true;
        }
    }

    protected void LoadProductbyCategory2()
    {
        DataTable dt = mydal.GetAllSuperDeals();
        if (dt.Rows.Count > 0)
        {
            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            //Finally, set the datasource of the repeater

            rptrFoodcupboardnewarrivals.DataSource = pgitems;
            rptrFoodcupboardnewarrivals.DataBind();
            rptrFoodcupboardnewarrivals.Visible = true;
        }
    }

    protected void LoadProductbyCategory21()
    {
        DataTable dt = mydal.GetAllSuperDealsNameAsc();
        if (dt.Rows.Count > 0)
        {
            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            //Finally, set the datasource of the repeater

            rptrFoodcupboardnewarrivals.DataSource = pgitems;
            rptrFoodcupboardnewarrivals.DataBind();
            rptrFoodcupboardnewarrivals.Visible = true;
        }
    }

    protected void LoadProductbyCategory2Desc()
    {
        DataTable dt = mydal.GetAllSuperDealsNameDesc();
        if (dt.Rows.Count > 0)
        {
            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            //Finally, set the datasource of the repeater

            rptrFoodcupboardnewarrivals.DataSource = pgitems;
            rptrFoodcupboardnewarrivals.DataBind();
            rptrFoodcupboardnewarrivals.Visible = true;
        }
    }

    protected void LoadProductbyCategoryPrice2Desc()
    {
        DataTable dt = mydal.GetAllSuperDealsPriceDesc();
        if (dt.Rows.Count > 0)
        {
            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            //Finally, set the datasource of the repeater

            rptrFoodcupboardnewarrivals.DataSource = pgitems;
            rptrFoodcupboardnewarrivals.DataBind();
            rptrFoodcupboardnewarrivals.Visible = true;
        }
    }

    protected void LoadProductbyCategoryPrice2Asc()
    {
        DataTable dt = mydal.GetAllSuperDealsPriceAsc();
        if (dt.Rows.Count > 0)
        {
            //Create the PagedDataSource that will be used in paging
            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            //Finally, set the datasource of the repeater

            rptrFoodcupboardnewarrivals.DataSource = pgitems;
            rptrFoodcupboardnewarrivals.DataBind();
            rptrFoodcupboardnewarrivals.Visible = true;
        }
    }

    protected void LoadProductbyCategory()
    {
        if (Request.QueryString.ToString().Contains("Subcatid") && Request.QueryString.ToString().Contains("catid"))
        {
            string subcatid = Request.QueryString["Subcatid"].ToString();
            string ParentId = Request.QueryString["catid"].ToString();

            lblSubcatid.Text = subcatid;
            lblParentid.Text = ParentId;
            if (Request.QueryString["catid"] != "" && Request.QueryString["Subcatid"] == "")
            {
                var CatID = Request.QueryString["catid"];
                lblcatid.Text = CatID.ToString();

                DataTable dt = mydal.GetProductByCategorynameandSubcategory(CatID, subcatid);
                if (dt.Rows.Count > 0)
                {
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dt.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dtfromsubcat.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {
                    lblproduct.Visible = true;
                }
            }
        }
        //else if (Request.QueryString.ToString().Contains("CatID"))
        //{
        //    var CatID = Request.QueryString["CatID"];
        //    lblcatid.Text = CatID.ToString();

        //    if (CatID == "1") { LoadProductbyCategory1(); return; }
        //    if (CatID == "13") { LoadProductbyCategory2(); return; }

        //    DataTable dt = mydal.GetProductByCategoryname(CatID);
        //    if (dt.Rows.Count > 0)
        //    {
        //        //Create the PagedDataSource that will be used in paging
        //        PagedDataSource pgitems = new PagedDataSource();
        //        pgitems.DataSource = dt.DefaultView;
        //        pgitems.AllowPaging = true;

        //        //Control page size from here 
        //        pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
        //        pgitems.CurrentPageIndex = PageNumber;
        //        if (pgitems.PageCount > 1)
        //        {
        //            rptPaging.Visible = true;
        //            ArrayList pages = new ArrayList();
        //            for (int i = 0; i <= pgitems.PageCount - 1; i++)
        //            {
        //                pages.Add((i + 1).ToString());
        //            }
        //            rptPaging.DataSource = pages;
        //            rptPaging.DataBind();
        //        }
        //        else
        //        {
        //            rptPaging.Visible = false;
        //        }
        //        //Finally, set the datasource of the repeater

        //        rptrFoodcupboardnewarrivals.DataSource = pgitems;
        //        rptrFoodcupboardnewarrivals.DataBind();
        //        rptrFoodcupboardnewarrivals.Visible = true;
        //    }
        //    else
        //    {
        //        lblproduct.Visible = true;
        //    }
        //}
        //else if (Request.QueryString.ToString().Contains("SuperDeals"))
        //{
        //    LoadSuperDeals();
        //}
    }

    protected void LoadProductbyCategoryList()
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
                    rptrList.DataSource = dt;
                    rptrList.DataBind();
                    rptrList.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    rptrList.DataSource = dtfromsubcat;
                    rptrList.DataBind();
                    rptrList.Visible = true;
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
                rptrList.DataSource = dt;
                rptrList.DataBind();
                rptrList.Visible = true;
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
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dt.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dtfromsubcat.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {

                }
            }
        }
        else if (Request.QueryString["CatID"] != null)
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            if (CatID == "1") { LoadProductbyCategory11(); return; }
            if (CatID == "13") { LoadProductbyCategory21(); return; }

            DataTable dt = mydal.GetProductByNameAsc(CatID);
            if (dt.Rows.Count > 0)
            {
                //Create the PagedDataSource that will be used in paging
                PagedDataSource pgitems = new PagedDataSource();
                pgitems.DataSource = dt.DefaultView;
                pgitems.AllowPaging = true;

                //Control page size from here 
                pgitems.PageSize = Convert.ToInt32(ddlFilterByNumber.SelectedValue);
                pgitems.CurrentPageIndex = PageNumber;
                if (pgitems.PageCount > 1)
                {
                    rptPaging.Visible = true;
                    ArrayList pages = new ArrayList();
                    for (int i = 0; i <= pgitems.PageCount - 1; i++)
                    {
                        pages.Add((i + 1).ToString());
                    }
                    rptPaging.DataSource = pages;
                    rptPaging.DataBind();
                }
                else
                {
                    rptPaging.Visible = false;
                }
                //Finally, set the datasource of the repeater

                rptrFoodcupboardnewarrivals.DataSource = pgitems;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {

            }
        }
        else if (Request.QueryString["SuperDeals"] != null)
        {
            LoadProductbyCategory21();
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
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dt.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dtfromsubcat.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {

                }
            }
        }
        else if (Request.QueryString["CatID"] != null)
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            if (CatID == "1") { LoadProductbyCategoryDesc(); return; }
            if (CatID == "13") { LoadProductbyCategory2Desc(); return; }

            DataTable dt = mydal.GetProductByNameDesc(CatID);
            if (dt.Rows.Count > 0)
            {
                //Create the PagedDataSource that will be used in paging
                PagedDataSource pgitems = new PagedDataSource();
                pgitems.DataSource = dt.DefaultView;
                pgitems.AllowPaging = true;

                //Control page size from here 
                pgitems.PageSize = 12;
                pgitems.CurrentPageIndex = PageNumber;
                if (pgitems.PageCount > 1)
                {
                    rptPaging.Visible = true;
                    ArrayList pages = new ArrayList();
                    for (int i = 0; i <= pgitems.PageCount - 1; i++)
                    {
                        pages.Add((i + 1).ToString());
                    }
                    rptPaging.DataSource = pages;
                    rptPaging.DataBind();
                }
                else
                {
                    rptPaging.Visible = false;
                }
                //Finally, set the datasource of the repeater

                rptrFoodcupboardnewarrivals.DataSource = pgitems;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {

            }
        }
        else if (Request.QueryString["SuperDeals"] != null)
        {
            LoadProductbyCategory2Desc();
        }

    }

    protected void LoadProductByPriceHighToLow()
    {
        if (Request.QueryString["Subcatid"] != null || Request.QueryString["ParentId"] != null)
        {
            string subcatid = Request.QueryString["Subcatid"].ToString();
            string ParentId = Request.QueryString["catid"].ToString();

            lblSubcatid.Text = subcatid;
            lblParentid.Text = ParentId;
            if (Request.QueryString["CatID"] != "" && Request.QueryString["Subcatid"] == "" && Request.QueryString["ParentId"] == "")
            {
                var CatID = Request.QueryString["CatID"];
                lblcatid.Text = CatID.ToString();

                DataTable dt = mydal.GetProductByPriceHighToLow(CatID);
                if (dt.Rows.Count > 0)
                {
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dt.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dtfromsubcat.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {

                }
            }
        }
        else if (Request.QueryString["CatID"] != null)
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            if (CatID == "1") { LoadProductbyCategoryPriceDesc(); return; }
            if (CatID == "13") { LoadProductbyCategoryPrice2Desc(); return; }

            DataTable dt = mydal.GetProductByPriceHighToLow(CatID);
            if (dt.Rows.Count > 0)
            {
                //Create the PagedDataSource that will be used in paging
                PagedDataSource pgitems = new PagedDataSource();
                pgitems.DataSource = dt.DefaultView;
                pgitems.AllowPaging = true;

                //Control page size from here 
                pgitems.PageSize = 12;
                pgitems.CurrentPageIndex = PageNumber;
                if (pgitems.PageCount > 1)
                {
                    rptPaging.Visible = true;
                    ArrayList pages = new ArrayList();
                    for (int i = 0; i <= pgitems.PageCount - 1; i++)
                    {
                        pages.Add((i + 1).ToString());
                    }
                    rptPaging.DataSource = pages;
                    rptPaging.DataBind();
                }
                else
                {
                    rptPaging.Visible = false;
                }
                //Finally, set the datasource of the repeater

                rptrFoodcupboardnewarrivals.DataSource = pgitems;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {

            }
        }
        else if (Request.QueryString["SuperDeals"] != null)
        {
            LoadProductbyCategoryPrice2Desc();
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
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dt.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dtfromsubcat.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {

                }
            }
        }
        else if (Request.QueryString["CatID"] != null)
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            if (CatID == "1") { LoadProductbyCategoryPriceAsc(); return; }
            if (CatID == "13") { LoadProductbyCategoryPrice2Asc(); return; }

            DataTable dt = mydal.GetProductByPriceLowToHigh(CatID);
            if (dt.Rows.Count > 0)
            {
                //Create the PagedDataSource that will be used in paging
                PagedDataSource pgitems = new PagedDataSource();
                pgitems.DataSource = dt.DefaultView;
                pgitems.AllowPaging = true;

                //Control page size from here 
                pgitems.PageSize = 12;
                pgitems.CurrentPageIndex = PageNumber;
                if (pgitems.PageCount > 1)
                {
                    rptPaging.Visible = true;
                    ArrayList pages = new ArrayList();
                    for (int i = 0; i <= pgitems.PageCount - 1; i++)
                    {
                        pages.Add((i + 1).ToString());
                    }
                    rptPaging.DataSource = pages;
                    rptPaging.DataBind();
                }
                else
                {
                    rptPaging.Visible = false;
                }
                //Finally, set the datasource of the repeater

                rptrFoodcupboardnewarrivals.DataSource = pgitems;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {

            }
        }
        else if (Request.QueryString["SuperDeals"] != null)
        {
            LoadProductbyCategoryPrice2Asc();
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
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dt.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dtfromsubcat.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {

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
                //Create the PagedDataSource that will be used in paging
                PagedDataSource pgitems = new PagedDataSource();
                pgitems.DataSource = dt.DefaultView;
                pgitems.AllowPaging = true;

                //Control page size from here 
                pgitems.PageSize = 12;
                pgitems.CurrentPageIndex = PageNumber;
                if (pgitems.PageCount > 1)
                {
                    rptPaging.Visible = true;
                    ArrayList pages = new ArrayList();
                    for (int i = 0; i <= pgitems.PageCount - 1; i++)
                    {
                        pages.Add((i + 1).ToString());
                    }
                    rptPaging.DataSource = pages;
                    rptPaging.DataBind();
                }
                else
                {
                    rptPaging.Visible = false;
                }
                //Finally, set the datasource of the repeater

                rptrFoodcupboardnewarrivals.DataSource = pgitems;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {

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
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dt.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dtfromsubcat.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {

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
                //Create the PagedDataSource that will be used in paging
                PagedDataSource pgitems = new PagedDataSource();
                pgitems.DataSource = dt.DefaultView;
                pgitems.AllowPaging = true;

                //Control page size from here 
                pgitems.PageSize = 12;
                pgitems.CurrentPageIndex = PageNumber;
                if (pgitems.PageCount > 1)
                {
                    rptPaging.Visible = true;
                    ArrayList pages = new ArrayList();
                    for (int i = 0; i <= pgitems.PageCount - 1; i++)
                    {
                        pages.Add((i + 1).ToString());
                    }
                    rptPaging.DataSource = pages;
                    rptPaging.DataBind();
                }
                else
                {
                    rptPaging.Visible = false;
                }
                //Finally, set the datasource of the repeater

                rptrFoodcupboardnewarrivals.DataSource = pgitems;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {

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
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dt.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
            }
            else
            {
                DataTable dtfromsubcat = mydal.GetProductByCategorynameandSubcategory(ParentId, subcatid);
                if (dtfromsubcat.Rows.Count > 0)
                {
                    //Create the PagedDataSource that will be used in paging
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dtfromsubcat.DefaultView;
                    pgitems.AllowPaging = true;

                    //Control page size from here 
                    pgitems.PageSize = 12;
                    pgitems.CurrentPageIndex = PageNumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                    //Finally, set the datasource of the repeater

                    rptrFoodcupboardnewarrivals.DataSource = pgitems;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {

                }
            }
        }
        else
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();

            if (CatID == "1") { LoadProductbyCategory1(); return; }
            if (CatID == "13") { LoadProductbyCategory2(); return; }

            DataTable dt = mydal.GetTop48Products(CatID);
            if (dt.Rows.Count > 0)
            {
                //Create the PagedDataSource that will be used in paging
                PagedDataSource pgitems = new PagedDataSource();
                pgitems.DataSource = dt.DefaultView;
                pgitems.AllowPaging = true;

                //Control page size from here 
                pgitems.PageSize = 12;
                pgitems.CurrentPageIndex = PageNumber;
                if (pgitems.PageCount > 1)
                {
                    rptPaging.Visible = true;
                    ArrayList pages = new ArrayList();
                    for (int i = 0; i <= pgitems.PageCount - 1; i++)
                    {
                        pages.Add((i + 1).ToString());
                    }
                    rptPaging.DataSource = pages;
                    rptPaging.DataBind();
                }
                else
                {
                    rptPaging.Visible = false;
                }
                //Finally, set the datasource of the repeater

                rptrFoodcupboardnewarrivals.DataSource = pgitems;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {

            }
        }
    }

    protected void addtocart_ServerClick(object sender, EventArgs e)
    {
        if (Session["Loginfo"] != null)
        {
            if (Session["ShoppingType"] != null)
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

                if (Session["ShoppingType"].ToString() == "Collection")
                {
                    price = ((HiddenField)repeaterval.FindControl("hfCollentionP")).Value;
                }
                else if (Session["ShoppingType"].ToString() == "Delivery")
                {
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

                    MasterPage ms = new MasterPage();
                    Label count = Page.Master.FindControl("lblcount") as Label;
                    Label countsmall = Page.Master.FindControl("lblcountinside") as Label;
                    Label count2 = Page.Master.FindControl("countproduct") as Label;
                    Label counttext = Page.Master.FindControl("lblcounttext") as Label;
                    Label Label2 = Page.Master.FindControl("Label2") as Label;
                    Label Label3 = Page.Master.FindControl("Label3") as Label;

                    count.Text = "(" + createdt.Rows.Count + ")";
                    countsmall.Text = "(" + createdt.Rows.Count + ")";
                    count2.Text = "(" + createdt.Rows.Count + ")";
                    counttext.Text = "(" + createdt.Rows.Count + ")";
                    Label2.Text = "(" + sum + ")";
                    Label3.Text = "(" + sum + ")";
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
                    MasterPage ms = new MasterPage();
                    Label count = Page.Master.FindControl("lblcount") as Label;
                    Label countsmall = Page.Master.FindControl("lblcountinside") as Label;
                    Label count2 = Page.Master.FindControl("countproduct") as Label;
                    Label counttext = Page.Master.FindControl("lblcounttext") as Label;
                    Label Label2 = Page.Master.FindControl("Label2") as Label;
                    Label Label3 = Page.Master.FindControl("Label3") as Label;

                    count.Text = "(" + quantity + ")";
                    countsmall.Text = "(" + quantity + ")";
                    count2.Text = "(" + quantity + ")";
                    counttext.Text = "(" + quantity + ")";
                    Label2.Text = "(" + sum + ")";
                    Label3.Text = "(" + sum + ")";


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
    protected void rptrMain_ItemDataBound1(object sender, RepeaterItemEventArgs e)
    {
        if (string.IsNullOrEmpty(Session["ShoppingType"] as string))
        {
            return;
        }
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
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
    protected void Allsuperdeals_Click(object sender, EventArgs e)
    {
        Response.Redirect("CategoryGridPage.aspx?SuperDeals=1");
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
        //if (ddlFilterByNumber.SelectedValue == "0")
        //{
        //    LoadTop12Products();
        //}
        //else if (ddlFilterByNumber.SelectedValue == "1")
        //{
        //    LoadTop24Products();
        //}
        //else if (ddlFilterByNumber.SelectedValue == "2")
        //{
        //    LoadTop48Products();
        //}

        if (Request.QueryString.ToString().Contains("CatID"))
        {
            BindRepeater();
        }
        if (Request.QueryString.ToString().Contains("Subcatid"))
        {
            LoadProductbyCategory();
        }
        if (Request.QueryString.ToString().Contains("PName"))
        {
            loadSearchProduct();
        }
        if (Request.QueryString.ToString().Contains("SuperDeals"))
        {
            LoadSuperDeals();
        }

    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        string a = "0";
        string b = "0";
        if (txtnumber1.Text != "" || txtnumber2.Text != "")
        {
            a = txtnumber1.Text;
            b = txtnumber2.Text;
        }
        LoadFilterProducts(a, b);
    }


    protected void LoadFilterProducts(string a, string b)
    {
        if (Request.QueryString["CatID"] != null)
        {
            var CatID = Request.QueryString["CatID"];
            lblcatid.Text = CatID.ToString();
            if (CatID == "1")
            {
                DataTable dt1 = mydal.GetFilterProducts1(CatID, a, b);
                if (dt1.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dt1;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {
                    lblproduct.Visible = true;
                    rptrFoodcupboardnewarrivals.DataSource = null;
                    rptrFoodcupboardnewarrivals.DataBind();
                }
                return;
            }
            if (CatID == "13")
            {
                DataTable dt2 = mydal.GetFilterProducts13(CatID, a, b);
                if (dt2.Rows.Count > 0)
                {
                    rptrFoodcupboardnewarrivals.DataSource = dt2;
                    rptrFoodcupboardnewarrivals.DataBind();
                    rptrFoodcupboardnewarrivals.Visible = true;
                }
                else
                {
                    lblproduct.Visible = true;
                    rptrFoodcupboardnewarrivals.DataSource = null;
                    rptrFoodcupboardnewarrivals.DataBind();
                }
                return;
            }

            DataTable dt = mydal.GetFilterProducts(CatID, a, b);
            if (dt.Rows.Count > 0)
            {
                rptrFoodcupboardnewarrivals.DataSource = dt;
                rptrFoodcupboardnewarrivals.DataBind();
                rptrFoodcupboardnewarrivals.Visible = true;
            }
            else
            {
                lblproduct.Visible = true;
                rptrFoodcupboardnewarrivals.DataSource = null;
                rptrFoodcupboardnewarrivals.DataBind();
            }
        }
    }

}