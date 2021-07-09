using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;
public partial class Pages_Set_CustomerRequest : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowInfo();
        }
    }

    protected void ShowInfo()
    {
        DataTable dt = mydal.GetCustomerInfoForUpdate();
        if (dt.Rows.Count > 0)
        {
            addGrid.DataSource = dt;
            addGrid.DataBind();
        }
        else
        {
            addGrid.DataSource = null;
            addGrid.DataBind();
        }
    }

    protected void addGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        addGrid.PageIndex = e.NewPageIndex;
        addGrid.DataBind();
        ShowInfo();
    }
    

    protected void addGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        addGrid.EditIndex = -1;
        ShowInfo();
    }

    protected void addGrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        addGrid.EditIndex = e.NewEditIndex;
        ShowInfo();
    }

    protected void addGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string[] insert = new string[10];
            insert[0] = ((TextBox)addGrid.Rows[e.RowIndex].FindControl("txtpostcode")).Text;
            insert[1] = ((TextBox)addGrid.Rows[e.RowIndex].FindControl("txtemail")).Text;
            insert[2] = ((TextBox)addGrid.Rows[e.RowIndex].FindControl("txtPassword")).Text;
            insert[3] = ((TextBox)addGrid.Rows[e.RowIndex].FindControl("txtPhone")).Text;
            insert[4] = ((Label)addGrid.Rows[e.RowIndex].FindControl("lblid")).Text;
            bool Edit = mydal.EditCustomer(insert);

            addGrid.EditIndex = -1;
            ShowInfo();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btncontrol = sender as Button;
        GridViewRow gvr = (GridViewRow)btncontrol.NamingContainer;
        Label lblid = gvr.FindControl("lblid") as Label;

        DataTable dt = mydal.GetCustomerInfoForUpdate(lblid.Text);

        string[] Insert = new string[15];

        Insert[0] = dt.Rows[0]["CustomerId"].ToString();
        Insert[1] = dt.Rows[0]["FirstName"].ToString();
        Insert[2] = dt.Rows[0]["SurName"].ToString();
        Insert[3] = dt.Rows[0]["Email"].ToString();
        Insert[4] = dt.Rows[0]["Country"].ToString();
        Insert[5] = dt.Rows[0]["Distance"].ToString();
        Insert[6] = dt.Rows[0]["PostCode"].ToString();
        Insert[7] = dt.Rows[0]["HouseNo"].ToString();
        Insert[8] = dt.Rows[0]["Address"].ToString();
        Insert[9] = dt.Rows[0]["Phone"].ToString();
        Insert[10] = dt.Rows[0]["Landline"].ToString();
        Insert[11] = dt.Rows[0]["Password"].ToString();

        bool update = mydal.UpdateRegistrationInfo(Insert);
        if (update)
        {
            SentEmail();
            SentEmailAdmin();

            bool delete= mydal.DeleteRegistrationInfo(Insert);
            ShowInfo();

            string strconfirm = "<script>if(window.confirm('Customer information updated</br>Customer's User Name, Password and Update Confarmation Is Sent to his Email!!!!')){window.location.href='CustomerRequest.aspx'}</script>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);
            
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Failed update');", true);
        }
       
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        DataTable dt = mydal.GetCustomerInfoForUpdate();
        if (dt.Rows.Count > 0)
        {
            string[] Insert = new string[15];
            Insert[0] = dt.Rows[0]["CustomerId"].ToString();

            SentEmailForDelete();
            SentEmailAdminForDelete();

            bool delete = mydal.DeleteRegistrationInfo(Insert);
            ShowInfo();
        }
        //ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Customer Information update');", true);
    }

    protected void SentEmail()
    {
        DataTable dt = mydal.GetCustomerInfoForUpdate();
        string email = dt.Rows[0]["Email"].ToString();
        string firstName = dt.Rows[0]["FirstName"].ToString();
        string password = dt.Rows[0]["Password"].ToString();
        string msg = "Your request has been accepted and Information has been updated";

        using (MailMessage mm = new MailMessage("support@brrwholesale.com", email))
        {
            mm.Subject = "Account Password";
            string body = "Hello " + firstName + ",";
            body += "<br /><br />Your User Name Will Be Your Email ID ";
            body += "<br /><br /><h1>" + msg + "</h1>";
            body += "<br /><br />Your new Password Is ";
            body += "<br /><br /><h1>" + password + "</h1>";
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
        DataTable dt = mydal.GetCustomerInfoForUpdate();
        string email = dt.Rows[0]["Email"].ToString();
        string firstName = dt.Rows[0]["FirstName"].ToString();
        string password = dt.Rows[0]["Password"].ToString();
        string msg = "Your request has been accepted and Information has been updated";

        using (MailMessage mm = new MailMessage("brrcoustomercare@gmail.com", "brrcoustomercare@gmail.com"))
        {
            mm.Subject = "Account Password";
            string body = "Hello " + firstName + ",";
            body += "<br /><br />Your User Name Will Be Your Email ID ";
            body += "<br /><br /><h1>" + msg + "</h1>";
            body += "<br /><br />Your Password Is ";
            body += "<br /><br /><h1>" + password + "</h1>";
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

    protected void SentEmailForDelete()
    {
        DataTable dt = mydal.GetCustomerInfoForUpdate();
        string email = dt.Rows[0]["Email"].ToString();
        string firstName = dt.Rows[0]["FirstName"].ToString();
        string password = dt.Rows[0]["Password"].ToString();
        string msg = "Your request has been declined as your information can not be updated now";

        using (MailMessage mm = new MailMessage("brrcoustomercare@gmail.com", email))
        {
            mm.Subject = "Account Password";
            string body = "Hello " + firstName + ",";
            body += "<br /><br />Your User Name Will Be Your Email ID ";
            body += "<br /><br /><h1>" + msg + "</h1>";
            body += "<br /><br />Your Password Is ";
            body += "<br /><br /><h1>" + password + "</h1>";
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
    protected void SentEmailAdminForDelete()
    {
        DataTable dt = mydal.GetCustomerInfoForUpdate();
        string email = dt.Rows[0]["Email"].ToString();
        string firstName = dt.Rows[0]["FirstName"].ToString();
        string password = dt.Rows[0]["Password"].ToString();
        string msg = "Your request has been declined as your information can not be updated now";

        using (MailMessage mm = new MailMessage("brrcoustomercare@gmail.com", "brrcoustomercare@gmail.com"))
        {
            mm.Subject = "Account Password";
            string body = "Hello " + firstName + ",";
            body += "<br /><br />Your User Name Will Be Your Email ID ";
            body += "<br /><br /><h1>" + msg + "</h1>";
            body += "<br /><br />Your Password Is ";
            body += "<br /><br /><h1>" + password + "</h1>";
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
}