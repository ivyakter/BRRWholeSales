using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Details : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["PID"] != null)
            {
                //lblloigin.Text = "LoggedIn";
                loadSingleImagebyPID();
                loadthreeImagebyPID();
                loadProductInfobyPID();
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

    public void loadthreeImagebyPID()
    {
        string PID = Request.QueryString["PID"];

        DataTable dt = mydal.GetProductByPIDthreeimage(PID);
        if (dt.Rows.Count > 0)
        {
            rptrthreeimage.DataSource = dt;
            rptrthreeimage.DataBind();
            rptrthreeimage.Visible = true;

            rptrsidebar.DataSource = dt;
            rptrsidebar.DataBind();
            rptrsidebar.Visible = true;
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
        }
    }



    protected void btnaddtocart_Click(object sender, EventArgs e)
    {

        if (Session["Loginfo"] != null)
        {
            Button btbag = sender as Button;
            //RepeaterItem repeaterval = btbag.NamingContainer as RepeaterItem;


            foreach (RepeaterItem item in rptrsingleimage.Items)
            {
                string Imagename = ((HiddenField)item.FindControl("hfimagename")).Value;
                string Imageextension = ((HiddenField)item.FindControl("hfimageExtesion")).Value;


                foreach (RepeaterItem repeaterval in rptrproductinfo.Items)
                {
                    string pid = ((HiddenField)repeaterval.FindControl("hfPId")).Value;
                    string pname = ((HiddenField)repeaterval.FindControl("hfname")).Value;
                    string price = ((HiddenField)repeaterval.FindControl("hfprice")).Value;
                    //string size = ((RadioButtonList)repeaterval.FindControl("rblSize")).SelectedItem.Text;
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




                        lblcount.Text = "(" + createdt.Rows.Count + ")";
                        lblcountinside.Text = "(" + createdt.Rows.Count + ")";



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


                        lblcount.Text = "(" + dt.Rows.Count + ")";
                        lblcountinside.Text = "(" + dt.Rows.Count + ")";



                    }
                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('You Need To Login First');", true);
        }
    }

    protected void btnsaveconti_Click(object sender, EventArgs e)
    {
        if (chkagree.Checked)
        {
            string[] insert = new string[15];
            insert[0] = txtfirstname.Text;
            insert[1] = txtmiddlename.Text;
            insert[2] = txtlastname.Text;
            insert[3] = ddlcountry.SelectedItem.Text;
            insert[4] = txtpostcode.Text;
            insert[5] = txtmobile.Text;
            insert[6] = txtlandline.Text;
            insert[7] = txtemail.Text;
            insert[8] = txtpassword.Text;
            bool Insert = mydal.InsertRegistrationInfo(insert);
            if (Insert == true)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Submit Successfylly');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Something Went Wrong');", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Yoy Need to check the Checkbox');", true);
        }
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string[] loginfo = new string[15];
        loginfo[0] = txtemaillog.Text;
        loginfo[1] = txtpasslog.Text;

        if (txtemaillog.Text == "admin" && txtpasslog.Text == "123")
        {

            //string strconfirm = "<script>if(window.confirm('Login Successfull')){window.location.href='Pages/Set/SetDateforegion.aspx'}</script>";

            Response.Redirect("Pages/Set/SetDateforegion.aspx");

            //ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);

        }
        else
        {
            //bool Checklogin = mydal.checkloginfo(loginfo);
            DataTable dt = mydal.selectinfocustomer(loginfo);

            if (dt.Rows.Count > 0)
            {
                Page pg = new System.Web.UI.Page();
                Session["Email"] = dt.Rows[0]["Email"].ToString();
                Session["FirstName"] = dt.Rows[0]["FirstName"].ToString();
                Session["LastName"] = dt.Rows[0]["LastName"].ToString();
                Session["Password"] = dt.Rows[0]["Password"].ToString();

                //ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('LogIn SuccessFull ');", true);




                if (lbllog.Text == "")
                {
                    lbllog.Text = "LoggedIn";

                }

                //string strconfirmd = "<script>if(window.confirm('Login Successfull')){window.location.href='Pages/MyAccount/MyAccount.aspx'}</script>";
                //ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirmd, false);
                Response.Redirect("MyAccount/MyAccount.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Something wrong please try again');", true);
            }
        }
    }
}