using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Loggenin"] != null)
            {
                if (Request.QueryString["Date1"] == "0")
                {
                    DataTable tt = (DataTable)Session["shoppingcart"];
                }
                else
                {
                    Session["shoppingcart"] = Request.QueryString["product"];
                    Session["shoppingcart"] = Request.QueryString["SelectedProducts"];
                }

                lblloigin.Text = Request.QueryString["Loggenin"];

                Session["Loginfo"] = Request.QueryString["Loggenin"];

                DataTable dt = mydal.selectinfocustomer1(lblloigin.Text);
                if (dt.Rows.Count > 0)
                    Session["Passwords"] = dt.Rows[0]["Password"].ToString();

                //Session["Passwords"] = Request.QueryString["Passwords"];
                //Session["Passwords"] = Application["Passwords"].ToString();
                Session["Date"] = Request.QueryString["Date"];

                Session["ShoppingType"] = Request.QueryString["ShoppingType"];

                Session["Timeslot"] = Request.QueryString["Timeslot"];
            }
            LoadMenu();
            LoadSubcategory();
            LoadHotProducts();
            LoadProductbySubCategory();
            loadSuperDeals();
            LoadOfferTitle();
            LoadSliderdetails();
        }
    }
    protected void LoadSliderdetails()
    {
        DataTable Firstslider = mydal.getFirstSliderdetails();
        if (Firstslider.Rows.Count > 0)
        {
            firstslidertitle.Text = Firstslider.Rows[0]["Title"].ToString();
            firstsliderdetails.Text = Firstslider.Rows[0]["Description"].ToString();
        }

        DataTable Secondslider = mydal.getSecondSliderdetails();
        if (Secondslider.Rows.Count > 0)
        {
            secondslidertitle.Text = Secondslider.Rows[0]["Title"].ToString();
            secondsliderdetails.Text = Secondslider.Rows[0]["Description"].ToString();
        }

        DataTable thirdslider = mydal.getThirdSliderdetails();
        if (thirdslider.Rows.Count > 0)
        {
            thirdslidertitle.Text = thirdslider.Rows[0]["Title"].ToString();
            thirdsliderdetails.Text = thirdslider.Rows[0]["Description"].ToString();
        }

        DataTable Fourthslider = mydal.getFourthSliderdetails();
        if (thirdslider.Rows.Count > 0)
        {
            fourthslidertitle.Text = Fourthslider.Rows[0]["Title"].ToString();
            fourthsliderdetails.Text = Fourthslider.Rows[0]["Description"].ToString();
        }

        DataTable Fifthslider = mydal.getFifthSliderdetails();
        if (thirdslider.Rows.Count > 0)
        {
            fifthslidertitle.Text = Fifthslider.Rows[0]["Title"].ToString();
            fifthsliderdetails.Text = Fifthslider.Rows[0]["Description"].ToString();
        }

    }


    protected void LoadOfferTitle()
    {

        DataTable dt = mydal.getTitleSetList();
        if (dt.Rows.Count > 0)
        {

            lblOffer.Text = dt.Rows[0]["Title"].ToString();
        }

    }

    public void LoadSubcategory()
    {
        SubcatFoodcupboars();
        SubcatFresh();
        SubcatDrinkandbreverage();
        Subcatdairyandchese();
        SubcatPackagingandDisposal();
        SubcatFrozenfood();

    }

    public void LoadHotProducts()
    {
        loadHotNewArrival();
        loadHotBestsellers();
        loadHotDeals();
    }

    private void LoadMenu()
    {
        DataTable dt = new DAL().GetMenuData();
        rptrMain.DataSource = dt;
        rptrMain.DataBind();

    }


    protected void rptrMain_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rptrSubCate = (Repeater)e.Item.FindControl("rptrSubCate");
            HiddenField hfCateId = (HiddenField)e.Item.FindControl("hfCateId");
            DataTable dt = new DAL().GetMenuData(hfCateId.Value);
            if (dt.Rows.Count > 0)
            {
                rptrSubCate.DataSource = dt;
                rptrSubCate.DataBind();
            }
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
            //if (Request.QueryString["ShoppingType"] == null) return;
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

    private void SubcatFoodcupboars()
    {
        DataTable dt = mydal.GetSubcatFoodandcipboard();
        if (dt.Rows.Count > 0)
        {
            rptrSubCateFoodcupboard.DataSource = dt;
            rptrSubCateFoodcupboard.DataBind();
        }

        //DataTable FooterSubcatFoodandcipboard = mydal.FooterSubcatFoodandcipboard();
        //if (FooterSubcatFoodandcipboard.Rows.Count > 0)
        //{
        //    rptrsubcatfoodcupboard.DataSource = FooterSubcatFoodandcipboard;
        //    rptrsubcatfoodcupboard.DataBind();
        //}

    }

    private void SubcatFresh()
    {
        DataTable dt = mydal.GetSubcatFresh();
        if (dt.Rows.Count > 0)
        {
            rptrforFresh.DataSource = dt;
            rptrforFresh.DataBind();
        }

        //DataTable FooterSubcatFresh = mydal.FooterSubcatFresh();
        //if (FooterSubcatFresh.Rows.Count > 0)
        //{
        //    rptrsubcatfresh.DataSource = FooterSubcatFresh;
        //    rptrsubcatfresh.DataBind();
        //}

    }

    private void SubcatDrinkandbreverage()
    {
        DataTable dt = mydal.GetSubcatdrinkandbreverage();
        if (dt.Rows.Count > 0)
        {
            rptrdrinkandbreverage.DataSource = dt;
            rptrdrinkandbreverage.DataBind();
        }

        //DataTable FooterSubcatdrinkandbreverage = mydal.FooterSubcatdrinkandbreverage();
        //if (FooterSubcatdrinkandbreverage.Rows.Count > 0)
        //{
        //    rptrsubcatdrink.DataSource = FooterSubcatdrinkandbreverage;
        //    rptrsubcatdrink.DataBind();
        //}
    }

    private void Subcatdairyandchese()
    {
        DataTable dt = mydal.GetSubcatdairyandchese();
        if (dt.Rows.Count > 0)
        {
            rptrdairyandchese.DataSource = dt;
            rptrdairyandchese.DataBind();
        }

        //DataTable FooterSubcatdairyandchese = mydal.FooterSubcatdairyandchese();
        //if (dt.Rows.Count > 0)
        //{
        //    rptrsubcardairyandcheese.DataSource = FooterSubcatdairyandchese;
        //    rptrsubcardairyandcheese.DataBind();
        //}
    }

    private void SubcatFrozenfood()
    {
        DataTable dt = mydal.GetSubcatFrozenfood();
        if (dt.Rows.Count > 0)
        {
            rptrfrozenfood.DataSource = dt;
            rptrfrozenfood.DataBind();
        }

        //DataTable FooterSubcatFrozenfood = mydal.FooterSubcatFrozenfood();
        //if (FooterSubcatFrozenfood.Rows.Count > 0)
        //{
        //    rptrfrozensubcat.DataSource = FooterSubcatFrozenfood;
        //    rptrfrozensubcat.DataBind();
        //}

    }

    private void SubcatPackagingandDisposal()
    {
        DataTable dt = mydal.GetSubcatPackaginganddisposal();
        if (dt.Rows.Count > 0)
        {
            rptrpacaginganddisposal.DataSource = dt;
            rptrpacaginganddisposal.DataBind();
        }
    }

    public void loadHotNewArrival()
    {
        DataTable dt = mydal.GetHotNewArrival();
        if (dt.Rows.Count > 0)
        {
            rptrHotnewarrivalProducts.DataSource = dt;


            foreach (RepeaterItem ri in rptrHotnewarrivalProducts.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrHotnewarrivalProducts.DataBind();
            rptrHotnewarrivalProducts.Visible = true;
        }
    }


    public void loadSuperDeals()
    {
        DataTable dt = mydal.GetSuperDeals();
        if (dt.Rows.Count > 0)
        {
            rptrsuperdeals.DataSource = dt;


            foreach (RepeaterItem ri in rptrsuperdeals.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                string Collectionoldprice = dt.Rows[0]["CollectionOldPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Label Collectionoldpricer = (Label)ri.FindControl("Collectionoldprice");
                    Deliveryoldpricer.Visible = false;
                    Collectionoldpricer.Visible = false;
                }
                if (Request.QueryString["ShoppingType"] == "Collection")
                {
                    Label lblDel = (Label)ri.FindControl("lblDel");
                    lblDel.Visible = false;

                }
                else if (Request.QueryString["ShoppingType"] == "Delivery")
                {
                    Label lblCol = (Label)ri.FindControl("lblCol");
                    lblCol.Visible = false;
                }
            }
            rptrsuperdeals.DataBind();
            rptrsuperdeals.Visible = true;
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

    public void LoadProductbySubCategory()
    {
        loadFoodandCupboardNewArrival();
        loadFoodandCupboardBestsellers();
        loadFoodandCupboardDeals();
        loadFreshNewArrival();
        loadFreshBestsellers();
        loadFreshDeals();
        loadDrinkandbrevageNewArrival();
        loadDrinkandbrevageBestsellers();
        loadDrinkandbrevageDeals();
        loadDairyandCheeseNewArrival();
        loadDairyandCheeseBestsellers();
        loadDairyandCheeseDeals();
        loadFrozenNewArrival();
        loadFrozenBestsellers();
        loadFrozenDeals();
        loadpackaginganddisposalNewArrival();
        loadpackaginganddisposalBestsellers();
        loadpackaginganddisposalDeals();
    }

    /// <summary>
    /// ///////Food And Cupboard
    /// </summary>

    public void loadFoodandCupboardNewArrival()
    {
        DataTable dt = mydal.GetFoodcupboardNewArrival();
        if (dt.Rows.Count > 0)
        {
            rptrFoodcupboardnewarrivals.DataSource = dt;

            foreach (RepeaterItem ri in rptrFoodcupboardnewarrivals.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }

            }
            rptrFoodcupboardnewarrivals.DataBind();
            rptrFoodcupboardnewarrivals.Visible = true;
        }

        DataTable foodcupboardimage = mydal.foodcupboardbannerimage();
        if (foodcupboardimage.Rows.Count > 0)
        {
            rptrfoodcupboardimage.DataSource = foodcupboardimage;
            rptrfoodcupboardimage.DataBind();
            rptrfoodcupboardimage.Visible = true;
        }

        DataTable foodcupboardthumbimage = mydal.foodcupboardthumbimage();
        if (foodcupboardthumbimage.Rows.Count > 0)
        {
            rptrfoodcupboardthumbimage.DataSource = foodcupboardthumbimage;
            rptrfoodcupboardthumbimage.DataBind();
            rptrfoodcupboardthumbimage.Visible = true;
        }


    }

    public void loadFoodandCupboardBestsellers()
    {
        DataTable dt = mydal.GetFoodAndCupbordBestsellers();
        if (dt.Rows.Count > 0)
        {
            rptrFoodcupboardbestsellers.DataSource = dt;

            foreach (RepeaterItem ri in rptrFoodcupboardbestsellers.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }

            }
            rptrFoodcupboardbestsellers.DataBind();
            rptrFoodcupboardbestsellers.Visible = true;
        }
    }

    public void loadFoodandCupboardDeals()
    {
        DataTable dt = mydal.GetFoodAndCupbordDeal();
        if (dt.Rows.Count > 0)
        {
            rptrFoodcupboarddeals.DataSource = dt;
            foreach (RepeaterItem ri in rptrFoodcupboarddeals.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }

            }
            rptrFoodcupboarddeals.DataBind();
            rptrFoodcupboarddeals.Visible = true;
        }
    }
    /// <summary>
    /// ///Fresh Food ///
    /// </summary>
    public void loadFreshNewArrival()
    {
        DataTable dt = mydal.GetFreshNewArrival();
        if (dt.Rows.Count > 0)
        {
            rptrFreshnewarrivalproduct.DataSource = dt;
            foreach (RepeaterItem ri in rptrFreshnewarrivalproduct.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }

            }
            rptrFreshnewarrivalproduct.DataBind();
            rptrFreshnewarrivalproduct.Visible = true;
        }

        DataTable Freshbannerimage = mydal.Freshbannerimage();
        if (Freshbannerimage.Rows.Count > 0)
        {
            rptrfresgbannerimage.DataSource = Freshbannerimage;
            rptrfresgbannerimage.DataBind();
            rptrfresgbannerimage.Visible = true;
        }

        DataTable freshthumbimage = mydal.freshthumbimage();
        if (freshthumbimage.Rows.Count > 0)
        {
            rptrfresgthumbimage.DataSource = freshthumbimage;
            rptrfresgthumbimage.DataBind();
            rptrfresgthumbimage.Visible = true;
        }
    }

    public void loadFreshBestsellers()
    {
        DataTable dt = mydal.GetFreshBestSellers();
        if (dt.Rows.Count > 0)
        {
            rptrFreshbestsellersproduct.DataSource = dt;
            foreach (RepeaterItem ri in rptrFreshbestsellersproduct.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }

            }
            rptrFreshbestsellersproduct.DataBind();
            rptrFreshbestsellersproduct.Visible = true;
        }
    }

    public void loadFreshDeals()
    {
        DataTable dt = mydal.GetFreshDeal();
        if (dt.Rows.Count > 0)
        {
            rptrFreshdealsproduct.DataSource = dt;
            foreach (RepeaterItem ri in rptrFreshdealsproduct.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }

            }
            rptrFreshdealsproduct.DataBind();
            rptrFreshdealsproduct.Visible = true;
        }
    }
    /// <summary>
    /// //////Drink And Beverage  /////
    /// </summary>
    public void loadDrinkandbrevageNewArrival()
    {
        DataTable dt = mydal.GetDrinkandBraverazeNewArrival();
        if (dt.Rows.Count > 0)
        {
            rptrdrinkandbrevaragebestnewarrivals.DataSource = dt;
            foreach (RepeaterItem ri in rptrdrinkandbrevaragebestnewarrivals.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }

            }
            rptrdrinkandbrevaragebestnewarrivals.DataBind();
            rptrdrinkandbrevaragebestnewarrivals.Visible = true;
        }

        DataTable DrinkandBreveragebannerimage = mydal.DrinkandBreveragebannerimage();
        if (DrinkandBreveragebannerimage.Rows.Count > 0)
        {
            rptrdrinkandbreveragebanner.DataSource = DrinkandBreveragebannerimage;
            rptrdrinkandbreveragebanner.DataBind();
            rptrdrinkandbreveragebanner.Visible = true;
        }

        DataTable Drinkthumbimage = mydal.Drinkthumbimage();
        if (Drinkthumbimage.Rows.Count > 0)
        {
            rptrdrinkandthumpimage.DataSource = Drinkthumbimage;
            rptrdrinkandthumpimage.DataBind();
            rptrdrinkandthumpimage.Visible = true;
        }
    }

    public void loadDrinkandbrevageBestsellers()
    {
        DataTable dt = mydal.GetDrinkAndBraverageBestsellers();
        if (dt.Rows.Count > 0)
        {
            rptrdrinkandbrevaragebestsells.DataSource = dt;
            foreach (RepeaterItem ri in rptrdrinkandbrevaragebestsells.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }

            }
            rptrdrinkandbrevaragebestsells.DataBind();
            rptrdrinkandbrevaragebestsells.Visible = true;
        }
    }

    public void loadDrinkandbrevageDeals()
    {
        DataTable dt = mydal.GetDrinkAndBraverageDeals();
        if (dt.Rows.Count > 0)
        {
            rptrdrinkandbrevaragedeals.DataSource = dt;
            foreach (RepeaterItem ri in rptrdrinkandbrevaragedeals.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrdrinkandbrevaragedeals.DataBind();
            rptrdrinkandbrevaragedeals.Visible = true;
        }
    }

    /// <summary>
    /// ////////Dairy And Cheese /////
    /// </summary>
    public void loadDairyandCheeseNewArrival()
    {
        DataTable dt = mydal.GetDairyandCheeseNewArrival();
        if (dt.Rows.Count > 0)
        {
            rptrdairyandcheesenewarrival.DataSource = dt;
            foreach (RepeaterItem ri in rptrdairyandcheesenewarrival.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrdairyandcheesenewarrival.DataBind();
            rptrdairyandcheesenewarrival.Visible = true;
        }

        DataTable Dairyandcheesebannerimage = mydal.Dairyandcheesebannerimage();
        if (Dairyandcheesebannerimage.Rows.Count > 0)
        {
            rptrdairyandcheese.DataSource = Dairyandcheesebannerimage;
            rptrdairyandcheese.DataBind();
            rptrdairyandcheese.Visible = true;
        }

        DataTable Dairyandcheesethumbimage = mydal.Dairyandcheesethumbimage();
        if (Dairyandcheesethumbimage.Rows.Count > 0)
        {
            rptrdairyandcheesethumbimage.DataSource = Dairyandcheesethumbimage;
            rptrdairyandcheesethumbimage.DataBind();
            rptrdairyandcheesethumbimage.Visible = true;
        }

    }

    public void loadDairyandCheeseBestsellers()
    {
        DataTable dt = mydal.GetDairyandCheeseBestSellers();
        if (dt.Rows.Count > 0)
        {
            rptrdairyandcheesebestsells.DataSource = dt;
            foreach (RepeaterItem ri in rptrdairyandcheesebestsells.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrdairyandcheesebestsells.DataBind();
            rptrdairyandcheesebestsells.Visible = true;
        }
    }

    public void loadDairyandCheeseDeals()
    {
        DataTable dt = mydal.GetDairyandCheeseDeals();
        if (dt.Rows.Count > 0)
        {
            rptrdairyandcheesedeals.DataSource = dt;
            foreach (RepeaterItem ri in rptrdairyandcheesedeals.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrdairyandcheesedeals.DataBind();
            rptrdairyandcheesedeals.Visible = true;
        }
    }


    /// <summary>
    /// /////Frozen Food /////
    /// </summary>
    public void loadFrozenNewArrival()
    {
        DataTable dt = mydal.GetFrozenNewArrival();
        if (dt.Rows.Count > 0)
        {
            rptrFrozennewarrival.DataSource = dt;
            foreach (RepeaterItem ri in rptrFrozennewarrival.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrFrozennewarrival.DataBind();
            rptrFrozennewarrival.Visible = true;
        }


        DataTable Frozenbannerimage = mydal.Frozenbannerimage();
        if (Frozenbannerimage.Rows.Count > 0)
        {
            rptrfrozenfoodbanner.DataSource = Frozenbannerimage;
            rptrfrozenfoodbanner.DataBind();
            rptrfrozenfoodbanner.Visible = true;
        }

        DataTable Frozenthumbimage = mydal.Frozenthumbimage();
        if (Frozenthumbimage.Rows.Count > 0)
        {
            rptrfrozenthumbimage.DataSource = Frozenthumbimage;
            rptrfrozenthumbimage.DataBind();
            rptrfrozenthumbimage.Visible = true;
        }
    }

    public void loadFrozenBestsellers()
    {
        DataTable dt = mydal.GetFrozenBestSeller();
        if (dt.Rows.Count > 0)
        {
            rptrFrozenbestsells.DataSource = dt;
            foreach (RepeaterItem ri in rptrFrozenbestsells.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrFrozenbestsells.DataBind();
            rptrFrozenbestsells.Visible = true;
        }
    }

    public void loadFrozenDeals()
    {
        DataTable dt = mydal.GetFrozenDeals();
        if (dt.Rows.Count > 0)
        {
            rptrFrozendeals.DataSource = dt;
            foreach (RepeaterItem ri in rptrFrozendeals.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrFrozendeals.DataBind();
            rptrFrozendeals.Visible = true;
        }
    }

    /// <summary>
    /// /////Packaging And Disposal
    /// </summary>

    public void loadpackaginganddisposalNewArrival()
    {
        DataTable dt = mydal.GetPackaginganddisposalNewArrival();
        if (dt.Rows.Count > 0)
        {
            rptrpackaginganddisposalnewarrival.DataSource = dt;
            foreach (RepeaterItem ri in rptrpackaginganddisposalnewarrival.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrpackaginganddisposalnewarrival.DataBind();
            rptrpackaginganddisposalnewarrival.Visible = true;
        }


        DataTable Frozenbannerimage = mydal.Frozenbannerimage();
        if (Frozenbannerimage.Rows.Count > 0)
        {
            rptrpackaginganddisposalbanner.DataSource = Frozenbannerimage;
            rptrpackaginganddisposalbanner.DataBind();
            rptrpackaginganddisposalbanner.Visible = true;
        }

        DataTable Packaginganddisposalthumbimage = mydal.Packaginganddisposalthumbimage();
        if (Packaginganddisposalthumbimage.Rows.Count > 0)
        {
            rptrpackaginganddisposalthumbimage.DataSource = Packaginganddisposalthumbimage;
            rptrpackaginganddisposalthumbimage.DataBind();
            rptrpackaginganddisposalthumbimage.Visible = true;
        }


    }

    public void loadpackaginganddisposalBestsellers()
    {
        DataTable dt = mydal.GetPackaginganddisposalBestSeller();
        if (dt.Rows.Count > 0)
        {
            rptrpackaginganddisposalbestsellers.DataSource = dt;
            foreach (RepeaterItem ri in rptrpackaginganddisposalbestsellers.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrpackaginganddisposalbestsellers.DataBind();
            rptrpackaginganddisposalbestsellers.Visible = true;
        }
    }

    public void loadpackaginganddisposalDeals()
    {
        DataTable dt = mydal.GetPackaginganddisposalDeals();
        if (dt.Rows.Count > 0)
        {
            rptrpackaginganddisposaldeals.DataSource = dt;
            foreach (RepeaterItem ri in rptrpackaginganddisposaldeals.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;
                }
            }
            rptrpackaginganddisposaldeals.DataBind();
            rptrpackaginganddisposaldeals.Visible = true;
        }
    }




    protected void btnaddtocart_Click1(object sender, EventArgs e)
    {
        //string Loging = Session["Loginfo"].ToString();

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

            if (Session["ShoppingType"].ToString() == "Collection")
            {
                //Label lblDel = (Label)repeaterval.FindControl("lvlDel");
                price = ((HiddenField)repeaterval.FindControl("hfCollentionP")).Value;
            }
            else if (Session["ShoppingType"].ToString() == "Delivery")
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
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('You Need To Login First');", true);
        }

    }

    //private void LoadSliderImage()
    //{

    //    DataTable dt = mydal.SelectImagesSlider();
    //    if (dt.Rows.Count > 0)
    //    {
    //        rptrslider.DataSource = dt;
    //        rptrslider.DataBind();

    //    }
    //}

    protected void Allsuperdeals_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/CategoryGridPage.aspx?SuperDeals=2");
    }
}