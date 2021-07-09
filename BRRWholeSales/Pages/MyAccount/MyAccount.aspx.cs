using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Pages_MyAccount_MyAccount : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Fillinfo();
            getProblemsList();
        }
    }

    protected void getProblemsList()
    {
        string Email = Session["Email"].ToString();
        string Password = Session["Password"].ToString();

        DataTable dt = mydal.getCustomersOrder(Email);
        if (dt.Rows.Count > 0)
        {
            GvExistingOrder.DataSource = dt;
            GvExistingOrder.DataBind();
        }

        DataTable dt1 = mydal.getCustomersOrderRecentInvoice1(Email);
        if (dt1.Rows.Count > 0)
        {
            gvrRecentInvoice.DataSource = dt1;
            gvrRecentInvoice.DataBind();
        }
    }

    protected void Fillinfo()
    {
        string Email = Session["Email"].ToString();
        string Password = Session["Password"].ToString();

        DataTable dt = mydal.SlectPerson(Email, Password);
        if (dt.Rows.Count > 0)
        {
            txtname.Text = dt.Rows[0]["FirstName"].ToString();
            //txtaddress.Text = "Post :" + dt.Rows[0]["PostCode"].ToString() + "," + dt.Rows[0]["Country"].ToString();
        }

        LoadDetails();
    }

    protected void ddlaction_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlaction.SelectedIndex.ToString() == "1")
        {
            lblshoppingtype.Visible = true;
            ddlshoppingtype.Visible = true;

        }
    }
    protected void ddlshoppingtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ddldatetime.Items.Clear();
        //string todayname = System.DateTime.Now.ToString("dd/MM/yyyy");
        string todayname = System.DateTime.Today.DayOfWeek.ToString();

        string Email = Session["Email"].ToString();
        string Password = Session["Password"].ToString();

        lbldate.Visible = true;
        ddldatetime.Visible = false;
        if (ddlshoppingtype.SelectedIndex.ToString() == "1")
        {
            DataTable dt = mydal.SlectPerson(Email, Password);
            string post = dt.Rows[0]["Distance"].ToString();

            pnlcollectiontimeslot.Visible = false;
            ddldatetime.Items.Clear();
            CalendarDel.Visible = true;
            if (double.Parse(post) <= 50)
            {
                DataTable dt1 = mydal.selectdatebypostcode(post);
                if (dt1.Rows.Count > 0)
                {
                    lbldate.Visible = true;
                    //ddldatetime.Visible = true;
                    CalendarDel.Visible = true;

                    foreach (DataRow dr in dt1.Rows)
                    {
                        string dayaname = dr["DaysForArea"].ToString();
                        if (todayname != dayaname)
                        {
                            //ddldatetime.Items.Add(new ListItem(dr["DaysForArea"].ToString() + "-" + GetDate(dr["DaysForArea"].ToString())));
                        }
                    }
                }
            }

            if (double.Parse(post) <= 100 && double.Parse(post) >= 51)
            {
                DataTable dt1 = mydal.selectdatebypostcode100(post);
                if (dt1.Rows.Count > 0)
                {
                    lbldate.Visible = true;
                    //ddldatetime.Visible = true;
                    CalendarDel.Visible = true;

                    foreach (DataRow dr in dt1.Rows)
                    {
                        string dayaname = dr["DaysForArea"].ToString();
                        if (todayname != dayaname)
                        {
                            //ddldatetime.Items.Add(new ListItem(dr["DaysForArea"].ToString() + "-" + GetDate100(dr["DaysForArea"].ToString())));
                        }
                    }
                }
            }

            if (double.Parse(post) >= 101 && double.Parse(post) <= 250)
            {
                DataTable dt1 = mydal.selectdatebypostcode150(post);
                if (dt1.Rows.Count > 0)
                {
                    lbldate.Visible = true;
                    //ddldatetime.Visible = true;
                    CalendarDel.Visible = true;

                    foreach (DataRow dr in dt1.Rows)
                    {
                        string dayaname = dr["DaysForArea"].ToString();
                        if (todayname != dayaname)
                        {
                            //ddldatetime.Items.Add(new ListItem(dr["DaysForArea"].ToString() + "-" + GetDate(dr["DaysForArea"].ToString())));
                        }
                    }
                }
            }
            pnldelivery.Visible = true;
        }


        if (ddlshoppingtype.SelectedIndex.ToString() == "2")
        {
            pnldelivery.Visible = false;
            ddldatetime.Items.Clear();
            //ArrayList arrList = new ArrayList();
            //for (int i = 0; i < 7; i++)
            //{
            //    arrList.Add(System.DateTime.Today.AddDays(i));
            //}
            //lbldate.Visible = true;
            //ddldatetime.Visible = true;
            //ddldatetime.DataSource = arrList;
            //ddldatetime.DataBind();

            DataTable dt = mydal.SlectPerson(Email, Password);
            string post = dt.Rows[0]["Distance"].ToString();

            DataTable dt1 = mydal.selectCollectionDate();
            if (dt1.Rows.Count > 0)
            {
                lbldate.Visible = true;
                //ddldatetime.Visible = true;
                CalendarDel.Visible = true;

                foreach (DataRow dr in dt1.Rows)
                {

                    //ddldatetime.Items.Add(new ListItem(dr["DayName"].ToString() + "-" + GetDatecollection(dr["DayName"].ToString())));
                }
            };


            pnlcollectiontimeslot.Visible = true;
            DataTable GetCollectionTimeSlot = mydal.GetCollectionTimeSlot();
            if (GetCollectionTimeSlot.Rows.Count > 0)
            {
                //foreach (DataRow dr in GetCollectionTimeSlot.Rows)
                //{

                //    ddlcollectiontimeslot.Items.Add(new ListItem(dr["CollectionTime"].ToString() + "-" + GetTime(dr["CollectionTime"].ToString())));

                //}


                ddlcollectiontimeslot.DataSource = GetCollectionTimeSlot;
                ddlcollectiontimeslot.DataTextField = "CollectionTime";
                ddlcollectiontimeslot.DataValueField = "CollectionTime";
                ddlcollectiontimeslot.DataBind();
                //ddlcollectiontimeslot.Items.Insert(0, new ListItem("-Select-", "0"));
            }

        }
    }

    private DateTime GetTime(string time)
    {
        //string times1 = DateTime.Now.ToString("h:mm:ss tt");
        //TimeSpan time2 = DateTime.Now.TimeOfDay;
        DateTime UTCNow = DateTime.UtcNow;
        int hour = UTCNow.Hour;
        int min = UTCNow.Minute;
        int sec = UTCNow.Second;

        string times = DateTime.Now.ToShortTimeString();
        DateTime start = DateTime.UtcNow.AddHours(4);
        DateTime end = DateTime.UtcNow.AddHours(12);
        DateTime matchTime = start;

        for (DateTime counter = start; counter < end; counter = counter.AddDays(1))
        {
            matchTime = counter;
        }

        return matchTime;
    }


    private string GetDate(string DayName)
    {
        DateTime start = DateTime.Now.AddHours(4).AddDays(1);
        DateTime end = DateTime.Now.AddDays(7);
        DateTime matchDate = start;
        string a = start.ToString("dd/MM/yyyy");
        for (DateTime counter = start; counter < end; counter = counter.AddDays(1))
        {
            if (counter.DayOfWeek.ToString() == DayName)
            {
                matchDate = counter;
                a = matchDate.ToString("dd/MM/yyyy");
            }
        }

        return a;
    }

    private string GetDate100(string DayName)
    {
        DateTime start = DateTime.Now.AddHours(5).AddDays(1);
        DateTime end = DateTime.Now.AddDays(14);
        DateTime matchDate = start;
        string a = start.ToString("dd/MM/yyyy");
        for (DateTime counter = start; counter < end; counter = counter.AddDays(1))
        {
            if (counter.DayOfWeek.ToString() == DayName)
            {
                matchDate = counter;
                a = matchDate.ToString("dd/MM/yyyy");
            }
        }
        return a;
    }

    private string GetDatecollection(string DayName)
    {
        //DateTime start = DateTime.Now.AddHours(4).AddDays(1);
        DateTime start = DateTime.Now.AddDays(1);
        DateTime end = DateTime.Now.AddDays(7);
        DateTime matchDate = start;
        string a = start.ToString("dd/MM/yyyy");
        for (DateTime counter = start; counter < end; counter = counter.AddDays(1))
        {
            if (counter.DayOfWeek.ToString() == DayName)
            {
                matchDate = counter;
                a = matchDate.ToString("dd/MM/yyyy");
            }
        }
        return a;
    }

    protected void ddldatetime_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selecteddate = ddldatetime.SelectedItem.Text;

        DateTime.Now.ToString("dd-MM-yyyy h:mm:ss tt");
        ddldatetime.Items.Clear();
        ddldatetime.Visible = false;
        CalendarDel.Visible = true;
    }
    protected void btncontichopping_Click(object sender, EventArgs e)
    {
        Session["Loginfo"] = Session["Email"].ToString();
        Session["Passwords"] = Session["Password"].ToString();


        Session["Date"] = lbldeliverytime.Text;

        if (ddlshoppingtype.SelectedIndex.ToString() == "1")
        {
            if (ddldatetime.SelectedValue != "0")
            {
                Session["ShoppingType"] = "Delivery";
                Session["Date"] = ddldatetime.SelectedItem.ToString();
                Session["Timeslot"] = ddldatetime.SelectedItem.ToString();
                //var url = String.Format("../../Default.aspx?Loggenin={0} &Passwords={1} &Date={2}&ShoppingType={3} &Timeslot={4}", Session["Email"].ToString(), Session["Password"].ToString(), ddldatetime.SelectedItem.ToString().Split('-')[1], "Delivery", "No");
                //var url = String.Format("../../Default.aspx?Loggenin={0} &Date={1}&ShoppingType={2} &Timeslot={3}", Session["Email"].ToString(), ddldatetime.SelectedItem.ToString().Split('-')[1], "Delivery", "No");
                //var url = String.Format("../../Default.aspx?Loggenin={0} &Date={1}&ShoppingType={2} &Timeslot={3}", Session["Email"].ToString(), ddldatetime.SelectedItem.ToString().Split('-')[1], "Delivery", "No");
                var url = String.Format("Default.aspx");
                Response.Redirect(url);
            }
            else
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Select A Delivery Date');", true);
            }
        }

        if (ddlshoppingtype.SelectedIndex.ToString() == "2")
        {

            if (ddldatetime.SelectedValue != "0")
            {
                Session["ShoppingType"] = "Collection";
                Session["Date"] = ddldatetime.SelectedItem.ToString() + " (" + ddlcollectiontimeslot.SelectedItem.Text + ")";
                Session["Timeslot"] = ddlcollectiontimeslot.SelectedItem.Text;
                //var url = String.Format("../../Default.aspx?Loggenin={0} &Passwords={1} &Date={2} &ShoppingType={3}&Timeslot={4}", Session["Email"].ToString(), Session["Password"].ToString(), ddldatetime.SelectedItem.ToString().Split('-')[1], "Collection", ddlcollectiontimeslot.SelectedValue);
                //var url = String.Format("../../Default.aspx?Loggenin={0} &Date={1} &ShoppingType={2}&Timeslot={3}", Session["Email"].ToString(), ddldatetime.SelectedItem.ToString().Split('-')[1], "Collection", ddlcollectiontimeslot.SelectedValue);
                var url = String.Format("Default.aspx");
                Response.Redirect(url);
            }
            else
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Select A Delivery Date');", true);
            }
        }
        //bool success = mydal.save_Finishedgoods(ddlFinishedGood.SelectedItem.ToString().Split('=')[0], txtQty.Text, "Stock");
        // Response.Redirect(string.Format("~/Page2.aspx?name={0}&technology={1}", name, technology));
        // Response.Redirect(String.Format("yourpage.aspx?strId={0}&strName={1}&strDate{2}", Server.UrlEncode(strId), Server.UrlEncode(strName), Server.UrlEncode(strDate)));
    }

    protected void LoadDetails()
    {

        string Email = Session["Email"].ToString();
        string Password = Session["Password"].ToString();

        DataTable dt = mydal.SlectPerson(Email, Password);
        if (dt.Rows.Count > 0)
        {
            txtfirstname.Text = dt.Rows[0]["FirstName"].ToString();
            txtlastname.Text = dt.Rows[0]["SurName"].ToString();
            txtemail.Text = dt.Rows[0]["Email"].ToString();
            txtCountry.Text = dt.Rows[0]["Country"].ToString();
            txtDistance.Text = dt.Rows[0]["Distance"].ToString();
            txtPostCode.Text = dt.Rows[0]["PostCode"].ToString();
            txtHouseNo.Text = dt.Rows[0]["HouseNo"].ToString();
            txtAddress.Text = dt.Rows[0]["Address"].ToString();
            txtContactNo.Text = dt.Rows[0]["Phone"].ToString();
            txtLandline.Text = dt.Rows[0]["Landline"].ToString();
            //txtcurrentPassword.Text = dt.Rows[0]["Password"].ToString();
            txtcurrentPassword.Attributes["value"] = Convert.ToString(dt.Rows[0]["Password"]);
            lblid.Text = dt.Rows[0]["ID"].ToString();
        }
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string[] Insert = new string[15];
            Insert[0] = lblid.Text;
            Insert[1] = txtemail.Text;
            Insert[2] = txtnewpassword.Text;
            Insert[3] = txtfirstname.Text;
            Insert[4] = txtlastname.Text;
            Insert[5] = txtCountry.Text;
            Insert[6] = txtDistance.Text;
            Insert[7] = txtPostCode.Text;
            Insert[8] = txtHouseNo.Text;
            Insert[9] = txtAddress.Text;
            Insert[10] = txtContactNo.Text;
            Insert[11] = txtLandline.Text;
            //bool Update = mydal.UpdateUserinfromuserInfo(Insert);

            if (txtnewpassword.Text == "") { Insert[2] = Session["Password"].ToString(); }

            bool insert = mydal.InsertRegistrationInfo1(Insert);
            if (insert)
            {
                SentEmailRequest();
                ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Request submitted successfully please wait for admin approval.');", true);
            }
        }
        catch (Exception Ex)
        {
            Response.Write(Ex.Message);
        }
    }
    protected void SentEmailRequest()
    {       
        string msg = "Your request has been send to admin and waiting for approval";

        using (MailMessage mm = new MailMessage("support@brrwholesale.com", txtemail.Text))
        {
            mm.Subject = "Account Password";
            string body = "Hello " + txtfirstname.Text + ",";
            body += "<br /><br />Your User Name Will Be Your Email ID ";
            body += "<br /><br /><h1>" + msg + "</h1>";
            body += "<br /><br />Your new Password Is ";
            body += "<br /><br /><h1>" + txtnewpassword.Text + "</h1>";
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "hgws27.win.hostgator.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("support@brrwholesale.com", "Abc@#123");
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }

    }
    protected void OrderTrackButton_Click(object sender, EventArgs e)
    {
        string Email = Session["Email"].ToString();
        string Password = Session["Password"].ToString();
        //txtOrderrTrack.Text
        DataTable dt = mydal.GetCustomerInvoice(Email, txtOrderrTrack.Text);
        if (dt.Rows.Count > 0)
        {
            GridView1.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();           
        }
        else
        {
            GridView1.Visible = false;
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$(document).ready(function () {$('#mytrackorder').modal();});", true);
        //ClientScript.RegisterStartupScript(this.GetType(), "ale", "alert('Please select Date!!');", true);
        //ToolkitScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#mytrackorder').modal();", true);
    }

    //protected void ShowAlert()
    //{
    //    string Email = Session["Email"].ToString();
    //    string Password = Session["Password"].ToString();

    //    DataTable dt = mydal.getCustomersOrder(Email);
    //    if (dt.Rows.Count > 0)
    //    {
    //        GridView1.Visible = true;
    //        GridView1.DataSource = dt;
    //        GridView1.DataBind();
    //    }
    //}

    protected void btnContact_Click(object sender, EventArgs e)
    {
        if (txtNameContact.Text == "" ||txtNameContact.Text==null)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Name is required !');", true);
        }
        if (txtEmailContact.Text == "" || txtEmailContact.Text == null)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Email is required !');", true);
        }
        if (txtConatact.Text == "" || txtConatact.Text==null)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Contact No is required !');", true);
        }
        if (txtSubjectContact.Text == "" || txtSubjectContact.Text == null)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Subject is required !');", true);
        }
        else
        {
            SentEmail();
            SentEmailAdmin();
            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Information Send Successfully');", true);
        }       
     
    }
    protected void SentEmail()
    {
        using (MailMessage mm = new MailMessage("support@brrwholesale.com", txtEmailContact.Text))
        {
            mm.Subject = txtSubjectContact.Text;
            string body = "Hello " + txtNameContact.Text + ",";
            body += "<br /><br />'" + txtMessageContact.Text + "'";
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "hgws27.win.hostgator.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("support@brrwholesale.com", "Abc@#123");
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }

    }
    protected void SentEmailAdmin()
    {
        using (MailMessage mm = new MailMessage("support@brrwholesale.com", "support@brrwholesale.com"))
        {
            mm.Subject = txtSubjectContact.Text;
            string body = "Hello " + txtNameContact.Text + ",";
            body += "<br /><br />'" + txtMessageContact.Text + "'";
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "hgws27.win.hostgator.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("support@brrwholesale.com", "Abc@#123");
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }
    }

    protected void CalendarDel_DayRender(object sender, DayRenderEventArgs e)
    {
        string Email = Session["Email"].ToString();
        string Password = Session["Password"].ToString();
        string todayname = System.DateTime.Today.DayOfWeek.ToString();

        DataTable dt = mydal.SlectPerson(Email, Password);
        string post = dt.Rows[0]["Distance"].ToString();
        DataTable dt1 = mydal.selectdatebypostcode(post);
        e.Day.IsSelectable = false;
        e.Cell.ForeColor = System.Drawing.Color.Red;
        if (dt1.Rows.Count > 0)
        {
            foreach (DataRow dr in dt1.Rows)
            {
                string dayaname = dr["DaysForArea"].ToString();
                if (todayname != dayaname)
                {
                    DateTime getDate = GetDate1(dr["DaysForArea"].ToString());

                    //CalendarDel.SelectedDates.Add(getDate);
                    if (e.Day.Date.ToString("dd/MM/yyyy") == getDate.ToString("dd/MM/yyyy"))
                    {
                        e.Day.IsSelectable = true;
                        e.Cell.ForeColor = System.Drawing.Color.LightGreen;
                        e.Cell.Font.Bold = true;
                    }
                }
            }
        }
        if (ddlshoppingtype.SelectedIndex.ToString() == "2")
        {
            DataTable dt2 = mydal.selectCollectionDate();
            if (dt2.Rows.Count > 0)
            {
                foreach (DataRow dr in dt2.Rows)
                {
                    //ddldatetime.Items.Add(new ListItem(dr["DayName"].ToString() + "-" + GetDatecollection(dr["DayName"].ToString())));
                    DateTime getDate = GetDatecollection1(dr["DayName"].ToString());
                    
                    if (e.Day.Date.ToString("dd/MM/yyyy") == getDate.ToString("dd/MM/yyyy"))
                    {
                        e.Day.IsSelectable = true;
                        e.Cell.ForeColor = System.Drawing.Color.LightGreen;
                        e.Cell.Font.Bold = true;
                    }
                }
            }
        }
    }

    private DateTime GetDate1(string DayName)
    {
        DateTime start = DateTime.Now.AddHours(4).AddDays(1);
        DateTime end = DateTime.Now.AddDays(7);
        DateTime matchDate = start;
        for (DateTime counter = start; counter < end; counter = counter.AddDays(1))
        {
            if (counter.DayOfWeek.ToString() == DayName)
            {
                matchDate = counter;
            }
        }
        return matchDate;
    }
    private DateTime GetDatecollection1(string DayName)
    {
        //DateTime start = DateTime.Now.AddHours(4).AddDays(1);
        DateTime start = DateTime.Now.AddDays(1);
        DateTime end = DateTime.Now.AddDays(7);
        DateTime matchDate = start;
        string a = start.ToString("dd/MM/yyyy");
        for (DateTime counter = start; counter < end; counter = counter.AddDays(1))
        {
            if (counter.DayOfWeek.ToString() == DayName)
            {
                matchDate = counter;
                a = matchDate.ToString("dd/MM/yyyy");
            }
        }
        return matchDate;
    }

    protected void CalendarDel_SelectionChanged(object sender, EventArgs e)
    {
        DateTime date = CalendarDel.SelectedDate;
        string week = CalendarDel.SelectedDate.ToString("dddd");
        ddldatetime.Items.Add(week + "-" + date.ToString("dd/MM/yyyy"));
        ddldatetime.Items.Add("Change Date");
       //ddldatetime.SelectedItem.Text = week + "-" + date.ToString("dd/MM/yyyy");
       // ddldatetime.SelectedValue = week + "-" + date.ToString("dd/MM/yyyy");
        ddldatetime.Visible = true;
        CalendarDel.Visible = false;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        pnlTracOrder.Visible = true;
        pnlAll.Visible = false;
        
    }
    protected void btnInvoice_Click(object sender, EventArgs e)
    {
        Button lnkbtn = sender as Button;
        GridViewRow row = lnkbtn.NamingContainer as GridViewRow;
        Label lblid = (Label)row.Cells[0].FindControl("lblOrderId");      

        string url = "../Report/OrderDetails.aspx?OrderID=" + lblid.Text;
        //Response.Redirect(url);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open(" + url + ",'_newtab');", true);
    }
    protected void GvExistingOrder_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvExistingOrder.PageIndex = e.NewPageIndex;
        GvExistingOrder.DataBind();
        getProblemsList();
    }
}
