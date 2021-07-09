using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Set_AddProducts : System.Web.UI.Page
{

    public static String CS = ConfigurationManager.ConnectionStrings["DBcon"].ConnectionString;
    SqlConnection con = new SqlConnection();

    DAL mydal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        //var user = Session["Email"].ToString();
        //lblusername.Text = user;

        if (!IsPostBack)
        {
            if (Request.QueryString["PIMGID"] != null)
            {
                BindCategory();
                BindBrands();
                allsize();
                BindSubcategory();
                getProductByPID();
                btnupdate.Visible = true;
                btnAdd.Visible = false;
            }
            else
            {


                BindBrands();
                BindCategory();
                GetVoucher();
                //showallsize();
                allsize();
                //LoadSubcategory();
            }
        }
    }

    private void getProductByPID()
    {
        Int64 id = Convert.ToInt64(Request.QueryString["PIMGID"]);
        DataTable dt = mydal.getProductByPID(id);
        if (dt.Rows.Count > 0)
        {
            //for (int i = 0; i <= dt.Rows.Count; i++)
            //{

            txtVoucherNo.Text = dt.Rows[0]["VoucherNo"].ToString();
            txtproductcode.Text = dt.Rows[0]["ProductCode"].ToString();
            txtPName.Text = dt.Rows[0]["PName"].ToString();
            ddlCategory.SelectedValue = dt.Rows[0]["CategoryID"].ToString();
            lblPID.Text = dt.Rows[0]["PID"].ToString();
            //ddlSubCategory.SelectedValue = dt.Rows[0]["SubCategoryID"].ToString();
            txtQuantity.Text = dt.Rows[0]["Quantity"].ToString();
            txtPrice.Text = dt.Rows[0]["PPrice"].ToString();
            txtSelPrice.Text = dt.Rows[0]["PSelPrice"].ToString();
            txtcololdprice.Text = dt.Rows[0]["CollectionOldPrice"].ToString();
            txtcollprice.Text = dt.Rows[0]["CollectionPrice"].ToString();
            txtunit.Text = dt.Rows[0]["Unit"].ToString();
            txtdiscount.Text = dt.Rows[0]["Discount"].ToString();
            txtvat.Text = dt.Rows[0]["Vat"].ToString();
            ddlBrands.SelectedValue = dt.Rows[0]["PBrandID"].ToString();
            //cblSize2.SelectedValue = dt.Rows[0]["SizeID"].ToString();
            //txtDesc.Text= dt.Rows[0]["PDescription"].ToString();
            //txtPDetails.Text= dt.Rows[0]["PProductDetails"].ToString();
            txtingredients.Text = dt.Rows[0]["Ingredients"].ToString();
            txtnutritionvalue.Text = dt.Rows[0]["NutritionValue"].ToString();
            txtallergiadvice.Text = dt.Rows[0]["AllergyAdvice"].ToString();
            txtoccationname.SelectedValue = dt.Rows[0]["Occation"].ToString();
            txtoccationdesc.Text = dt.Rows[0]["OccationDesc"].ToString();
            txtoccationremaining.Text = dt.Rows[0]["OccationRemain"].ToString();
            ddlsection.SelectedValue = dt.Rows[0]["Section"].ToString();

            //lblimagename.Text= dt.Rows[0]["Name"].ToString();

            //}
            foreach (ListItem item in txtoccationname.Items)
            {
                if (dt.Rows[0]["Occation"].ToString() == item.Text)
                {
                    item.Selected = true;
                }
            }

            btnDelete.Visible = true;

            DataTable dt1 = new DAL().GetImageformImagetable(id.ToString());
            if (dt1.Rows.Count > 0)
            {
                rptredit.Visible = true;
                rptredit.DataSource = dt1;
                rptredit.DataBind();
            }



            //imgCurrent1.Visible = false;
            fuImg03.Visible = false;
            fuImg02.Visible = false;
            fuImg01.Visible = false;
            Label13.Visible = false;
            Label14.Visible = false;
            Label16.Visible = false;
            //Image2.Visible = true;
            Image1.Visible = true;
            //Image3.Visible = true;
            Label27.Visible = true;
            //Label10.Visible = true;
            //Label11.Visible = true;
            FileUploadedit.Visible = true;
            //FileUploadedit1.Visible = true;
            //FileUploadedit2.Visible = true;

            string PID = Request.QueryString["PIMGID"];
            DataTable searchSize = mydal.GetProductSizeById(PID);
            if (searchSize.Rows.Count > 0)
            {
                int i = 0;
                for (i = 0; i < searchSize.Rows.Count; i++)
                {
                    foreach (ListItem item in cblSize2.Items)
                    {
                        if (searchSize.Rows[i]["SizeId"].ToString() == item.Value)
                        {
                            //cblSize2.SetItemChecked(i, true);
                            //cblSize2.SelectedIndex = Convert.ToInt32(searchSize.Rows[i]["SizeId"]);
                            item.Selected = true;
                        }
                    }
                }
            }

            DataTable searchSection = mydal.GetProductSectionById(PID);
            if (searchSection.Rows.Count > 0)
            {
                int i = 0;
                for (i = 0; i < searchSection.Rows.Count; i++)
                {
                    foreach (ListItem item in ddlsection.Items)
                    {
                        if (searchSection.Rows[i]["Section"].ToString() == item.Value)
                        {
                            //ddlsection.SelectedIndex = Convert.ToInt32(searchSection.Rows[i]["Section"]);
                            item.Selected = true;
                        }
                    }
                }
            }


            DataTable searchCategory = mydal.GetProductCategoryById(PID);
            if (searchCategory.Rows.Count > 0)
            {
                int i = 0;
                for (i = 0; i < searchCategory.Rows.Count; i++)
                {
                    foreach (ListItem item in ddlCategory.Items)
                    {
                        if (searchCategory.Rows[i]["CategoryId"].ToString() == item.Value)
                        {
                            //ddlCategory.SelectedIndex = Convert.ToInt32(searchCategory.Rows[i]["CategoryId"]);
                            item.Selected = true;
                        }
                    }
                }
            }

            DataTable searchSubCategory = mydal.GetProductSubCategoryById(PID);
            if (searchSubCategory.Rows.Count > 0)
            {
                int i = 0;
                for (i = 0; i < searchSubCategory.Rows.Count; i++)
                {
                    foreach (ListItem item in ddlSubCategory.Items)
                    {
                        if (searchSubCategory.Rows[i]["SubCategoryID"].ToString() == item.Value)
                        {
                            //ddlSubCategory.SelectedIndex = Convert.ToInt32(searchSubCategory.Rows[i]["SubCategoryID"]);
                            item.Selected = true;
                        }
                    }
                }
            }

            DataTable searchBrand = mydal.GetProductBrandById(PID);
            if (searchBrand.Rows.Count > 0)
            {
                int i = 0;
                for (i = 0; i < searchBrand.Rows.Count; i++)
                {
                    foreach (ListItem item in ddlBrands.Items)
                    {
                        if (searchBrand.Rows[i]["BrandID"].ToString() == item.Value)
                        {
                            //ddlBrands.SelectedIndex = Convert.ToInt32(searchBrand.Rows[i]["BrandID"]);
                            item.Selected = true;
                        }
                    }
                }
            }
        }
    }

    private void BindCategory()
    {
        DataTable dt = mydal.GetallCategories();
        if (dt.Rows.Count > 0)
        {
            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "MenuText";
            ddlCategory.DataValueField = "Id";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
        }
    }

    private void BindBrands()
    {
        DataTable dt = mydal.GetallBrands();
        if (dt.Rows.Count != 0)
        {
            ddlBrands.DataSource = dt;
            ddlBrands.DataTextField = "BrandName";
            ddlBrands.DataValueField = "ID";
            ddlBrands.DataBind();
            //ddlBrands.Items.Insert(0, new ListItem("-Select-", "0"));
        }
    }


    private void BindSubcategory()
    {
        DataTable dt = mydal.getSubCategoryByonly();
        if (dt.Rows.Count != 0)
        {
            ddlSubCategory.DataSource = dt;
            ddlSubCategory.DataTextField = "MenuText";
            ddlSubCategory.DataValueField = "Id";
            ddlSubCategory.DataBind();
            //ddlBrands.Items.Insert(0, new ListItem("-Select-", "0"));
        }
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {

        string MainCategoryID = ddlCategory.SelectedValue;

        DataTable dt = mydal.getSubCategoryByCategort(MainCategoryID);

        if (dt.Rows.Count != 0)
        {

            ddlSubCategory.DataSource = dt;
            ddlSubCategory.DataTextField = "MenuText";
            ddlSubCategory.DataValueField = "Id";
            ddlSubCategory.DataBind();
            //ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));
        }
    }



    public void GetVoucher()
    {
        DataTable dt = mydal.GetVoucher();
        txtVoucherNo.Text = "VN/" + DateTime.Now.Year + "/" + dt.Rows[0][0].ToString();
    }

    public void clear()
    {
        txtVoucherNo.Text = "";
        txtPName.Text = "";
        txtPrice.Text = "";
        txtSelPrice.Text = "";
        txtQuantity.Text = "";
        //ddlBrands.SelectedItem.Value = "";
        ddlCategory.ClearSelection();
        ddlSubCategory.ClearSelection();
        //txtDesc.Text = "";
        //txtPDetails.Text = "";
        //txtproductid.Text = "";
        txtunit.Text = "";
        cblSize2.SelectedItem.Text = "";
        txtcollprice.Text = "";
        txtcololdprice.Text = "";
        //ddlsection.SelectedItem.Value = "";
    }
    protected void txtproductcode_TextChanged(object sender, EventArgs e)
    {
        DataTable SameProductCodeCheck = mydal.CheckSameProduct(txtproductcode.Text);
        if (SameProductCodeCheck.Rows.Count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ale", "alert('Same Product Code Is Not Allowed');", true);

        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DataTable SameProductCodeCheck = mydal.CheckSameProduct(txtproductcode.Text);
        if (SameProductCodeCheck.Rows.Count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ale", "alert('Same Product Code Is Not Allowed');", true);

        }
        else
        {


            string[] insert = new string[30];
            insert[0] = txtVoucherNo.Text;
            insert[1] = txtPName.Text;
            //insert[2] = ddlCategory.SelectedValue;
            //insert[3] = ddlSubCategory.SelectedValue;
            //insert[4] = txtproductid.Text;
            insert[5] = txtQuantity.Text;
            insert[6] = txtPrice.Text;
            insert[7] = txtSelPrice.Text;
            insert[8] = txtunit.Text;
            //insert[9] = ddlBrands.SelectedValue; ;
            //insert[10] = cblSize2.SelectedValue;
            //insert[11] = txtDesc.Text;
            //insert[12] = txtPDetails.Text;
            insert[13] = DateTime.Now.ToString();
            insert[14] = txtcollprice.Text;
            insert[15] = txtproductcode.Text;
            insert[16] = txtvat.Text;
            insert[17] = txtdiscount.Text;
            insert[18] = txtoccationname.SelectedItem.Text;
            insert[19] = txtoccationdesc.Text;
            insert[20] = txtoccationremaining.Text;
            insert[21] = txtcololdprice.Text;
            insert[22] = txtingredients.Text;
            insert[23] = txtnutritionvalue.Text;
            insert[24] = txtallergiadvice.Text;
            //insert[25] = ddlsection.SelectedValue;

            bool IsSuccess = mydal.insertProduct(insert);

            if (IsSuccess == true)
            {
                string PID = "0";
                DataTable PIDsearch = mydal.SelectMaxPID();
                if (PIDsearch.Rows.Count > 0)
                {
                    PID = PIDsearch.Rows[0]["PID"].ToString();
                }

                /////  InsertProductsizequantity  //////////////// 

                foreach (ListItem item in cblSize2.Items)
                {
                    if (item.Selected)
                    {
                        string SizeID = item.Value;
                        int Quantity = Convert.ToInt32(txtQuantity.Text);

                        bool insertProductsizequantity = mydal.insertProductsizequantity(PID, SizeID, Quantity);
                    }
                }

                foreach (ListItem item in ddlsection.Items)
                {
                    if (item.Selected)
                    {
                        string sectionId = item.Value;
                        int Quantity = Convert.ToInt32(txtQuantity.Text);

                        bool insertProductsizequantity = mydal.insertSectionCategory(PID, sectionId);
                    }
                }



                ///////Insert ProductCategory /////////////


                foreach (ListItem item in ddlCategory.Items)
                {
                    if (item.Selected)
                    {
                        string Category = item.Value;

                        bool insertProductCategory = mydal.insertProductCategory(PID, Category);
                    }
                }

                /////// Insert SubCategory ////
                foreach (ListItem item in ddlSubCategory.Items)
                {
                    if (item.Selected)
                    {
                        string SubCategory = item.Value;

                        bool insertProductSubCategory = mydal.insertProductSubCategory(PID, SubCategory);
                    }
                }



                ///////////Insert Multiple ProductBrand//////////
                foreach (ListItem item in ddlBrands.Items)
                {
                    if (item.Selected)
                    {
                        string Brand = item.Value;

                        bool insertProductBrand = mydal.insertProductBrand(PID, Brand);
                    }
                }



                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    //Insert and upload Images

                    if (fuImg01.HasFile)
                    {
                        string SavePath = Server.MapPath("~/ProductImage/") + PID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);
                        }
                        string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                        fuImg01.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "01" + Extention);
                        SqlCommand cmd3 = new SqlCommand("insert into  tblProductImages (PID,Name,Extention) values('" + PID + "',N'" + txtPName.Text.ToString().Trim() + "01" + "','" + Extention + "')", con);
                        cmd3.ExecuteNonQuery();
                    }

                    if (fuImg02.HasFile)
                    {
                        string SavePath = Server.MapPath("~/ProductImage/") + PID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);
                        }
                        string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                        fuImg02.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "02" + Extention);


                        SqlCommand cmd4 = new SqlCommand("insert into tblProductImages (PID,Name,Extention) values('" + PID + "',N'" + txtPName.Text.ToString().Trim() + "02" + "','" + Extention + "')", con);
                        cmd4.ExecuteNonQuery();
                    }
                    if (fuImg03.HasFile)
                    {
                        string SavePath = Server.MapPath("~/ProductImage/") + PID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);
                        }
                        string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                        fuImg03.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "03" + Extention);


                        SqlCommand cmd5 = new SqlCommand("insert into tblProductImages (PID,Name,Extention) values('" + PID + "',N'" + txtPName.Text.ToString().Trim() + "03" + "','" + Extention + "')", con);
                        cmd5.ExecuteNonQuery();

                    }
                }

            }

            clear();
            string strconfirmd = "<script>if(window.confirm('Save Successfull')){window.location.href='AddProducts.aspx'}</script>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Confirm", strconfirmd, false);
        }
    }

    protected void allsize()
    {
        DataTable dt = mydal.GetallSize();
        if (dt.Rows.Count != 0)
        {
            cblSize2.DataSource = dt;
            cblSize2.DataTextField = "SizeName";
            cblSize2.DataValueField = "ID";
            cblSize2.DataBind();
            //cblSize2.Items.Insert(0, new ListItem("-Select-", "0"));
        }
    }



    protected void btnupdate_Click(object sender, EventArgs e)
    {
        Int64 id = Convert.ToInt64(Request.QueryString["PIMGID"]);//This is not imageid it is PID
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            foreach (RepeaterItem item in rptredit.Items)
            {

                CheckBox imgcheck = item.FindControl("imgcheck") as CheckBox;
                Label Imagename = item.FindControl("lblimagename") as Label;

                if (imgcheck.Checked)
                {
                    string SavePath = Server.MapPath("~/ProductImage/") + id.ToString();
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(FileUploadedit.PostedFile.FileName);
                    FileUploadedit.SaveAs(SavePath + "\\" + Imagename.Text.ToString().Trim() + Extention);
                    SqlCommand cmd3 = new SqlCommand("update tblProductImages set  Extention='" + Extention + "' where PIMGID='" + imgcheck.Text + "' ", con);
                    cmd3.ExecuteNonQuery();

                }

            }





            //if (FileUploadedit.HasFile)
            //{
            //    string SavePath = Server.MapPath("~/ProductImage/") + lblPID.Text;
            //    if (!Directory.Exists(SavePath))
            //    {
            //        Directory.CreateDirectory(SavePath);
            //    }
            //    string Extention = Path.GetExtension(FileUploadedit.PostedFile.FileName);
            //    FileUploadedit.SaveAs(SavePath + "\\" + lblimagename.Text.ToString().Trim() + Extention);
            //    SqlCommand cmd3 = new SqlCommand("update tblProductImages set Name= N'" + lblimagename.Text.ToString().Trim() + "', Extention='" + Extention + "' where PIMGID='" + id + "' ", con);
            //    cmd3.ExecuteNonQuery();
            //}

            string[] insert = new string[30];
            insert[0] = txtVoucherNo.Text;
            insert[1] = txtPName.Text;
            //insert[2] = ddlCategory.SelectedValue;
            //insert[3] = ddlSubCategory.SelectedValue;
            //insert[4] = txtproductid.Text;
            insert[5] = txtQuantity.Text;
            insert[6] = txtPrice.Text;
            insert[7] = txtSelPrice.Text;
            insert[8] = txtunit.Text;
            //insert[9] = ddlBrands.SelectedValue; ;
            //insert[10] = cblSize2.SelectedValue;
            //insert[11] = txtDesc.Text;
            //insert[12] = txtPDetails.Text;
            insert[13] = DateTime.Now.ToString();
            insert[14] = txtcollprice.Text;
            insert[15] = txtproductcode.Text;
            insert[16] = txtvat.Text;
            insert[17] = txtdiscount.Text;
            insert[18] = txtoccationname.SelectedItem.Text;
            insert[19] = txtoccationdesc.Text;
            insert[20] = txtoccationremaining.Text;
            insert[21] = txtcololdprice.Text;
            insert[22] = txtingredients.Text;
            insert[23] = txtnutritionvalue.Text;
            insert[24] = txtallergiadvice.Text;
            //insert[25] = ddlsection.SelectedValue;


            bool update = mydal.UpdateTblproducts(insert, id.ToString());


            /////  InsertProductsizequantity  //////////////// 
            string PID = Request.QueryString["PIMGID"].ToString();
            bool deleteSize = mydal.DeleteProductSize(PID);
            foreach (ListItem item in cblSize2.Items)
            {
                if (item.Selected)
                {
                    string SizeID = item.Value;
                    int Quantity = Convert.ToInt32(txtQuantity.Text);
                    //bool insertProductsizequantity = mydal.UpdateProductsizequantity(id.ToString(), SizeID, Quantity);
                    bool insertProductsizequantity = mydal.insertProductsizequantity(PID, SizeID, Quantity);
                }
            }



            ///////Insert ProductCategory /////////////

            bool deleteCategory = mydal.DeleteProductCategory(PID);
            foreach (ListItem item in ddlCategory.Items)
            {
                if (item.Selected)
                {
                    string Category = item.Value;

                    // bool insertProductCategory = mydal.UpdateProductCategory(id.ToString(), Category);
                    bool insertProductCategory = mydal.insertProductCategory(PID, Category);
                }
            }

            /////// Insert SubCategory ////
            bool deleteSubCategory = mydal.DeleteProductSubCategory(PID);
            foreach (ListItem item in ddlSubCategory.Items)
            {
                if (item.Selected)
                {
                    string SubCategory = item.Value;

                    //bool insertProductSubCategory = mydal.UpdateProductSubCategory(id.ToString(), SubCategory);
                    bool insertProductSubCategory = mydal.insertProductSubCategory(PID, SubCategory);
                }
            }

            //bool deleteBrand = mydal.DeleteProductBrand(PID);
            //foreach (ListItem item in ddlBrands.Items)
            //{

            //    DataTable getrowid = mydal.GetBrandsRowID(id.ToString(), item.Value);

            //    //{
            //    //for (int i = 0; i <= Convert.ToInt32(getrowid.Rows.Count) - 1; i++)
            //    //{
            //    string rowID = "";
            //    if (getrowid.Rows.Count > 0)
            //        rowID = getrowid.Rows[0]["ID"].ToString();

            //    if (item.Selected)
            //    {
            //        string Brand = item.Value;
            //        bool insertProductBrand = mydal.UpdateProductBrand(rowID, Brand);
            //    }
            //    //}
            //    //}
            //}
            bool deleteBand = mydal.DeleteProductBrand(PID);
            foreach (ListItem item in ddlBrands.Items)
            {
                if (item.Selected)
                {
                    string Brand = item.Value;

                    bool insertProductBrand = mydal.insertProductBrand(PID, Brand);
                }
            }

            bool deleteSection = mydal.DeleteProductSection(PID);
            foreach (ListItem item in ddlsection.Items)
            {
                if (item.Selected)
                {
                    string sectionId = item.Value;
                    int Quantity = Convert.ToInt32(txtQuantity.Text);

                    bool insertProductsizequantity = mydal.insertSectionCategory(PID, sectionId);
                }
            }
            ///////////Insert Multiple ProductBrand//////////
        }
        Response.Redirect("AddProducts.aspx?PIMGID="+id+"");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Int64 id = Convert.ToInt64(Request.QueryString["PIMGID"]);//This is not imageid it is PID
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            foreach (RepeaterItem item in rptredit.Items)
            {

                CheckBox imgcheck = item.FindControl("imgcheck") as CheckBox;
                Label Imagename = item.FindControl("lblimagename") as Label;

                if (imgcheck.Checked)
                {
                    string SavePath = Server.MapPath("~/ProductImage/") + id.ToString();
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(FileUploadedit.PostedFile.FileName);
                    FileUploadedit.SaveAs(SavePath + "\\" + Imagename.Text.ToString().Trim() + Extention);
                    SqlCommand cmd3 = new SqlCommand("Delete from tblProductImages where PIMGID='" + imgcheck.Text + "' ", con);
                    cmd3.ExecuteNonQuery();

                }
                //if (rptredit.Visible == false)
                //{
                //    string SavePath = Server.MapPath("~/ProductImage/") + id.ToString();
                //    if (!Directory.Exists(SavePath))
                //    {
                //        Directory.CreateDirectory(SavePath);
                //    }
                //    string Extention = Path.GetExtension(FileUploadedit.PostedFile.FileName);
                //    FileUploadedit.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "01" + Extention);
                //    SqlCommand cmd3 = new SqlCommand("insert into tblProductImages values('" + id.ToString() + "',N'" + txtPName.Text.ToString().Trim() + "01" + "','" + Extention + "')", con);
                //    cmd3.ExecuteNonQuery();
                //}

            }
        }
        Response.Redirect("EditProduct.aspx");
    }

}