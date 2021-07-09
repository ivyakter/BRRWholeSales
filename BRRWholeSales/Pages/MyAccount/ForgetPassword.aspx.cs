using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_MyAccount_ForgetPassword : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string email = txtemail.Text;
        DataTable check = mydal.CheckPasswordbymail(email);
        if (check.Rows.Count > 0)
        {
            string name = check.Rows[0]["FirstName"].ToString();
            string Password = check.Rows[0]["Password"].ToString();

            using (MailMessage mm = new MailMessage("support@brrwholesale.com", txtemail.Text))
            {
                mm.Subject = "Account Password";
                string body = "Hello " + name + ",";
                body += "<br /><br />Your User Name Will Be Your Email ID ";
                body += "<br /><br /><h1>" + txtemail.Text + "</h1>";
                body += "<br /><br />Your Password Is ";
                body += "<br /><br /><h1>" + Password + "</h1>";
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

                ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('We Sent A Password To Your Email');", true);
            }          
        }
        else
        {
           string strconfirm = "<script>if(window.confirm('This email address is not registered with BRR Wholesale. Please check your email ID or Register if you are a new customer. Thank you')){window.location.href='LogIn.aspx'}</script>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);

        }

    }
}