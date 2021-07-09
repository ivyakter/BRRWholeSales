using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.NetworkInformation;
using System.IO;

public partial class frmlogin : System.Web.UI.Page
{
    DAL mydal = new DAL();
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session.RemoveAll();
            txtusername.Focus();           
        }   
    }
       
    protected void lbtnForgotPass_Click(object sender, EventArgs e)
    {
        if (txtusername.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Please Enter User ID to get Password');", true);
        }
        else
        {
            //string mobno = "";
            //string pass = "";
            //DataTable dt = new DataTable();
            //dt = DtList();
            //foreach (DataRow dr in dt.Rows)
            //{
            //    mobno = dr["MOBILE"].ToString();
            //    pass = dr["USER_PASSWORD"].ToString();

            //}           
        }
    }
    
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        DateTime date = Convert.ToDateTime("2020/12/31");
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
        loginfo[0] = txtusername.Text;
        loginfo[1] = txtpassword.Text;

        DataTable dt = mydal.selectinfocustomer(loginfo);

        if (dt.Rows.Count > 0)
        {
            laMeg.Text = null;

            Session["Email"] = dt.Rows[0]["Email"].ToString();
            Session["FirstName"] = dt.Rows[0]["FirstName"].ToString();
            Session["SurName"] = dt.Rows[0]["SurName"].ToString();
            Session["Password"] = dt.Rows[0]["Password"].ToString();
          
            Response.Redirect("~/Pages/MyAccount/MyAccount.aspx");
        }
        else
        {
            Session["Uid"] = null;
            Session["Pwd"] = null;
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Please insert the right password');", true);
        }
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void txtusername_TextChanged(object sender, EventArgs e)
    {
        string[] loginfo = new string[15];
        loginfo[0] = txtusername.Text;
        loginfo[1] = txtpassword.Text;

        DataTable dt = mydal.selectCustomerEmail(loginfo);
        if (dt.Rows.Count>0)
        {
            
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('This email is not registered yet, please register now');", true);
        }
    }
}
