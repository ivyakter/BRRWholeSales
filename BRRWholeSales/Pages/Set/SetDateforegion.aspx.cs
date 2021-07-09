using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_SetDateforegion : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                loadAreaname();
                getAreawithDay();
                btnupdate.Visible = true;
                btnSave.Visible = false;
               
            }
            else
            {

                GetNumber();
                loadAreaname();
                btnupdate.Visible = false;
                btnSave.Visible = true;

            }
        }

    }


    private void getAreawithDay()
    {
        Int64 id = Convert.ToInt64(Request.QueryString["ID"]);
        DataTable dt = mydal.getAreabyid(id);
        if (dt.Rows.Count > 0)
        {
            //loadAreaname();

            txtareaid.Text = dt.Rows[0]["ID"].ToString();
            ddlareaname.SelectedItem.Text = dt.Rows[0]["AreaName"].ToString();
            ddldayname.SelectedItem.Text = dt.Rows[0]["DaysForArea"].ToString();

        }
    }




    //protected void LoadDayname()
    //{
    //    var Dayname = CultureInfo.CurrentCulture.DateTimeFormat.DayNames;
    //    for (int i = 0; i < Dayname.Length; i++)
    //    {
    //        ddldayname.Items.Add(new ListItem(Dayname[i], i.ToString()));
    //    }
    //}



    public void GetNumber()
    {
        DataTable areaid = mydal.GetAreaNo();
        txtareaid.Text = areaid.Rows[0][0].ToString();
    }

    public void loadAreaname()
    {

        DataTable Distane = mydal.GetAreaName();

        if (Distane.Rows.Count > 0)
        {
            ddlareaname.DataSource = Distane;
            ddlareaname.DataTextField = "Distance";
            ddlareaname.DataValueField = "ID";
            ddlareaname.DataBind();
            ddlareaname.Items.Insert(0, new ListItem("-Select-", "0"));

        }

    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtareaid.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ale", "alert('Please Give Doctor Title');", true);
        }
        else
        {
            string[] insert = new string[20];

            insert[1] = txtareaid.Text;
            insert[2] = ddlareaname.SelectedItem.Text;
            insert[3] = ddldayname.SelectedItem.Text;


            bool Save = mydal.InsertAreawithday(insert);

            if (Save == true)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Submit Successfylly');", true);
                ddlareaname.SelectedItem.Text = null;
                ddldayname.SelectedItem.Text = null;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error",
                    "alert('Something wrong please try again');", true);
            }
        }
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        Int64 id = Convert.ToInt64(Request.QueryString["ID"]);

        string AreaID = txtareaid.Text;
        string AreaName = ddlareaname.SelectedItem.Text;
        string Dayname = ddldayname.SelectedItem.Text;

        bool update = mydal.UpdateAreaWithDays(AreaID, AreaName, Dayname);
        Response.Redirect("ListDateforregion.aspx");

    }

}