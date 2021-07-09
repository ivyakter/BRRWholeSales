using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Text;
//using System.Net;
//using System.Net.Mail;
//using iTextSharp.text;
//using iTextSharp.text.pdf;
//using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Drawing;
using iTextSharp.text.pdf;
using iTextSharp.text;

public partial class Pages_Cart_Cart : System.Web.UI.Page
{
    DAL mydal = new DAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGrid();
        }
        if (Request.QueryString["Id"] == "Checkout")
        {
            btncheckout_Click(null, null);
        }
    }

    private void SendPDFEmail(DataTable dt)
    {
        //DataTable dt = mydal.GetOrderDetails(OrderID);

        //if (dt.Rows.Count>0)
        //{
        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {

                Paragraph paragraph = new Paragraph("<b>Terms and conditions can be found on: brrwholesale.com </b> </br>Registered in England and Wales No. 08366495, VAT Registration Number GB 168 2010 28</br>Registered Address Unit 15, Canning Road, Abbey Trading Point, London, E15 3NW, United Kingdom.");

                string imageURL = Server.MapPath(".") + "/icone.png";

                iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(imageURL);
                logo.SpacingBefore = 100f;


                //string companyName = "BRR Whole Sale";
                string orderNo = dt.Rows[0]["orderid"].ToString();

                double totalamount = 0;
                string username = "";
                string PostCode = "";
                string Email = "";
                DataTable alltotal = mydal.Alltotal(orderNo);
                if (alltotal.Rows.Count > 0)
                {
                    totalamount = double.Parse(alltotal.Rows[0]["Alltotal"].ToString());
                    username = alltotal.Rows[0]["FirstName"].ToString();
                    PostCode = alltotal.Rows[0]["PostCode"].ToString();
                    //Email = alltotal.Rows[0]["Email"].ToString();
                }


                StringBuilder sb = new StringBuilder();
                sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
                sb.Append("<tr><td align='center' style='background-color: #18B5F0' colspan = '2'><h2>Order Sheet</h2></td></tr>");
                sb.Append("</table>");



                sb.Append("<table width='100%' style='font - size:5px;'>");
                //sb.Append("<tr><td colspan = '2'></td></tr>");

                sb.Append("<tr><td><b>BRR Wholesale Ltd</b>");

                sb.Append("<p>Unit-15</p>");
                sb.Append("<p>Canning Road, Abbey Trading Point</p>");
                sb.Append("<p>London");
                sb.Append("<p>E15 3NW </p>");
                sb.Append("</td>");
                // sb.Append("<br />");

                sb.Append("<td align='right'>Website www.brrwholesale.com ");
                sb.Append("<p>Telephone 01992252141 </p> ");
                sb.Append("<p>Email info@brrwholesale.com </p> </td></tr>");

                sb.Append("</table>");





                sb.Append("<table align='left'>");
                sb.Append("<tr><td><b>Date: </b>");
                //sb.Append(logo);
                sb.Append(DateTime.Now);
                sb.Append(" </td></tr>");


                sb.Append("<tr><td><b>Order No:</b>");
                sb.Append(orderNo);
                sb.Append(" </td></tr>");



                sb.Append("<tr><td><b>User Name:</b>");
                sb.Append(username);
                sb.Append(" </td></tr>");
                sb.Append("<tr><td><b>User Name:</b>");
                sb.Append(PostCode);
                sb.Append(" </td></tr>");

                sb.Append("</table>");

                sb.Append("<br />");
                sb.Append("<table border = '1'>");
                sb.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    sb.Append("<th style = 'background-color: #DCDCDC;color:#000000'>");
                    sb.Append(column.ColumnName);
                    sb.Append("</th>");
                }
                sb.Append("</tr>");
                foreach (DataRow row in dt.Rows)
                {
                    sb.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        sb.Append("<td>");
                        sb.Append(row[column]);
                        sb.Append("</td>");
                    }
                    sb.Append("</tr>");
                }

                //double sum = 0;
                //for (int index = 0; index < dt.Rows.Count; index++)
                //{
                //    string total = dt.Rows[0]["Total"].ToString();
                //    sum += Convert.ToDouble(total == "" ? "0" : total);
                //}

                sb.Append("</table>");

                sb.Append("<br />");

                DataTable GetProductVattwenty = mydal.GetProductVattwenty(orderNo);
                DataTable GetProductVatzero = mydal.GetProductVatzero(orderNo);
                //if (GetProductVat.Rows.Count > 0)
                //{
                sb.Append("<table width='40%' border = '1' cellspacing='0'>");
                sb.Append("<tr  align='left' style='background-color: #	e0ffff'><th><p>VAT Rate</p></th>");
                sb.Append("<th><p>Net</p></th>");
                sb.Append("<th><p>VAT</p></th>");
                sb.Append("</tr>");
                sb.Append("<tr><td align='left' style='background-color: #18B5F0'><p>20.00%</p></td>");

                sb.Append("<td>");
                sb.Append(GetProductVattwenty.Rows[0]["Net"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append("£" + "&nbsp;&nbsp;" + double.Parse(GetProductVattwenty.Rows[0]["Vat"].ToString()));
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr><td align='left' style='background-color: #18B5F0'><p>0.00%</p></td>");
                sb.Append("<td>");
                sb.Append(GetProductVatzero.Rows[0]["Net"].ToString());
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append(double.Parse(GetProductVatzero.Rows[0]["Vat"].ToString()));
                sb.Append("</td>");

                sb.Append("</tr>");
                sb.Append("</table>");

                //}
                ///////////Total Show///////////

                sb.Append("<table width='40%' align='right' border = '1' cellspacing='0'>");
                sb.Append("<tr>");
                sb.Append("<th align='right'><p>Net Amount </p></th>");

                sb.Append("<th align='center' style='background-color: #18B5F0' >");
                sb.Append("£" + "&nbsp;&nbsp;" + totalamount);
                sb.Append("</th></tr>");
                sb.Append("<tr>");
                sb.Append("<th align='right'><p>Vat </p></th>");
                sb.Append("<th  align='center'>");
                sb.Append("£" + "&nbsp;&nbsp;" + double.Parse(GetProductVattwenty.Rows[0]["Vat"].ToString()));
                sb.Append("</th>");
                sb.Append("</tr>");

                sb.Append("<tr>");
                sb.Append("<th align='right'><p>Total </p></th>");
                sb.Append("<th  align='center'>");
                sb.Append("£" + "&nbsp;&nbsp;" + double.Parse(GetProductVattwenty.Rows[0]["Vat"].ToString()) + totalamount);
                sb.Append("</th>");
                sb.Append("</tr>");
                sb.Append("</table>");

                StringReader sr = new StringReader(sb.ToString());

                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
                    pdfDoc.Open();
                    //writer.PageEvent = new PDFFooter();

                    pdfDoc.Add(logo);
                    htmlparser.Parse(sr);
                    //pdfDoc.Add(paragraph);
                    pdfDoc.Close();

                    byte[] bytes = memoryStream.ToArray();
                    memoryStream.Close();

                    MailMessage mm = new MailMessage("brrcoustomercare@gmail.com", Email);
                    mm.Subject = "iTextSharp PDF";
                    mm.Body = "iTextSharp PDF Attachment";
                    mm.Attachments.Add(new Attachment(new MemoryStream(bytes), "iTextSharpPDF.pdf"));
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential();
                    NetworkCred.UserName = "brrcoustomercare@gmail.com";
                    NetworkCred.Password = "loknath12";
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                }
            }
        }
        //}

    }

    public class PDFFooter : PdfPageEventHelper
    {
        // write on top of document

        //public override void OnOpenDocument(PdfWriter writer, Document document)
        //{
        //    base.OnOpenDocument(writer, document);
        //    PdfPTable tabFot = new PdfPTable(new float[] { 1F });
        //    tabFot.SpacingAfter = 10F;
        //    PdfPCell cell;
        //    tabFot.TotalWidth = 300F;
        //    cell = new PdfPCell(new Phrase("Header"));
        //    tabFot.AddCell(cell);
        //    tabFot.WriteSelectedRows(0, -1, 150, document.Top, writer.DirectContent);
        //}

        // write on start of each page

        //public override void OnStartPage(PdfWriter writer, Document document)
        //{
        //    base.OnStartPage(writer, document);
        //}

        // write on end of each page
        public override void OnEndPage(PdfWriter writer, Document document)
        {
            base.OnEndPage(writer, document);
            PdfPTable tabFot = new PdfPTable(new float[] { 1F });
            PdfPCell cell;
            tabFot.TotalWidth = 300F;
            cell = new PdfPCell(new Phrase("Footer"));
            tabFot.AddCell(cell);
            tabFot.WriteSelectedRows(0, -1, 150, document.Bottom, writer.DirectContent);

            base.OnCloseDocument(writer, document);
        }

        //write on close of document
        //public override void OnCloseDocument(PdfWriter writer, Document document)
        //{
        //    base.OnCloseDocument(writer, document);
        //}
    }

    /// <summary>
    /// //////////////////
    /// </summary>

    protected void LoadGrid()
    {
        if (string.IsNullOrEmpty(Session["Loginfo"] as string))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('You Need To Login First');", true);
            return;
        }

        DataTable dt = (DataTable)Session["shoppingcart"];
        if (dt != null)
        {
            Label lbl_TitlePage = Page.Master.FindControl("lblcount") as Label;
            lbl_TitlePage.Text = dt.Rows.Count.ToString();
            // for main user 
            //lblmainusername.Text = Session["mainitemserrler"].ToString();

        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
        GridView1.Visible = true;


        string orderid = "";
        string customerid = "";
        string DeliveryDate = "";
        string ShoppingType = "";
        string TimeSlot = "";
        //string SpecialRequist = "";
        DataTable dt1 = mydal.GetOrderid();
        if (dt1.Rows.Count > 0)
        {
            orderid = "OSN" + dt1.Rows[0]["id"].ToString();
            customerid = Session["Loginfo"].ToString();
            DeliveryDate = Session["Date"].ToString();
            ShoppingType = Session["ShoppingType"].ToString();
            TimeSlot = Session["Timeslot"].ToString();
        }
        DataTable dt2 = mydal.selectinfocustomer1(Session["Loginfo"].ToString());
        DataTable tt = (DataTable)Session["shoppingcart"];
        lblAccId.Text = orderid;
        lblShoppingType.Text = ShoppingType;
        lblDateTime.Text = DeliveryDate;
        if (Session["ShoppingType"].ToString() == "Delivery")
        {
            labAddress.Text = dt2.Rows[0]["HouseNo"].ToString() + "," + dt2.Rows[0]["Address"].ToString() + "," + dt2.Rows[0]["PostCode"].ToString();
            labAddress1.Text = dt2.Rows[0]["HouseNo"].ToString() + "," + dt2.Rows[0]["Address"].ToString() + "," + dt2.Rows[0]["PostCode"].ToString();
        }
        else
        {
            labAddress.Text = "Unit-15 Canning Road, Abbey Trading Point, London,E15 3NW, United, Kingdom. <br> 01992 252141, sales@brrwholesale.com";
            labAddress1.Text = "Unit-15 Canning Road, Abbey Trading Point, London,E15 3NW, United, Kingdom. <br> 01992 252141, sales@brrwholesale.com";
        }
        lbltotalP.Text = quantity.ToString();
        lblAccId1.Text = orderid;
        lblShoppingType1.Text = ShoppingType;
        lblDateTime1.Text = DeliveryDate;
        labAddress1.Text = dt2.Rows[0]["HouseNo"].ToString() + "," + dt2.Rows[0]["Address"].ToString() + "," + dt2.Rows[0]["PostCode"].ToString();
        lbltotalP1.Text = quantity.ToString();
        //lblTotal.Text = (total + vatAvg).ToString();
        //lblTotal1.Text = (total + vatAvg).ToString();
    }
    decimal total = 0;
    decimal vat = 0;
    decimal vatAmount = 0;
    decimal quantity = 0;
    decimal totalvat = 0;

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        decimal totalvatamount = 0;
        decimal totalamount = 0;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            total += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "total"));
            vat += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "hfvatamount"));
            quantity += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "quantity"));
            TextBox LblQ = (TextBox)e.Row.FindControl("LblQ");
            if (Convert.ToInt32(LblQ.Text) > 1)
            {
                Button btdcre = (Button)e.Row.FindControl("btdcre");
                btdcre.Visible = true;
            }
        }
        foreach (GridViewRow row in GridView1.Rows)
        {
            Label lvlVatAmount = (Label)row.FindControl("lvlVatAmount");
            Label lbltotal = (Label)row.FindControl("lbltotal");
            Label hfvatamount = (Label)row.FindControl("lblhfvatamount");
            total = Convert.ToDecimal(lbltotal.Text);
            totalvat = Convert.ToDecimal(hfvatamount.Text);
            vatAmount = (total * totalvat) / 100;
            totalvatamount = totalvatamount + vatAmount;
            totalamount = totalamount + total;
            lvlVatAmount.Text = vatAmount.ToString("0.00");
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblamount = (Label)e.Row.FindControl("lbltt");
            lblamount.Text = totalamount.ToString();
            Label lvlTotalQuantity = (Label)e.Row.FindControl("lvlTotalQuantity");
            lvlTotalQuantity.Text = quantity.ToString();
            Label lvlTotalVat = (Label)e.Row.FindControl("lvlTotalVat");
            lvlTotalVat.Text = totalvatamount.ToString("0.00");
            //Label lbl_TitlePage = Page.Master.FindControl("lbltotal") as Label;
            //lbl_TitlePage.Text = lblamount.Text;
        }
        lblNetAmount.Text = totalamount.ToString("0.00");
        lblNetAmount1.Text = totalamount.ToString("0.00");
        lvlTotalVatAmount.Text = totalvatamount.ToString("0.00");
        lvlTotalVatAmount1.Text = totalvatamount.ToString("0.00");
        lblTotal.Text = (totalamount + totalvatamount).ToString("0.00");
        lblTotal1.Text = (totalamount + totalvatamount).ToString("0.00");
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        GridView1.EditIndex = -1;
        LoadGrid();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = (DataTable)Session["shoppingcart"];
        if (dt.Rows.Count > 0)
        {
            dt.Rows[e.RowIndex].Delete();
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Label count = Page.Master.FindControl("lblcount") as Label;
            count.Text = dt.Rows.Count.ToString();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdDelete")
        {
            string id = e.CommandArgument.ToString();
            //int index1 = Convert.ToInt32(e.CommandArgument.ToString());
            DataTable dt = (DataTable)Session["shoppingcart"];
            //DataRow dr = dt.Rows[index1];
            //dr.Delete();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                if (dt.Rows[i]["pid"].ToString() == id)
                    dr.Delete();
            }
            Session["shoppingcart"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Response.Redirect(Request.RawUrl);
            return;
        }

        int index = Convert.ToInt32(e.CommandArgument.ToString());
        GridViewRow gvRow = GridView1.Rows[index];
        TextBox txtq = (TextBox)gvRow.FindControl("LblQ");
        Label price = (Label)gvRow.FindControl("lblprice");
        Label txtto = (Label)gvRow.FindControl("lbltotal");
        Label footertotal = (Label)GridView1.FooterRow.FindControl("lbltt");
        Label lvlTotalQuantity = (Label)GridView1.FooterRow.FindControl("lvlTotalQuantity");
        Label lvlTotalVat = (Label)GridView1.FooterRow.FindControl("lvlTotalVat");
        
        Button bt = (Button)gvRow.FindControl("btdcre");

        if (e.CommandName == "decrement")
        {
            int q = Convert.ToInt32(txtq.Text) - 1;
            txtq.Text = q.ToString();
            if (q > 0)
            {
                txtto.Text = (Convert.ToDouble(txtto.Text) - Convert.ToDouble(price.Text)).ToString("0.00");

                decimal number = Convert.ToDecimal(txtto.Text);
                Convert.ToDecimal(number).ToString("#,##0.00");
                txtto.Text = number.ToString();

                footertotal.Text = (Convert.ToDouble(footertotal.Text) - Convert.ToDouble(price.Text)).ToString("0.00");
                Label lbl = Page.Master.FindControl("lblcount") as Label;
                lbl.Text = (Convert.ToInt32(lbl.Text) - 1).ToString();
                
                DataTable dt = (DataTable)Session["shoppingcart"];
                decimal quant = Convert.ToDecimal(dt.Rows[index]["quantity"]);
                decimal totAmu1 = Convert.ToDecimal(dt.Rows[index]["total"]);
                //quant = quant * Convert.ToInt32(txtq.Text);                
                quant = quant - 1;
                totAmu1 = quant* Convert.ToDecimal(dt.Rows[index]["price"]);
                dt.Rows[index]["quantity"] = quant.ToString();
                dt.Rows[index]["total"] = totAmu1.ToString("0.00");

               

                Session["shoppingcart"] = dt;
            }
            else
            {
                bt.Visible = false;
                txtq.Text = "1";
            }
        }
        if (e.CommandName == "increment")
        {
            int q = Convert.ToInt32(txtq.Text) + 1;
            txtq.Text = q.ToString();
            txtto.Text = (q * Convert.ToDouble(price.Text)).ToString("0.00");
            footertotal.Text = (Convert.ToDouble(footertotal.Text) + Convert.ToDouble(txtto.Text)).ToString("0.00");

            decimal number = Convert.ToDecimal(txtto.Text);
            Convert.ToDecimal(number).ToString("#,##0.00");
            txtto.Text = number.ToString();

            Label lbl = Page.Master.FindControl("lblcount") as Label;
            lbl.Text = (Convert.ToInt32(lbl.Text) + 1).ToString();
            bt.Visible = true;

            DataTable dt = (DataTable)Session["shoppingcart"];
            decimal quant = Convert.ToDecimal(dt.Rows[index]["quantity"]);
            decimal totAmu1 = Convert.ToDecimal(dt.Rows[index]["total"].ToString());
            //quant = quant * Convert.ToInt32(txtq.Text);
          
            quant = quant + 1;
            totAmu1 = quant * Convert.ToDecimal(dt.Rows[index]["price"]);
            quant = q;
            totAmu1 = Convert.ToDecimal(txtto.Text);
            dt.Rows[index]["quantity"] = quant.ToString();
            dt.Rows[index]["total"] = totAmu1.ToString("0.00");

            Session["shoppingcart"] = dt;
        }
        int quantity = 0;
        decimal totalamount = 0;
        lvlTotalVat.Text = "0";
        foreach (GridViewRow row in GridView1.Rows)
        {
            Label lvlVatAmount = (Label)row.FindControl("lvlVatAmount");
            Label lbltotal = (Label)row.FindControl("lbltotal");
            Label hfvatamount = (Label)row.FindControl("lblhfvatamount");
            total = Convert.ToDecimal(lbltotal.Text);
            vat = Convert.ToDecimal(hfvatamount.Text);
            vatAmount = (total * vat) / 100;
            lvlVatAmount.Text = vatAmount.ToString("0.00");
            totalamount = totalamount + total;
            lvlTotalVat.Text = (Convert.ToDecimal(lvlTotalVat.Text) + vatAmount).ToString("0.00");
            TextBox LblQ = (TextBox)row.FindControl("LblQ");
            quantity += Convert.ToInt32(LblQ.Text);
            lvlTotalQuantity.Text = quantity.ToString();
        }
        lbltotalP.Text = quantity.ToString();
        lbltotalP1.Text = quantity.ToString();
        lblNetAmount.Text = totalamount.ToString();
        lblNetAmount1.Text = totalamount.ToString();
        lvlTotalVatAmount.Text = lvlTotalVat.Text;
        lvlTotalVatAmount1.Text = lvlTotalVat.Text;
        lblTotal.Text = (totalamount + Convert.ToDecimal(lvlTotalVat.Text)).ToString("0.00");
        lblTotal1.Text = (totalamount + Convert.ToDecimal(lvlTotalVat.Text)).ToString();

        Response.Redirect(Request.RawUrl);
    }
    protected void btncheckout_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["Loginfo"] as string))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('You Need To Login First');", true);
            return;
        }

        string email = Session["Loginfo"].ToString();
        string Password = Session["Passwords"].ToString();

        //string Date = Session["Date"].ToString();

       // Label total = (Label)GridView1.FooterRow.FindControl("lbltt");

        DataTable CheckDistance = mydal.CheckDistance(email, Password);

        string ShoppingType = Session["ShoppingType"].ToString();
        //if (ShoppingType == "Collection")
        //{
        //    pan1.Visible = true;
        //    pnl2.Visible = false;
        //    return;
        //}

        if (CheckDistance.Rows.Count > 0)
        {
            string distance = CheckDistance.Rows[0]["Distance"].ToString();

            if (double.Parse(distance) <= 50)
            {
                if (double.Parse(lblTotal.Text) >= 150)
                {
                    pan1.Visible = true;
                    pnl2.Visible = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Delivery minimun shopping limit £150 Or More');", true);
                }
            }

            if (double.Parse(distance) <= 100 && double.Parse(distance) >= 51)
            {
                if (double.Parse(lblTotal.Text) >= 200)
                {
                    pan1.Visible = true;
                    pnl2.Visible = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Delivery minimun shopping limit £200 Or More');", true);
                }
            }

            if (double.Parse(distance) >= 101 && double.Parse(distance) <= 150)
            {
                if (double.Parse(lblTotal.Text) >= 250)
                {
                    pan1.Visible = true;
                    pnl2.Visible = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Delivery minimun shopping limit £250 Or More');", true);
                }
            }
        }
    }
    protected void btnorder_Click(object sender, EventArgs e)
    {
        string orderid = "";
        string customerid = "";
        string DeliveryDate = "";
        string ShoppingType = "";
        string TimeSlot = "";

        string SpecialRequist = "";

        //string que = "select id from TblOrder order by id DESC";
        //SqlCommand cm = new SqlCommand(que, con);
        //SqlDataAdapter adpter = new SqlDataAdapter(cm);
        //DataTable dt = new DataTable();
        //adpter.Fill(dt);
        DataTable dt = mydal.GetOrderid();
        if (dt.Rows.Count > 0)
        {
            orderid = "OSN" + dt.Rows[0]["id"].ToString();
            customerid = Session["Loginfo"].ToString();
            DeliveryDate = Session["Date"].ToString();
            ShoppingType = Session["ShoppingType"].ToString();
            TimeSlot = Session["Timeslot"].ToString();
        }

        foreach (GridViewRow row in GridView1.Rows)
        {
            Label pid = (Label)row.FindControl("lblid");
            Label Barcode = (Label)row.FindControl("lblBarcode");
            Label pname = (Label)row.FindControl("lblpname");
            TextBox quantity = (TextBox)row.FindControl("LblQ");
            Label price = (Label)row.FindControl("lblprice");
            Label lbltotal = (Label)row.FindControl("lbltotal");
            Label lblhfvatamount = (Label)row.FindControl("lblhfvatamount");
            string date = Convert.ToDateTime(DateTime.Now).Date.ToString("d");

            bool SaveOrder = mydal.SaveOrder(orderid, pid.Text, pname.Text, quantity.Text, price.Text, lbltotal.Text, customerid, date, Barcode.Text, DeliveryDate, ShoppingType, TimeSlot, SpecialRequist, lblhfvatamount.Text);

            ScriptManager.RegisterStartupScript(this, GetType(), "Success", "alert('Submit Successfylly');", true);
        }
        DataTable dt1 = mydal.GetOrderDetails(orderid);
        // SendPDFEmail(dt1);
    }

    protected void btncontinue_Click(object sender, EventArgs e)
    {
        string shoppingType = "Collection";
        if (Session["ShoppingType"] != null)
        {
            shoppingType = Session["ShoppingType"].ToString();
        }
        DataTable date = (DataTable)Session["shoppingcart"];
        if (Session["shoppingcart"] != null)
        {
            //var url = String.Format("../../Default.aspx?Loggenin={0} &Passwords={1} &Date={2} &ShoppingType={3} &Timeslot={4}", Session["Email"].ToString(), Session["Password"].ToString(), Session["Date"].ToString(), "Collection", ddlcollectiontimeslot.SelectedValue);
            // var url = String.Format("../../Default.aspx?Loggenin={0} &Passwords={1} &Date={2}&ShoppingType={3}&Timeslot={4} &Date1={5}", Session["Email"].ToString(), Session["Password"].ToString(), Session["Date"].ToString(), shoppingType, "No", "0");
            var url = String.Format("../../Pages/MyAccount/Default.aspx");
            Response.Redirect(url);
        }
        else
        {

        }
        var ur = String.Format("../../Home.aspx");
        Response.Redirect(ur);

        string ShoppingType = Session["ShoppingType"].ToString();
        string TimeSlot = Session["Timeslot"].ToString();
        string DeliveryDate = Session["Date"].ToString();
        string Email = Session["Loginfo"].ToString();

        string Password = Session["Passwords"].ToString();

        if (ShoppingType.ToString() == "Delivery")
        {
            ur = String.Format("../../Default.aspx?Loggenin={0} &Passwords={1} &Date={2} &ShoppingType={3} &Timeslot={4} ", Email, Password, DeliveryDate, "Delivery", "No");
            Response.Redirect(ur);
        }

        if (ShoppingType.ToString() == "Collection")
        {

            ur = String.Format("../../Default.aspx?Loggenin={0} &Passwords={1} &Date={2} &ShoppingType={3} &Timeslot={4}", Email, Password, DeliveryDate, "Collection", TimeSlot);
            Response.Redirect(ur);

        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string DeliveryDate = "";
        string ShoppingType = "";
        string TimeSlot = "";

        //adpter.Fill(dt);
        DataTable dt = mydal.GetOrderid();
        if (dt.Rows.Count > 0)
        {
            DeliveryDate = Session["Date"].ToString();
            ShoppingType = Session["ShoppingType"].ToString();
            TimeSlot = Session["Timeslot"].ToString();
        }

        string Email = Session["Loginfo"].ToString();
        string Password = Session["Passwords"].ToString();

        string shoppingType = "Collection";
        if (Session["ShoppingType"] != null)
        {
            shoppingType = Session["ShoppingType"].ToString();
        }
        DataTable date = (DataTable)Session["shoppingcart"];
        //var url = String.Format("../../Default.aspx?Loggenin={0} &Passwords={1} &Date={2} &ShoppingType={3} &Timeslot={4}", Email, Password, DeliveryDate, "Collection", TimeSlot);
        var url = String.Format("../../Default.aspx?Loggenin={0} &Date={1} &ShoppingType={2} &Timeslot={3} &Date1={4}", Email, DeliveryDate, shoppingType, TimeSlot, "0");
        Response.Redirect(url);

    }
    protected void place_order_Click(object sender, EventArgs e)
    {
        string orderid = "";
        string customerid = "";
        string DeliveryDate = "";
        string ShoppingType = "";
        string TimeSlot = "";

        string SpecialRequist = "";

        //string que = "select id from TblOrder order by id DESC";
        //SqlCommand cm = new SqlCommand(que, con);
        //SqlDataAdapter adpter = new SqlDataAdapter(cm);
        //DataTable dt = new DataTable();
        //adpter.Fill(dt);
        DataTable dt = mydal.GetOrderid();
        if (dt.Rows.Count > 0)
        {
            orderid = "OSN" + dt.Rows[0]["id"].ToString();
            customerid = Session["Loginfo"].ToString();
            DeliveryDate = Session["Date"].ToString();
            ShoppingType = Session["ShoppingType"].ToString();
            TimeSlot = Session["Timeslot"].ToString();
        }

        foreach (GridViewRow row in GridView1.Rows)
        {
            Label pid = (Label)row.FindControl("lblid");
            Label Barcode = (Label)row.FindControl("lblBarcode");
            Label pname = (Label)row.FindControl("lblpname");
            TextBox quantity = (TextBox)row.FindControl("LblQ");
            Label price = (Label)row.FindControl("lblprice");
            Label lbltotal = (Label)row.FindControl("lbltotal");
            Label lblhfvatamount = (Label)row.FindControl("lvlVatAmount");
            string date = Convert.ToDateTime(DateTime.Now).Date.ToString("d");

            bool SaveOrder = mydal.SaveOrder(orderid, pid.Text, pname.Text, quantity.Text, price.Text, lbltotal.Text, customerid, date, Barcode.Text, DeliveryDate, ShoppingType, TimeSlot, SpecialRequist, lblhfvatamount.Text);

            if (SaveOrder)
            {
                Session["shoppingcart"] = null;
                string strconfirm = "<script>if(window.confirm('Submit Successfull')){window.location.href='../../Default.aspx'}</script>";
                ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirm, false);
            }
        }

    }

    protected void imgBtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        //ImageButton btnimg = sender as ImageButton;
        //GridViewRow gvr = btnimg.NamingContainer as GridViewRow;

        //DataTable dt = (DataTable)Session["shoppingcart"];
        //if (dt.Rows.Count > 0)
        //{
        //    dt.Rows[e.RowIndex].Delete();
        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();
        //    Label count = Page.Master.FindControl("lblcount") as Label;
        //    count.Text = dt.Rows.Count.ToString();
        //}
    }

    protected void LblQ_TextChanged(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(((TextBox)sender).NamingContainer);
        //GridViewRow gvRow = GridView1.Rows[index];
        TextBox txtq = (TextBox)gvRow.FindControl("LblQ");
        Label price = (Label)gvRow.FindControl("lblprice");
        Label txtto = (Label)gvRow.FindControl("lbltotal");
        Label footertotal = (Label)GridView1.FooterRow.FindControl("lbltt");
        Label lvlTotalQuantity = (Label)GridView1.FooterRow.FindControl("lvlTotalQuantity");
        Label lvlTotalVat = (Label)GridView1.FooterRow.FindControl("lvlTotalVat");
        
        string commandArg = txtq.Attributes["CommandArgument"].ToString();
        int index = Convert.ToInt32(commandArg);
        int q = Convert.ToInt32(txtq.Text) - 1;
        if (q > 0)
        {
            txtto.Text = (Convert.ToDouble(txtq.Text) * Convert.ToDouble(price.Text)).ToString("0.00");
            //footertotal.Text = (Convert.ToDouble(footertotal.Text) - Convert.ToDouble(price.Text)).ToString();

            DataTable dt = (DataTable)Session["shoppingcart"];
            decimal quant = Convert.ToDecimal(txtq.Text);
            decimal totAmu1 = quant * Convert.ToDecimal(dt.Rows[index]["price"]);
            dt.Rows[index]["quantity"] = quant.ToString();
            dt.Rows[index]["total"] = totAmu1.ToString("0.00");

            Session["shoppingcart"] = dt;
            Label count = Page.Master.FindControl("lblcount") as Label;
            count.Text = dt.Rows.Count.ToString();

            decimal quantity = 0;
            decimal totalamount = 0;
            lvlTotalVat.Text = "0";
            foreach (GridViewRow row in GridView1.Rows)
            {
                Label lvlVatAmount = (Label)row.FindControl("lvlVatAmount");
                Label lbltotal = (Label)row.FindControl("lbltotal");
                Label hfvatamount = (Label)row.FindControl("lblhfvatamount");
                total = Convert.ToDecimal(lbltotal.Text);
                vat = Convert.ToDecimal(hfvatamount.Text);
                vatAmount = (total * vat) / 100;
                lvlVatAmount.Text = vatAmount.ToString("0.00");
                totalamount = totalamount + total;
                lvlTotalVat.Text = (Convert.ToDecimal(lvlTotalVat.Text) + vatAmount).ToString("0.00");
                TextBox LblQ = (TextBox)row.FindControl("LblQ");
                quantity += Convert.ToInt32(LblQ.Text);
                lvlTotalQuantity.Text = quantity.ToString();
            }
            lbltotalP.Text = quantity.ToString();
            lbltotalP1.Text = quantity.ToString();
            lblNetAmount.Text = totalamount.ToString();
            lblNetAmount1.Text = totalamount.ToString();
            lvlTotalVatAmount.Text = lvlTotalVat.Text;
            lvlTotalVatAmount1.Text = lvlTotalVat.Text;
            lblTotal.Text = (totalamount + Convert.ToDecimal(lvlTotalVat.Text)).ToString("0.00");
            lblTotal1.Text = (totalamount + Convert.ToDecimal(lvlTotalVat.Text)).ToString("0.00");

            Response.Redirect(Request.RawUrl);
        }

    }


}