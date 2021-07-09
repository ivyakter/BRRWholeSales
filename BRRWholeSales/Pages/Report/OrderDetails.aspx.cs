using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Report_OrderDetails : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadDate();
    }

    private void LoadDate()
    {
        if (Request.QueryString["OrderID"] != null)
        {
            string orderNo = Request.QueryString["OrderID"].ToString();
            DataTable dt = mydal.LoadOrderByOrderID(orderNo);
            DataTable dt2 = mydal.LoadOrderByOrderID1(orderNo);
            if (dt.Rows.Count > 0)
            {
                rptSale.DataSource = dt;
                rptSale.DataBind();

                rptCustomer.DataSource = dt2;
                rptCustomer.DataBind();

                txtInvoice.Text = orderNo;
                txtDate.Text = dt.Rows[0]["Date"].ToString();

                txtShoppingType.Text = dt.Rows[0]["ShoppingType"].ToString();
                txtDueDate.Text = dt.Rows[0]["DeliveyDate"].ToString();

                decimal amount = 0;
                decimal vat = 0;
                for(int i=0; i<dt.Rows.Count; i++)
                {
                    amount += Convert.ToDecimal(dt.Rows[i]["Total"]);
                    if (!string.IsNullOrEmpty(dt.Rows[i]["vat"].ToString()))
                    {
                        vat += Convert.ToDecimal(dt.Rows[i]["vat"]);
                    }
                }
                txtNetAmount.Text = "£" + amount.ToString();
                txtVatAmount.Text = "£" + vat.ToString() ;
                txtTotal.Text = "£" + (amount+vat).ToString();


            }
        }
        else
        {
            string strconfirm = "<script>if(window.confirm('Sorry There Is No Record For This Order')){window.location.href='Orders.aspx'}</script>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);
        }
    }

    protected void btn_Print_Click(object sender, EventArgs e)
    {
       // btn_Print.Visible = false;
    }
    public override void VerifyRenderingInServerForm(Control control)
    {


    }

    protected void btn_Download_Click(object sender, EventArgs e)
    {
        btn_Download.Visible = false;
        btn_Print.Visible = false;

        //for pdf 

        string filename = "brr";
        string attachment = "attachment; filename=" + filename + ".pdf";
        Response.ClearContent();
        Response.AddHeader("content-disposition", attachment);
        Response.ContentType = "application/pdf";
        StringWriter stw = new StringWriter();
        HtmlTextWriter htextw = new HtmlTextWriter(stw);
        htextw.AddStyleAttribute("font-size", "7pt");
        htextw.AddStyleAttribute("color", "Black");

        Panel_Name.RenderControl(htextw);//Name of the Panel
        Document document = new Document();
        document = new Document(PageSize.A4, 5, 5, 15, 5);
        FontFactory.GetFont("Arial", 50, iTextSharp.text.BaseColor.BLUE);
        PdfWriter.GetInstance(document, Response.OutputStream);
        document.Open();

        StringReader str = new StringReader(stw.ToString());
        HTMLWorker htmlworker = new HTMLWorker(document);
        htmlworker.Parse(str);

        document.Close();
        Response.Write(document);

        // end pdf

        //Response.ContentType = "application/pdf";
        //Response.AddHeader("content-disposition", "attachment;filename=Invoice.pdf");
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
    }
}