using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_ChangePassword : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindAdminUser();
        }
    }

    private void BindAdminUser()
    {


        DataTable dt = mydal.GetallAdminUser();

        //rptrBrands.DataSource = dt;
        //rptrBrands.DataBind();
        addGrid.DataSource = dt;
        addGrid.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string[] insert = new string[15];
        insert[0] = txtusername.Text;
        insert[1] = txtpassword.Text;

        bool Insert = mydal.InsertAdminUser(insert);
        txtusername.Text = "";
        txtpassword.Text = "";
        BindAdminUser();
        if (Insert == true)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Submit Successfylly');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Something wrong please try again');", true);

        }
    }
    protected void addGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "cmdDelete")
        {
            string uid = Session["Uname"].ToString();
            string ID = e.CommandArgument.ToString();
            if (uid == "admin")
            {
              bool deleteAdminUser =  mydal.DeleteAdminUser(ID);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('You are not permit to delete');", true);
            }
            BindAdminUser();
        }

    }
    protected void addGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        addGrid.EditIndex = -1;
        BindAdminUser();
    }
    protected void addGrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        addGrid.EditIndex = e.NewEditIndex;
        BindAdminUser();
    }

    protected void addGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string[] insert = new string[10];
            insert[0] = ((TextBox)addGrid.Rows[e.RowIndex].FindControl("txtId")).Text;
            insert[1] = ((TextBox)addGrid.Rows[e.RowIndex].FindControl("txtname")).Text;
            insert[2] = ((TextBox)addGrid.Rows[e.RowIndex].FindControl("txtpassword")).Text;

            bool Edit = mydal.EditAdminUser(insert);

            addGrid.EditIndex = -1;
            BindAdminUser();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void addGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        addGrid.PageIndex = e.NewPageIndex;
        addGrid.DataBind();
        BindAdminUser();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangePassword.aspx");
    }
}