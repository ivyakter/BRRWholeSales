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
using System.Configuration;
using System.Text;
using System.Net.Mime;

public partial class Pages_MyAccount_Registration : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsaveconti_Click(object sender, EventArgs e)
    {
        DataTable checkEmail = mydal.checkEmail(txtemail.Text);
        if (checkEmail.Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('his email is already in used for registration. Please login or use another email id');", true);
        }
        else
        {
            if (chkagree.Checked)
            {
                if (txtshowpostcode.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Post code must be input');", true);
                }
                else
                {
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

                    bool Insert = mydal.InsertRegistrationInfo(insert);
                    if (Insert == true)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Submit Successfylly</br>Your User Name And Password Is Sent to Your Email');", true);
                        SentEmail();
                        SentEmailAdmin();
                        Session["Email"] = txtemail.Text;
                        Session["Password"] = txtpassword.Text;

                        var url = String.Format("MyAccount.aspx");
                        Response.Redirect(url);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Something Went Wrong');", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('You Need to check the Checkbox');", true);
            }
        }
    }

    protected void SentEmail()
    {
        string emailSenderHost = ConfigurationManager.AppSettings["smtpserver"].ToString();

        MailMessage message = new MailMessage();
        message.To.Add(txtemail.Text);// Email-ID of Receiver  
        message.Subject = "Welcome to brrwholesale.com";// Subject of Email  
        message.From = new
System.Net.Mail.MailAddress("torekul002@gmail.com");// Email-ID of Sender  
        message.IsBodyHtml = true;
        message.AlternateViews.Add(Mail_Body());
        SmtpClient SmtpMail = new SmtpClient();
        SmtpMail.Host = emailSenderHost;//name or IP-Address of Host used for SMTP transactions  
        SmtpMail.Port = 25;//Port for sending the mail  
        SmtpMail.Credentials = new
System.Net.NetworkCredential("torekul002@gmail.com", "Tk@#123ht");//username/password of network, if apply  
        SmtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
        SmtpMail.EnableSsl = true;
        SmtpMail.ServicePoint.MaxIdleTime = 0;
        SmtpMail.ServicePoint.SetTcpKeepAlive(true, 2000, 2000);
        message.BodyEncoding = Encoding.Default;
        message.Priority = MailPriority.High;
        SmtpMail.Send(message); //Smtpclient to send the mail message  
    }

    private AlternateView Mail_Body()
    {
        string pathlogo = Server.MapPath(@"../../images/home12/logo2.png");
        LinkedResource Imglogo = new LinkedResource(pathlogo, MediaTypeNames.Image.Jpeg);
        Imglogo.ContentId = "LogoImage";

        string path = Server.MapPath(@"../../CategoryImage/2/Food CupboardBig.png");
        LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);
        Img.ContentId = "MyImage";

        string str = @"  
                <table style='width:600px;'>  
                    <tr>  
                        <td> 
                            <img src=cid:LogoImage  id='logoimg' alt='' width='100px' height='100px'/>
                        </td>  
                        <td style='text-align:center;Color:#000;' > 
                         <p>BRR Wholesale| Grocery Wholesaler <br/> Believe on our partner's success </p>                        
                        </td>  
                    </tr>  
                    </table>  <br/>
                    

                <table style='width:600px; background-color:#D6E7F0;'>  
                    <tr>  
                        <td> 
                            <img src=cid:MyImage  id='img' alt='' width='100%' height='200px'/> 
                        </td>  
                        <td> 
                         
                        </td>  
                    </tr>  
                    <tr>  
                        <td style='text-align:center;'>  
                        <h1 style='Color:#052d3d;'>WELCOME</h1>
                        <h1 style='Color:#2190e3;'>BRR WHOLESALE</h1>
                            <p style='Color:#000; text-align:left;padding-left: 10px;'>Dear , <p>
                            <p style='Color:#000;'>Thanks for signing up with Brr Wholesale. We’ll be sending an occasional email with everything new and good that you’ll probably want to know about: new products, posts, promos, and parties. </p>  
                    <b>Your Registration Details</b> <br/>
                             User Name: " + txtemail.Text + " <br/> Password: " + txtpassword.Text + "<br><br> <a style='height:30pt; width:150.25pt;color:#ffffff; font-family:Tahoma, Verdana, sans-serif; font-size:16px;text-decoration: none;background-color: #cb0d38; border-radius: 15px; padding: 10px; padding-bottom:1px; display:inline-block;' href='https://brrwholesale.com/'>START SHOPPING</a> <br><br><p>Our success begins with delivering a great service, quality, value for each of our customers.</P><p>Unit-15 Canning Road, Abbey Trading Point, London,E15 3NW, UK.</p style='color:#800000'><hr><p>Help& FAQ's | Policy |  01992 252141 , sales@brrwholesale.com</p><br></td>  </tr></table> ";
        AlternateView AV =
        AlternateView.CreateAlternateViewFromString(str, null, MediaTypeNames.Text.Html);
        AV.LinkedResources.Add(Img);
        return AV;
    }

    protected void SentEmailAdmin()
    {

        using (MailMessage mm = new MailMessage("support@brrwholesale.com", "support@brrwholesale.com"))
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
            smtp.Host = "hgws27.win.hostgator.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("support@brrwholesale.com", "Abc@#123");
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }

    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration.aspx");
    }


}