using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _8000 : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {

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
        string[] loginfo = new string[5];
        loginfo[0] = txtemaillog.Text;
        loginfo[1] = txtpasslog.Text;

        DataTable dt = mydal.selectinforAdmin(loginfo);

        if (dt.Rows.Count > 0)
        {

            //string strconfirm = "<script>if(window.confirm('Login Successfull')){window.location.href='Pages/Set/SetDateforegion.aspx'}</script>";

            Response.Redirect("Pages/Set/DashBoard.aspx");

            //ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);

        }
        else
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Something Went Wrong Please Contact Developer');", true);

        }
    }
}