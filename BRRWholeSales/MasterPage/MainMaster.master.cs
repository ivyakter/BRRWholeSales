using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class MasterPage_MainMaster : System.Web.UI.MasterPage
{

    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Loadheadermenu();
            Loadheadermenuheadertop();
        }
        Checkheaderbanner();
        //string c = Session["ShoppingType"].ToString();
        if (Session["Email"] != null)
        {
            linkLogin.Visible = false;
            linkLogout2.Visible = true;
            if (linkLogin.Visible == false && linkLogout2.Visible == true)
            {
                linkMyAccount.Visible = true;               
                linkRegister.Visible = false;
            }
            else if (linkLogin.Visible == true && linkLogout2.Visible == false)
            {
                linkMyAccount.Visible = false;               
            }

            linkLogin1.Visible = false;
            linkLogout21.Visible = true;
            if (linkLogin1.Visible == false && linkLogout21.Visible == true)
            {
                linkMyAccount1.Visible = true;
                linkRegister1.Visible = false;
            }
            else if (linkLogin1.Visible == true && linkLogout21.Visible == false)
            {
                linkMyAccount1.Visible = false;
            }
            if (!IsPostBack)
            {
                if (Session["shoppingcart"] != null)
                {
                    GetMenuList3();
                }
                Checkheaderbanner();
                BindProductname();
                Loadheadermenu();
                Loadheadermenuheadertop();
                if (Request.QueryString["Loggenin"] != null)
                {
                    if (Request.QueryString["Date1"] == "0")
                    {
                        DataTable tt = (DataTable)Session["shoppingcart"];
                    }
                    else
                    {
                        Session["shoppingcart"] = Request.QueryString["product"];
                    }
                }
            }
            //AutoComplete.datasource = mydal.GetProductName();
            HtmlAnchor HA = new HtmlAnchor();
            HA.ServerClick += new EventHandler(DeleteMenuList);           
        }
        else
        {
            linkLogin.Visible = true;
            linkLogout2.Visible = false;
        }
        linkLogout2.ServerClick += linkLogout2_ServerClick;

        lblyear.Text = DateTime.Now.Year.ToString();
    }
    protected void linkLogout2_ServerClick(object sender, EventArgs e)
    {
        Session["Email"] = null;
        Session.RemoveAll();
        Response.Redirect("https://brrwholesale.com");        
        linkLogout2.Visible = false;
        linkLogin.Visible = true;

        linkLogout21.Visible = false;
        linkLogin1.Visible = true;
    }
    protected void GetMenuList2()
    {
        DataTable dt = (DataTable)Session["shoppingcart"];
        int total = 0;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            total = total + Convert.ToInt32(dt.Rows[i]["price"]);
        }
        rptrsuperdeals1.DataSource = dt;
        rptrsuperdeals1.DataBind();
        rptrsuperdeals2.DataSource = dt;
        rptrsuperdeals2.DataBind();
        Label2.Text = total + ".00";
        Label3.Text = total + ".00";
        
    }
    protected void GetMenuList3()
    {
      

        DataTable dt = (DataTable)Session["shoppingcart"];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            int quantity = 0;
            double sum = 0;

            string pid = dt.Rows[i]["pid"].ToString();
            string pname = dt.Rows[i]["pname"].ToString();
            string price = dt.Rows[i]["price"].ToString();
            string Barcode = dt.Rows[i]["Barcode"].ToString();
            string Imagename = dt.Rows[i]["Imagename"].ToString();
            string Imageextension = dt.Rows[i]["Imageextension"].ToString();
            string hfvatamount = dt.Rows[i]["hfvatamount"].ToString();
            bool exist = false;
            int a = 0;
            DataRow foundProductId = dt.Select("pid ='" + pid + "'").FirstOrDefault();
            if (foundProductId != null)
            {
                a = Convert.ToInt32(foundProductId["quantity"].ToString());
                //foundProductId["quantity"] = a + 1;
                //foundProductId["total"] = (a + 1) * double.Parse(price);
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
            
            foreach (DataRow dr in dt.Rows)
            {
                sum += Convert.ToDouble(dr["total"]);
                quantity += Convert.ToInt32(dr["quantity"]);
            }
            MasterPage ms = new MasterPage();
            Label count = Page.Master.FindControl("lblcount") as Label;
            Label countsmall = Page.Master.FindControl("lblcountinside") as Label;
            Label count2 = Page.Master.FindControl("countproduct") as Label;
            Label counttext = Page.Master.FindControl("lblcounttext") as Label;
            Label Label2 = Page.Master.FindControl("Label2") as Label;
            Label Label3 = Page.Master.FindControl("Label3") as Label;

            count.Text = "0";
            countsmall.Text = "0";
            count2.Text = "0";
            counttext.Text = "0";
            Label2.Text = "0";
            Label3.Text = "0";

            count.Text = quantity.ToString();
            countsmall.Text = "(" + quantity + ")";
            count2.Text = "(" + quantity + ")";
            counttext.Text = "(" + quantity + ")";
            Label2.Text = "(" + sum + ")";
            Label3.Text = "(" + sum + ")";
        }
    }
    private void BindProductname()
    {
        DataTable dt = mydal.GetProductName();
        if (dt.Rows.Count > 0)
        {
            //ddlitenm.DataSource = dt;
            //ddlitenm.DataTextField = "PName";
            //ddlitenm.DataValueField = "PID";
            //ddlitenm.DataBind();
            //ddlitenm.Items.Insert(0, new ListItem("Search...", "0"));            
        }        
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        DateTime date = Convert.ToDateTime("2020/12/30");
        if (date <= System.DateTime.Now)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Problem", "alert('System Problem, Please Contact with PTI System:01677802233');", true);
        }
        else
        {
            UserLogin();
        }
    }
    public void UserLogin()
    {
        string[] loginfo = new string[15];
        loginfo[0] = txtemaillog.Text;
        loginfo[1] = txtpasslog.Text;

        DataTable dt = mydal.selectinfocustomer(loginfo);

        if (dt.Rows.Count > 0)
        {
            Page pg = new System.Web.UI.Page();
            Session["Email"] = dt.Rows[0]["Email"].ToString();
            Session["FirstName"] = dt.Rows[0]["FirstName"].ToString();
            Session["SurName"] = dt.Rows[0]["SurName"].ToString();
            Session["Password"] = dt.Rows[0]["Password"].ToString();

            //ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('LogIn SuccessFull ');", true);
            //Label labellogin = (Label)ContentPlaceHolder1.FindControl("lblloigin");
            //if (labellogin.Text == "")
            //{
            //    labellogin.Text = "LoggedIn";
            //}

            //string strconfirmd = "<script>if(window.confirm('Login Successfull')){window.location.href='Pages/MyAccount/MyAccount.aspx'}</script>";
            //ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirmd, false);
            Response.Redirect("~/Pages/MyAccount/MyAccount.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Please insert the right password');", true);
        }
    }
    protected void GetMenuList()
    {
        List<string> ss = new List<string>();
        DataTable dt = (DataTable)Session["shoppingcart"];
        int total = 0;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ss.Add(dt.Rows[i]["pname"].ToString());
            total = total + Convert.ToInt32(dt.Rows[i]["price"]);
        }
        rptrsuperdeals1.DataSource = dt;
        rptrsuperdeals1.DataBind();
        rptrsuperdeals2.DataSource = dt;
        rptrsuperdeals2.DataBind();
        //Label2.Text = total + ".00";
        //Label3.Text = total + ".00";
        lblcount.Text = dt.Rows.Count.ToString();
    }
    protected void DeleteMenuList(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Session["shoppingcart"];
        Label Label21 = new Label();
        foreach (RepeaterItem item in rptrsuperdeals1.Items)
        {
            if (item.FindControl("Label21") != null)
                Label21 = (Label)item.FindControl("Label21");
        }
        string id = Label21.Text;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DataRow dr = dt.Rows[i];
            if (dt.Rows[i]["pid"].ToString() == id)
                dr.Delete();
        }
        Session["shoppingcart"] = dt;
        rptrsuperdeals1.DataSource = dt;
        rptrsuperdeals1.DataBind();
        Label count = Page.Master.FindControl("lblcount") as Label;
        count.Text = dt.Rows.Count.ToString();


        //DataTable dt = (DataTable)Session["shoppingcart"];
        //int index = ((RepeaterItem)sender).ItemIndex;
        //if (dt.Rows.Count > 0)
        //{
        //    dt.Rows[index].Delete();
        //    rptrsuperdeals1.DataSource = dt;
        //    rptrsuperdeals1.DataBind();
        //    Label count = Page.Master.FindControl("lblcount") as Label;
        //    count.Text = dt.Rows.Count.ToString();
        //}

        //DataTable dt = (DataTable)Session["shoppingcart"];
        //int index = ((RepeaterItem)sender).ItemIndex;
        //string id = null;
        //foreach (RepeaterItem item in rptrsuperdeals1.Items)
        //{
        //    Label Label21 = (Label)item.FindControl("Label21");
        //    id = Label21.Text;
        //}
        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        //    DataRow dr = dt.Rows[i];
        //    if (dt.Rows[i]["pid"].ToString() == id)
        //        dr.Delete();
        //}
        //Session["shoppingcart"] = dt;
        //rptrsuperdeals1.DataSource = dt;
        //rptrsuperdeals1.DataBind();
        //Label count = Page.Master.FindControl("lblcount") as Label;
        //count.Text = dt.Rows.Count.ToString();
        //Button btn = sender as Button;
        //Repeater rep=(Repeater)btn.NamingContainer as Repeater;

    }
    //protected void btnsaveconti_Click(object sender, EventArgs e)
    //{
    //    if (chkagree.Checked)
    //    {
    //        string[] insert = new string[15];
    //        insert[0] = txtfirstname.Text;
    //        insert[1] = txtmiddlename.Text;
    //        insert[2] = txtlastname.Text;
    //        insert[3] = ddlcountry.SelectedItem.Text;
    //        insert[4] = txtpostcode.Text;
    //        insert[5] = txtmobile.Text;
    //        insert[6] = txtlandline.Text;
    //        insert[7] = txtemail.Text;
    //        insert[8] = txtpassword.Text;
    //        bool Insert = mydal.InsertRegistrationInfo(insert);
    //        if (Insert == true)
    //        {
    //            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Submit Successfylly');", true);
    //        }
    //        else
    //        {
    //            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Something Went Wrong');", true);
    //        }
    //    }
    //    else
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Yoy Need to check the Checkbox');", true);
    //    }
    //}


    //protected void btnneedhelp_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("Pages/Help.aspx");
    //}

    //private void LoadMenu()
    //{
    //    DataTable dt = new DAL().GetMenuData();
    //    rptrcategory.DataSource = dt;
    //    rptrcategory.DataBind();

    //}

    //private void LoadOccation()
    //{
    //    DataTable dt = mydal.checkOccation();
    //    if (dt.Rows.Count > 0)
    //    {
    //        lblcategory.Text = dt.Rows[0]["MenuText"].ToString();
    //        lbloccation.Text = dt.Rows[0]["Occation"].ToString();
    //        lbloccationdesc.Text = dt.Rows[0]["OccationDesc"].ToString();
    //        lbloccationremain.Text = dt.Rows[0]["OccationRemain"].ToString();
    //    }

    //}

    private void Loadheadermenu()
    {
        SubcatPopular();
        SubcatFoodcupboars();
        SubcatFresh();
        SubcatDrinkandbreverage();
        SubcatFrozenfood();
        SubcatPackingDisposal();
    }
    private void Loadheadermenuheadertop()
    {
        SubcatPopular2();
        SubcatFoodcupboars2();
        SubcatFresh2();
        SubcatDrinkandbreverage2();
        SubcatFrozenfood2();
        SubcatPackingDisposal2();
    }


    private void SubcatPopular()
    {
        DataTable dt = mydal.GetSubcatPopular();
        if (dt.Rows.Count > 0)
        {
            rptrSubCatePopular.DataSource = dt;
            rptrSubCatePopular.DataBind();
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

    private void SubcatFrozenfood()
    {
        DataTable dt = mydal.GetSubcatFrozenfood();
        if (dt.Rows.Count > 0)
        {
            rptrfrozenfood.DataSource = dt;
            rptrfrozenfood.DataBind();
        }
    }

    private void SubcatPackingDisposal()
    {
        DataTable dt = mydal.GetSubcatPackingDisposal();
        if (dt.Rows.Count > 0)
        {
            rptrpackingdisposal.DataSource = dt;
            rptrpackingdisposal.DataBind();
        }
    }


    private void SubcatPopular2()
    {
        //DataTable dt = mydal.GetSubcatPopular();
        //if (dt.Rows.Count > 0)
        //{
        //    rptrpoular2.DataSource = dt;
        //    rptrpoular2.DataBind();
        //}

    }

    private void SubcatFoodcupboars2()
    {
        DataTable dt = mydal.GetSubcatFoodandcipboard();
        if (dt.Rows.Count > 0)
        {
            rptrfoodcupboard2.DataSource = dt;
            rptrfoodcupboard2.DataBind();
        }

    }

    private void SubcatFresh2()
    {
        DataTable dt = mydal.GetSubcatFresh();
        if (dt.Rows.Count > 0)
        {
            rptrfresh2.DataSource = dt;
            rptrfresh2.DataBind();
        }

    }

    private void SubcatDrinkandbreverage2()
    {
        DataTable dt = mydal.GetSubcatdrinkandbreverage();
        if (dt.Rows.Count > 0)
        {
            rptrdrink2.DataSource = dt;
            rptrdrink2.DataBind();
        }
    }

    private void SubcatFrozenfood2()
    {
        DataTable dt = mydal.GetSubcatFrozenfood();
        if (dt.Rows.Count > 0)
        {
            rptrfrozen2.DataSource = dt;
            rptrfrozen2.DataBind();
        }
    }

    private void SubcatPackingDisposal2()
    {
        DataTable dt = mydal.GetSubcatPackingDisposal();
        if (dt.Rows.Count > 0)
        {
            rptrpackaging2.DataSource = dt;
            rptrpackaging2.DataBind();
        }
    }

    protected void Checkheaderbanner()
    {
        DataTable dt = mydal.CheckHeaderBanner();
        if (dt.Rows.Count > 0)
        {
            pnl1.Visible = true;
        }
        else
        {
            pnl1.Visible = false;
        }    
    }
    public void Autocomplete()
    {
        DataTable dt = mydal.GetProductId(txtSearch.Text);
        if (dt.Rows.Count > 0)
        {
            int Pid = Convert.ToInt32(dt.Rows[0][0].ToString());
            var url = String.Format("~/Pages/ProductDetails.aspx?PID={0}", Pid);
            Response.Redirect(url);
        }
        else
        {

        }
       
    }

    public void Autocomplete1()
    {
        string name = txtSearch.Text;
        DataTable dt = mydal.GetProductId(txtSearch.Text);
        var url = String.Format("~/Pages/CategoryGridPage.aspx?PName={0}", name);
        Response.Redirect(url);
    }


    protected void btnsearch_Click(object sender, EventArgs e)
    {
        Autocomplete1();
    }

    protected void btnsubcriptionEmail_Click(object sender, EventArgs e)
    {
        string email = txtsubcriptionemail.Text;
        string date = Convert.ToDateTime(DateTime.Now).Date.ToString("d");
        bool InsertSubcriptionEmail = mydal.InsertSubcriptionEmail(email, date);
        if (InsertSubcriptionEmail==true)
        {
            txtsubcriptionemail.Text = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Thank you for subscribing with us');", true);
        }
    }

    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        Autocomplete1();
    }

    protected void txtemaillog_TextChanged(object sender, EventArgs e)
    {
        //string[] loginfo = new string[15];
        //loginfo[0] = txtemaillog.Text;
        //loginfo[1] = txtpasslog.Text;

        //DataTable dt = mydal.selectinfocustomer(loginfo);
        //if (dt.Rows.Count!=0)
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('This email is not registered yet, please register now');", true);
        //}
    }  
}
