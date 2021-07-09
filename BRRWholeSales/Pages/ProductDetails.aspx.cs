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
            if (Request.QueryString["PID"] != null)
            {
                lblhiddenPID.Text = Request.QueryString["PID"].ToString();
                loadSingleImagebyPID();
                loadthreeImagebyPID();
                loadProductInfobyPID();
                LoadRelatedProduct();
                FillNameAndEmail();
                LoadMainComment();
                loadHotDeals();
                loadHotBestsellers();
            }
        }
    }

    protected void LoadRelatedProduct()
    {
        string PID = Request.QueryString["PID"];

        DataTable CategoryAndSubcategoryID = mydal.CategoryID(PID);
        if (CategoryAndSubcategoryID.Rows.Count > 0)
        {
            string Category = CategoryAndSubcategoryID.Rows[0]["CategoryID"].ToString();

            string SubCategory = CategoryAndSubcategoryID.Rows[0]["SubCategoryID"].ToString();

            DataTable dt = mydal.GetRelatedProduct(Category);
            if (dt.Rows.Count > 0)
            {
                rptrrelatedproduct.DataSource = dt;
                rptrrelatedproduct.DataBind();
                rptrrelatedproduct.Visible = true;

            }
        }
    }

    public void loadSingleImagebyPID()
    {
        int PID = Convert.ToInt32(Request.QueryString["PID"]);

        DataTable dt = mydal.GetProductByPIDsingleimage(PID);
        if (dt.Rows.Count > 0)
        {
            rptrsingleimage.DataSource = dt;
            rptrsingleimage.DataBind();
            rptrsingleimage.Visible = true;

        }
    }

    public void loadProductInfobyPID()
    {
        string PID = Request.QueryString["PID"];

        DataTable dt = mydal.GetProductInfoByPID(PID);
        if (dt.Rows.Count > 0)
        {
            rptrproductinfo.DataSource = dt;

            foreach (RepeaterItem ri in rptrproductinfo.Items)
            {
                string Deliveryoldprice = dt.Rows[0]["PPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Deliveryoldpricer.Visible = false;

                    Label collectionoldprice = (Label)ri.FindControl("collectionoldprice");
                    collectionoldprice.Visible = false;
                }
            }
            rptrproductinfo.DataBind();
            rptrproductinfo.Visible = true;
            lblProductcode.Text = dt.Rows[0]["ProductCode"].ToString();
            lblproductname.Text = dt.Rows[0]["PName"].ToString();

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
                string Collectionoldprice = dt.Rows[0]["CollectionOldPrice"].ToString();
                if (Deliveryoldprice == "")
                {
                    Label Deliveryoldpricer = (Label)ri.FindControl("Deliveryoldprice");
                    Label Collectionoldpricer = (Label)ri.FindControl("Collectionoldprice");
                    Deliveryoldpricer.Visible = false;
                    Collectionoldpricer.Visible = false;
                }

            }
            rptrHotdealsProducts.DataBind();
            rptrHotdealsProducts.Visible = true;
        }
    }

    protected void Allsuperdeals_Click(object sender, EventArgs e)
    {
        Response.Redirect("CategoryGridPage.aspx?SuperDeals=3");
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
    protected void btnaddtocart_Click(object sender, EventArgs e)
    {

        if (Session["Loginfo"] != null)
        {
            Button btbag = sender as Button;

            if (Session["ShoppingType"] != null)
            {

                foreach (RepeaterItem item in rptrsingleimage.Items)
                {
                    string Imagename = ((HiddenField)item.FindControl("hfimagename")).Value;
                    string Imageextension = ((HiddenField)item.FindControl("hfimageExtesion")).Value;


                    foreach (RepeaterItem repeaterval in rptrproductinfo.Items)
                    {
                        string pid = ((HiddenField)repeaterval.FindControl("hfPId")).Value;
                        string pname = ((HiddenField)repeaterval.FindControl("hfname")).Value;
                        string price = ((HiddenField)repeaterval.FindControl("hfprice")).Value;
                        string Barcode = ((HiddenField)repeaterval.FindControl("hfproductid")).Value;
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

                            //lblcount.Text = "(" + createdt.Rows.Count + ")";
                            // lblcountinside.Text = "(" + createdt.Rows.Count + ")";                            

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


                            // lblcount.Text = "(" + dt.Rows.Count + ")";
                            // lblcountinside.Text = "(" + dt.Rows.Count + ")";
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

    protected void btnsaveconti_Click(object sender, EventArgs e)
    {
        //if (chkagree.Checked)
        //{
        //    string[] insert = new string[15];
        //    insert[0] = txtfirstname.Text;
        //    insert[1] = txtmiddlename.Text;
        //    insert[2] = txtlastname.Text;
        //    insert[3] = ddlcountry.SelectedItem.Text;
        //    insert[4] = txtpostcode.Text;
        //    insert[5] = txtmobile.Text;
        //    insert[6] = txtlandline.Text;
        //    insert[7] = txtemail.Text;
        //    insert[8] = txtpassword.Text;
        //    bool Insert = mydal.InsertRegistrationInfo(insert);
        //    if (Insert == true)
        //    {
        //        ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Submit Successfylly');", true);
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Something Went Wrong');", true);
        //    }
        //}
        //else
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Yoy Need to check the Checkbox');", true);
        //}
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        //string[] loginfo = new string[15];
        //loginfo[0] = txtemaillog.Text;
        //loginfo[1] = txtpasslog.Text;

        //if (txtemaillog.Text == "admin" && txtpasslog.Text == "123")
        //{       
        //    Response.Redirect("Pages/Set/SetDateforegion.aspx");          
        //}
        //else
        //{

        //    DataTable dt = mydal.selectinfocustomer(loginfo);

        //    if (dt.Rows.Count > 0)
        //    {
        //        Page pg = new System.Web.UI.Page();
        //        Session["Email"] = dt.Rows[0]["Email"].ToString();
        //        Session["FirstName"] = dt.Rows[0]["FirstName"].ToString();
        //        Session["LastName"] = dt.Rows[0]["LastName"].ToString();
        //        Session["Password"] = dt.Rows[0]["Password"].ToString();

        //        if (lbllog.Text == "")
        //        {
        //            lbllog.Text = "LoggedIn";

        //        }               
        //        Response.Redirect("MyAccount/MyAccount.aspx");
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Something wrong please try again');", true);
        //    }
        //}
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

    protected void btncomment_Click(object sender, EventArgs e)
    {
        if (txtName.Text != "" & txtEmail.Text != "")
        {
            string[] insert = new string[30];
            insert[0] = Session["FirstName"].ToString() + " " + Session["SurName"].ToString();
            insert[1] = Session["Email"].ToString();
            insert[2] = txtComment.Text;
            insert[3] = Request.QueryString["PID"];

            bool InsertComment = mydal.InsertComment(insert);
            if (InsertComment)
            {
                txtComment.Text = "";
                LoadMainComment();
            }
        }
        else
        {
            string strconfirm = "<script>if(window.confirm('Select your shopping type first')){window.location.href='MyAccount/MyAccount.aspx'}</script>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);
           // ClientScript.RegisterStartupScript(this.GetType(), "ale", "alert('You Need ToLoginFirst!!');", true);

        }
    }

    protected void FillNameAndEmail()
    {
        if (Session["Loginfo"] != null)
        {
            DataTable GetNameAndEmail = mydal.GetNameAndEmail(Session["Loginfo"].ToString());

            if (GetNameAndEmail.Rows.Count > 0)
            {
                txtName.Text = GetNameAndEmail.Rows[0]["FirstName"].ToString() + " " + GetNameAndEmail.Rows[0]["SurName"].ToString();
                txtEmail.Text = GetNameAndEmail.Rows[0]["Email"].ToString();

                txtreplyname.Text = GetNameAndEmail.Rows[0]["FirstName"].ToString() + " " + GetNameAndEmail.Rows[0]["SurName"].ToString();
                txtreplyemail.Text = GetNameAndEmail.Rows[0]["Email"].ToString();
            }

        }
    }



    protected void btnreply_Click(object sender, EventArgs e)
    {
        if (txtName.Text != "" & txtEmail.Text != "")
        {
            string[] insert = new string[30];
            insert[0] = txtreplyname.Text;
            insert[1] = txtreplyemail.Text;
            insert[2] = txtreplycomment.Text;
            insert[3] = lblhiddenPID.Text;


            foreach (RepeaterItem item in rptrMainComment.Items)
            {
                HiddenField MainCommentId = item.FindControl("hfMainId") as HiddenField;

                bool InsertComment = mydal.InsertReplyComment(insert, MainCommentId.Value);
            }


        }
        else
        {
            string strconfirmd = "<script>if(window.confirm('You Need ToLoginFirst')){window.location.href='ProductDetails.aspx'}</script>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirmd, false);
        }



    }

    private void LoadMainComment()
    {
        DataTable dt = new DAL().GetMenuComment(Request.QueryString["PID"].ToString());
        rptrMainComment.DataSource = dt;
        rptrMainComment.DataBind();

        //if (dt.Rows.Count > 4)
        //{
        //    rptrMainComment.AllowPaging = true;
        //}

    }


    protected void rptrMainComment_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //Repeater rptrReplyComment = (Repeater)e.Item.FindControl("rptrReplyComment");
            //HiddenField hfMainId = (HiddenField)e.Item.FindControl("hfMainId");
            //DataTable dt = new DAL().GetReplyComment(hfMainId.Value);
            //if (dt.Rows.Count > 0)
            //{
            //    rptrReplyComment.DataSource = dt;
            //    rptrReplyComment.DataBind();
            //}

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

}