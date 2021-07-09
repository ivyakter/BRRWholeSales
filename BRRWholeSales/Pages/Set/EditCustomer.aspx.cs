using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Pages_Set_EditCustomer : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Load();
        }        
    }

    private void Load()
    {
        if (Request.QueryString["PIMGID"] != null)
        {
            string id = Request.QueryString["PIMGID"].ToString();
            DataTable dt = mydal.GetCustomerInfoById(id);

            txtfirstname.Text = dt.Rows[0]["FirstName"].ToString();
            txtlastname.Text = dt.Rows[0]["SurName"].ToString();
            //ddlcountry.SelectedItem.Text = dt.Rows[0]["VoucherNo"].ToString();
            txtDistance.Text = dt.Rows[0]["Distance"].ToString();
            txtmobile.Text = dt.Rows[0]["Phone"].ToString();
            txtlandline.Text = dt.Rows[0]["Landline"].ToString();
            txtemail.Text = dt.Rows[0]["Email"].ToString();
            txtpassword.Text = dt.Rows[0]["Password"].ToString();
            txtaddress.Text = dt.Rows[0]["Address"].ToString();
            txtshowpostcode.Text = dt.Rows[0]["PostCode"].ToString();
            txthouseno.Text = dt.Rows[0]["HouseNo"].ToString();
            txtNote.Value= dt.Rows[0]["Note"].ToString();
        }
    }

    protected void btnsaveconti_Click(object sender, EventArgs e)
    {
        DataTable checkEmail = mydal.checkEmail(txtemail.Text);
        string id = Request.QueryString["PIMGID"].ToString();
        string[] insert = new string[15];

        insert[0] = txtfirstname.Text;
        //insert[1] = txtmiddlename.Text;
        insert[2] = txtlastname.Text;
        insert[3] = ddlcountry.SelectedItem.Text;
        insert[4] = txtDistance.Text;
        insert[5] = txtmobile.Text;
        insert[6] = txtlandline.Text;
        insert[7] = txtemail.Text;
        insert[8] = txtpassword.Text;
        insert[9] = txtaddress.Text;
        insert[10] = txtshowpostcode.Text;
        insert[11] = txthouseno.Text;
        insert[12] = txtNote.Value;

        bool Insert = mydal.UpdateCustomerInfo(insert, id);
        if (Insert == true)
        {
            string strconfirmd = "<script>if(window.confirm('Update Successfull')){window.location.href='ListCustomerForAdmin.aspx'}</script>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirmd, false);

            Session["Email"] = txtemail.Text;
            Session["Password"] = txtpassword.Text;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Something Went Wrong');", true);
        }

    }

    protected void SentEmail()
    {
        using (MailMessage mm = new MailMessage("brrcoustomercare@gmail.com", txtemail.Text))
        {
            mm.Subject = "Account Password";
            string body = "Hello " + txtfirstname.Text + ",";
            body += "<br /><br />Your User Name Will Be Your Email ID ";
            body += "<br /><br /><h1>" + txtemail.Text + "</h1>";
            body += "<br /><br />Your Password Is ";
            body += "<br /><br /><h1>" + txtpassword.Text + "</h1>";
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("brrcoustomercare@gmail.com", "loknath12");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }

    }
    protected void SentEmailAdmin()
    {
        using (MailMessage mm = new MailMessage("brrcoustomercare@gmail.com", "brrcoustomercare@gmail.com"))
        {
            mm.Subject = "Account Password";
            string body = "Hello " + txtfirstname.Text + ",";
            body += "<br /><br />Your User Name Will Be Your Email ID ";
            body += "<br /><br /><h1>" + txtemail.Text + "</h1>";
            body += "<br /><br />Your Password Is ";
            body += "<br /><br /><h1>" + txtpassword.Text + "</h1>";
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("brrcoustomercare@gmail.com", "loknath12");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }

    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListCustomerForAdmin.aspx");
    }
}