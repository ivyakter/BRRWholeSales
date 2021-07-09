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

public partial class Pages_MyAccount_Registration : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void Login()
    {
        string[] loginfo = new string[15];
        loginfo[0] = txtemaillog.Text;
        loginfo[1] = txtpasslog.Text;

        //bool Checklogin = mydal.checkloginfo(loginfo);
        DataTable dt = mydal.selectinfocustomer(loginfo);

        if (dt.Rows.Count > 0)
        {
            Page pg = new System.Web.UI.Page();
            Session["Email"] = dt.Rows[0]["Email"].ToString();
            Session["FirstName"] = dt.Rows[0]["FirstName"].ToString();
            Session["SurName"] = dt.Rows[0]["SurName"].ToString();
            Session["Password"] = dt.Rows[0]["Password"].ToString();
            Session["Loginfo"] = dt.Rows[0]["Email"].ToString();

            Response.Redirect("~/Pages/MyAccount/MyAccount.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Something wrong please try again');", true);
        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        Login();
    }

    protected void txtpasslog_TextChanged(object sender, EventArgs e)
    {
        Login();
    }
}