using System;
using System.Activities.Expressions;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.UI;
using System.Data.Common;
using System.Data.SqlClient;
using DataSet = System.Data.DataSet;

public class DAL
{

    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBcon"].ConnectionString);
    SqlCommand sqlcmd = null;



    public void con()
    {
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }
        cn.Open();
    }



    bool returnbool = false;


    public SqlConnection Connection
    {
        get
        {
            return cn;
        }
    }



    public bool SizeDeletebyid(string id)
    {
        try
        {
            con();
            string Save = "Delete from ProductSize where ID=@ID";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@ID", id);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }
    public DataTable DeleteCustomerOrder(string id2)
    {
        con();
        string id = @"Delete from tblOrder2 where Id='" + id2 + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetCustomerOrder()
    {
        con();
        string id = @"select tblOrder.orderid, tblOrder.ShoppingType,CustomerRegistration.FirstName,tblOrder.Customerid,tblOrder.Date,tblOrder.Status,Sum(tblOrder.Total) as Total, SUM(Vat) as Vat  from tblOrder inner join CustomerRegistration on CustomerRegistration.Email=TblOrder.Customerid group by tblOrder.orderid, tblOrder.ShoppingType,CustomerRegistration.FirstName,tblOrder.Customerid,tblOrder.Date,tblOrder.Status order by tblOrder.Date desc";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetCustomerOrder(string cid)
    {
        con();
        string id = @"select * from tblOrder where Customerid='" + cid + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetCustomerInfo(string cid)
    {
        con();
        string id = @"select * from CustomerRegistration where Email='" + cid + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetCustomerOrder(string email, string orderId)
    {
        con();
        string sql = @" select tblProducts.ProductCode, tblOrder.orderid, tblOrder.ShoppingType,CustomerRegistration.FirstName,tblOrder.Customerid,tblOrder.Date,tblOrder.Status,Sum(tblOrder.Total) as Total,Sum(tblOrder.Price) as Price,tblOrder.DeliveyDate ,tblOrder.BillingAddress, tblOrder.Note,tblOrder.Pid, tblOrder.Pname,tblOrder.Quantity,Isnull(tblOrder.Vat,0) as Vat from tblOrder tblOrder inner join tblProducts on tblProducts.PID=TblOrder.Pid inner join CustomerRegistration on CustomerRegistration.Email=TblOrder.Customerid Where orderid='" + orderId + "' and Customerid='" + email + "' group by tblProducts.ProductCode, tblOrder.orderid, tblOrder.ShoppingType,CustomerRegistration.FirstName,tblOrder.Customerid,tblOrder.Date,tblOrder.Status,tblOrder.DeliveyDate,tblOrder.BillingAddress,tblOrder.Note,tblOrder.Pid,tblOrder.Pname,tblOrder.Quantity,tblOrder.Vat order by tblOrder.Date desc  ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetCustomerInvoice(string email, string orderId)
    {
        con();
        string sql = @"select orderid,Date,ShoppingType,Status,SUM(Total) as Total from TblOrder where orderid='" + orderId + "' and Customerid='" + email + "' and Status='Processing' group by orderid,Date,ShoppingType,Status "; ;
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        da.Fill(dta);
        return dta;
    }
    public bool UpdateCustomerStatus(string id, string orderId, string status, string billingAddress, string note)
    {
        con();
        string sql = @"Update tblOrder set Status='" + status + "', BillingAddress='" + billingAddress + "', Note='" + note + "' Where orderid='" + orderId + "' and Customerid='" + id + "'";
        sqlcmd = new SqlCommand(sql, cn);
        sqlcmd.ExecuteNonQuery();
        return true;
    }

    public bool TitleSetDeletebyid(string id)
    {
        try
        {
            con();
            string Save = "Delete from TitleSet where ID=@ID";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@ID", id);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataSet GetDataSet(string sql)
    {
        SqlCommand cmd = new SqlCommand(sql, cn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();
        adp.Fill(ds);
        Connection.Close();

        return ds;
    }

    public bool deletefromCatdImage(string CatID)
    {
        con();
        string insertreginfo = "Delete from CategoryImages where CatID='" + CatID + "' ";
        sqlcmd = new SqlCommand(insertreginfo, cn);
        sqlcmd.ExecuteNonQuery();
        return true;
    }



    public DataTable getSizebyid(long rowid)
    {
        con();
        string id = @"select * from ProductSize where ID='" + rowid + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getCategorybyid(long rowid)
    {
        con();
        string id = @"select  * from CategoryImages inner join Menu on Menu.Id=CategoryImages.CatID where CatIMGID='" + rowid + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }



    public DataTable getCategorybyName(string rowid)
    {
        con();
        string id = @"SELECT *  FROM Menu where Id='" + rowid + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable getProductByPID(long rowid)
    {
        con();
        //string id = @"  Select tblProductImages.Name,tblProductImages.Extention,tblProductImages.PID,VoucherNo,ProductCode,PName,CategoryID,SubCategoryID,tblProducts.Quantity,PPrice as deliveryoldprice,
        //               PSelPrice as DeliveryPrice,CollectionOldPrice,CollectionPrice,Unit,Discount,Vat,BrandName,
        //              SizeName,PDescription,PProductDetails,Ingredients,NutritionValue,AllergyAdvice,Occation,
        //               OccationDesc,OccationRemain

        //               from tblProductImages inner join tblProducts on tblProducts.PID=tblProductImages.PID
        //               inner join tblProductSizeQuantity on tblProductSizeQuantity.PID=tblProductImages.PID
        //               inner join ProductBrand on ProductBrand.PID=tblProductImages.PID
        //               inner join ProductCategory on ProductCategory.PID=tblProductImages.PID
        //               inner join ProductSubCategory on ProductSubCategory.PID=tblProductImages.PID
        //               inner join Menu on Menu.Id=ProductCategory.CategoryID 
        //               inner join Menu a on a.Id=ProductSubCategory.PID
        //               inner join BrandName on BrandName.ID=ProductBrand.BrandID
        //               inner join ProductSize on ProductSize.ID=tblProductSizeQuantity.SizeID
        //               where tblProducts.PID='" + rowid+"' ";

        //string id = @"  Select VoucherNo,ProductCode,PName,CategoryID,SubCategoryID,tblProducts.Quantity,PPrice as deliveryoldprice,
        //               PSelPrice as DeliveryPrice,CollectionOldPrice,CollectionPrice,Unit,Discount,Vat,BrandID,
        //              tblProductSizeQuantity.SizeID,PDescription,PProductDetails,Ingredients,NutritionValue,AllergyAdvice,Occation,
        //               OccationDesc,OccationRemain,ProductSection.Section

        //               from  tblProducts 
        //               inner join tblProductSizeQuantity on tblProductSizeQuantity.PID=tblProducts.PID
        //               inner join ProductBrand on ProductBrand.PID=tblProducts.PID
        //               inner join ProductCategory on ProductCategory.PID=tblProducts.PID
        //               inner join ProductSubCategory on ProductSubCategory.PID=tblProducts.PID
        //               inner join Menu on Menu.Id=ProductCategory.CategoryID 
        //               inner join Menu a on a.Id=ProductSubCategory.PID
        //               inner join BrandName on BrandName.ID=ProductBrand.BrandID
        //               inner join ProductSize on ProductSize.ID=tblProductSizeQuantity.SizeID
        //               inner join ProductSection on ProductSection.PID=tblProducts.PID
        //               where tblProducts.PID='" + rowid + "' ";

        string id = @"select tblProducts.*, ProductCategory.*  from tblProducts inner join ProductCategory on ProductCategory.PID=tblProducts.PID where tblProducts.PID='" + rowid + "' ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }



    public DataTable getTitlebyid(long rowid)
    {
        con();
        string id = @"select * from TitleSet where ID='" + rowid + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetDataTable(string sql)
    {
        DataSet ds = GetDataSet(sql);

        if (ds.Tables.Count > 0)
            return ds.Tables[0];
        return null;
    }

    public bool UpdateUserinfromuserInfo(string[] Insert)
    {
        try
        {
            con();

            string update = "Update CustomerRegistration set FirstName=@FirstName,SurName=@LastName,Email=@Email,Password=@Password where ID=@ID";
            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.Parameters.AddWithValue("@ID", Insert[0]);
            sqlcmd.Parameters.AddWithValue("@Email", Insert[1]);
            sqlcmd.Parameters.AddWithValue("@Password", Insert[2]);
            sqlcmd.Parameters.AddWithValue("@FirstName", Insert[3]);
            sqlcmd.Parameters.AddWithValue("@LastName", Insert[4]);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool UpdateSizeList(long id, string sizename)
    {
        try
        {
            con();
            string update = "Update ProductSize set SizeName='" + sizename + "'  where ID='" + id + "'";
            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool UpdateTitle(long id, string title)
    {
        try
        {
            con();
            string update = "Update TitleSet set Title='" + title + "'  where ID='" + id + "'";
            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool InsertRegistrationInfo(string[] insert)
    {
        try
        {
            con();
            string update = "Insert Into CustomerRegistration (FirstName,SurName,Country,Distance,Phone,Landline,Email,Password,PostCode,Address,HouseNo) values (@FirstName,@SurName,@Country,@Distance,@Phone,@Landline,@Email,@Password,@PostCode,@Address,@HouseNo)";
            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.Parameters.AddWithValue("@FirstName", insert[0]);
            sqlcmd.Parameters.AddWithValue("@SurName", insert[2]);
            sqlcmd.Parameters.AddWithValue("@Country", insert[3]);
            sqlcmd.Parameters.AddWithValue("@Distance", insert[4]);
            sqlcmd.Parameters.AddWithValue("@Phone", insert[5]);
            sqlcmd.Parameters.AddWithValue("@Landline", insert[6]);
            sqlcmd.Parameters.AddWithValue("@Email", insert[7]);
            sqlcmd.Parameters.AddWithValue("@Password", insert[8]);
            sqlcmd.Parameters.AddWithValue("@Address", insert[9]);
            sqlcmd.Parameters.AddWithValue("@PostCode", insert[10]);
            sqlcmd.Parameters.AddWithValue("@HouseNo", insert[11]);


            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool UpdateCustomerInfo(string[] insert, string cId)
    {
        try
        {
            con();
            string update = "update CustomerRegistration set FirstName=@FirstName,SurName=@SurName,Country=@Country,Distance=@Distance,Phone=@Phone,Landline=@Landline,Email=@Email,PostCode=@PostCode,Address=@Address,HouseNo=@HouseNo,Note=@Note Where ID='" + cId + "'";
            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.Parameters.AddWithValue("@FirstName", insert[0]);
            sqlcmd.Parameters.AddWithValue("@SurName", insert[2]);
            sqlcmd.Parameters.AddWithValue("@Country", insert[3]);
            sqlcmd.Parameters.AddWithValue("@Distance", insert[4]);
            sqlcmd.Parameters.AddWithValue("@Phone", insert[5]);
            sqlcmd.Parameters.AddWithValue("@Landline", insert[6]);
            sqlcmd.Parameters.AddWithValue("@Email", insert[7]);
            //sqlcmd.Parameters.AddWithValue("@Password", insert[8]);
            sqlcmd.Parameters.AddWithValue("@Address", insert[9]);
            sqlcmd.Parameters.AddWithValue("@PostCode", insert[10]);
            sqlcmd.Parameters.AddWithValue("@HouseNo", insert[11]);
            sqlcmd.Parameters.AddWithValue("@Note", insert[12]);


            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool SaveOrder(string orderid, string pid, string pname, string quantity, string price, string lbltotal, string customerid, string date, string Barcode, string DeliveryDate, string ShoppingType, string TimeSlot, string SpecialRequist, string Vat)
    {
        try
        {
            con();
            string Save = "INSERT INTO TblOrder(orderid,Customerid,Pid,Pname,Quantity,Total,Price,Status,Date,Barcode,DeliveyDate,ShoppingType,TimeSlot,SpeialRequist,Vat)values(@orderid,@Customerid,@Pid,@Pname,@Quantity,@Total,@Price,@Status,@Date,@Barcode,@DeliveyDate,@ShoppingType,@TimeSlot,@SpeialRequist,@Vat)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@orderid", orderid);
            sqlcmd.Parameters.AddWithValue("@Customerid", customerid);
            sqlcmd.Parameters.AddWithValue("@Pid", pid);
            sqlcmd.Parameters.AddWithValue("@Pname", pname);
            sqlcmd.Parameters.AddWithValue("@Quantity", quantity);
            sqlcmd.Parameters.AddWithValue("@Total", lbltotal);
            sqlcmd.Parameters.AddWithValue("@Price", price);
            sqlcmd.Parameters.AddWithValue("@Status", "Processing");
            sqlcmd.Parameters.AddWithValue("@Date", date);
            sqlcmd.Parameters.AddWithValue("@Barcode", Barcode);
            sqlcmd.Parameters.AddWithValue("@DeliveyDate", DeliveryDate);
            sqlcmd.Parameters.AddWithValue("@ShoppingType", ShoppingType);
            sqlcmd.Parameters.AddWithValue("@TimeSlot", TimeSlot);
            sqlcmd.Parameters.AddWithValue("@SpeialRequist", SpecialRequist);
            sqlcmd.Parameters.AddWithValue("@Vat", Vat);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable GetProductId(string text)
    {
        con();
        string sql = @" select PID from tblProducts where PName = '" + text + "'";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;

    }

    public DataTable GetOrderid()
    {
        con();
        string sql = @"select ISNULL(Max(id),0) as id from TblOrder";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetHotNewArrival()
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='2' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID  ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C where Section='1' order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetCustomerInfoForUpdate()
    {
        con();
        string id = @"select * from CustomerRegistrationUpdate";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetCustomerInfoForUpdate(string cId)
    {
        con();
        string id = @"select * from CustomerRegistrationUpdate where CustomerId='" + cId+"'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public bool UpdateRegistrationInfo(string[] insert)
    {
        try
        {
            con();
            string update = "Update CustomerRegistration set FirstName=@FirstName,SurName=@SurName,Country=@Country,Distance=@Distance,Phone=@Phone,Landline=@Landline,Email=@Email,Password=@Password,PostCode=@PostCode,Address=@Address,HouseNo=@HouseNo where ID=@Id";
            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.Parameters.AddWithValue("@Id", insert[0]);
            sqlcmd.Parameters.AddWithValue("@FirstName", insert[1]);
            sqlcmd.Parameters.AddWithValue("@SurName", insert[2]);
            sqlcmd.Parameters.AddWithValue("@Country", insert[4]);
            sqlcmd.Parameters.AddWithValue("@Distance", insert[5]);
            sqlcmd.Parameters.AddWithValue("@Phone", insert[9]);
            sqlcmd.Parameters.AddWithValue("@Landline", insert[10]);
            sqlcmd.Parameters.AddWithValue("@Email", insert[3]);
            sqlcmd.Parameters.AddWithValue("@Password", insert[11]);
            sqlcmd.Parameters.AddWithValue("@PostCode", insert[6]);
            sqlcmd.Parameters.AddWithValue("@Address", insert[8]);
            sqlcmd.Parameters.AddWithValue("@HouseNo", insert[7]);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }
    public bool DeleteRegistrationInfo(string[] insert)
    {
        try
        {
            con();
            string delete = "Delete from CustomerRegistrationUpdate where CustomerId=@Id";
            sqlcmd = new SqlCommand(delete, cn);
            sqlcmd.Parameters.AddWithValue("@Id", insert[0]);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }
    public bool InsertRegistrationInfo1(string[] insert)
    {
        try
        {
            con();
            string update = "Insert Into CustomerRegistrationUpdate (CustomerId, FirstName,SurName,Country,Distance,PostCode,HouseNo,Address,Phone,Email,Password,Landline) values (@CustomerId,@FirstName,@SurName,@Country,@Distance,@PostCode,@HouseNo,@Address,@Phone,@Email,@Password,@Landline)";
            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.Parameters.AddWithValue("@CustomerId", insert[0]);
            sqlcmd.Parameters.AddWithValue("@FirstName", insert[3]);
            sqlcmd.Parameters.AddWithValue("@SurName", insert[4]);
            sqlcmd.Parameters.AddWithValue("@Country", insert[5]);
            sqlcmd.Parameters.AddWithValue("@Distance", insert[6]);
            sqlcmd.Parameters.AddWithValue("@PostCode", insert[7]);
            sqlcmd.Parameters.AddWithValue("@HouseNo", insert[8]);
            sqlcmd.Parameters.AddWithValue("@Address", insert[9]);
            sqlcmd.Parameters.AddWithValue("@Phone", insert[10]);
            sqlcmd.Parameters.AddWithValue("@Email", insert[1]);
            sqlcmd.Parameters.AddWithValue("@Password", insert[2]);
            sqlcmd.Parameters.AddWithValue("@Landline", insert[11]);


            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }


    public DataTable GetHotBestSeller()
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='2' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID  ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C where Section='2' order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetHotDealsProduct()
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='2' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID  ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C where Section='3' order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public bool InsertSizes(string[] insert)
    {
        try
        {
            con();
            string update = "Insert Into ProductSize (SizeID,SizeName) values (@SizeID,@SizeName)";
            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.Parameters.AddWithValue("@SizeID", insert[1]);
            sqlcmd.Parameters.AddWithValue("@SizeName", insert[2]);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool InsertTitle(string[] insert)
    {
        try
        {
            con();
            string update = "Insert Into TitleSet (Title) values (@Title)";
            sqlcmd = new SqlCommand(update, cn);

            sqlcmd.Parameters.AddWithValue("@Title", insert[2]);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool UpdateCategoryname(string[] insert)
    {
        try
        {
            con();
            string update = "Update Menu set MenuText='" + insert[1] + "' where Id='" + insert[0] + "'";

            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }



    public bool updateCategoryphoto(string pID, string pname, string extention, string lblPIMGID)
    {

        try
        {
            con();
            string Save = "update CategoryImages set Name = '" + pname.ToString().Trim() + "',Extention='" + extention + "' where CatIMGID='" + lblPIMGID + "'";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }

    }

    public DataTable SelectMaxCatID()
    {
        con();
        string id = @"select ISNULL(Max(Id),0) as CatID from Menu";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable CheckSameProduct(string productCode)
    {
        con();
        string id = @"select ProductCode from tblProducts where ProductCode='" + productCode + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    //public bool checkloginfo(string[] loginfo)
    //{
    //    try
    //    {
    //        con();
    //        string update = "Insert Into CustomerRegistration (Email,Password) values (@Email,@Password)";
    //        sqlcmd = new SqlCommand(update, cn);
    //        sqlcmd.Parameters.AddWithValue("@Email", loginfo[0]);
    //        sqlcmd.Parameters.AddWithValue("@Password", loginfo[1]);


    //        sqlcmd.ExecuteNonQuery();
    //        return true;
    //    }
    //    catch (Exception)
    //    {
    //        throw;
    //    }
    //}

    public DataTable selectinfocustomer(string[] loginfo)
    {
        con();
        string id = @"select * from CustomerRegistration   where Email='" + loginfo[0] + "' and Password='" + loginfo[1] + "'  ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable selectinfocustomer1(string email)
    {
        con();
        string id = @"select * from CustomerRegistration   where Email='" + email + "' ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }


    public DataTable selectCustomerEmail(string[] loginfo)
    {
        con();
        string id = @"select * from CustomerRegistration   where Email='" + loginfo[0] + "' ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetNameAndEmail(string Email)
    {
        con();
        string id = @"select * from CustomerRegistration   where Email='" + Email + "'   ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetAreaNo()
    {
        con();
        string id = @"Select ISNULL(Max(ID),0)+1 from AreaWithDays";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }



    public DataTable GetAreaName()
    {
        con();
        string id = @"Select *  from AreaName";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }



    public bool insertProductCategory(string PID, string category)
    {
        try
        {
            con();
            string Save = "INSERT INTO ProductCategory(PID,CategoryID)values(@PID,@CategoryID)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@PID", PID);
            sqlcmd.Parameters.AddWithValue("@CategoryID", category);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool insertSectionCategory(string PID, string Section)
    {
        try
        {
            con();
            string Save = "INSERT INTO ProductSection(PID,Section)values(@PID,@CategoryID)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@PID", PID);
            sqlcmd.Parameters.AddWithValue("@CategoryID", Section);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool UpdateProductCategory(string PID, string category)
    {
        try
        {
            con();
            string Save = "UPDATE ProductCategory set CategoryID=@CategoryID where PID=@PID";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@PID", PID);
            sqlcmd.Parameters.AddWithValue("@CategoryID", category);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }



    public bool insertProductSubCategory(string PID, string Subcategory)
    {
        try
        {
            con();
            string Save = "INSERT INTO ProductSubCategory(PID,SubCategoryID)values(@PID,@SubCategoryID)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@PID", PID);
            sqlcmd.Parameters.AddWithValue("@SubCategoryID", Subcategory);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool UpdateProductSubCategory(string PID, string Subcategory)
    {
        try
        {
            con();
            string Save = "UPDATE ProductSubCategory set SubCategoryID=@SubCategoryID where PID=@PID";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@PID", PID);
            sqlcmd.Parameters.AddWithValue("@SubCategoryID", Subcategory);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool insertProductBrand(string PID, string Brand)
    {
        try
        {
            con();
            string Save = "INSERT INTO ProductBrand(PID,BrandID)values(@PID,@BrandID)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@PID", PID);
            sqlcmd.Parameters.AddWithValue("@BrandID", Brand);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }



    public bool UpdateProductBrand(string PID, string Brand)
    {
        try
        {
            con();
            string Save = "Update ProductBrand set BrandID=@BrandID where ID=@ID";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@ID", PID);
            sqlcmd.Parameters.AddWithValue("@BrandID", Brand);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }



    public DataTable GetMenuData()
    {
        con();
        string id = @"Select *  from Menu where MenuLevel=0";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetMenuData(string Category)
    {
        con();
        string id = @"Select *  from Menu where ParentId='" + Category + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public bool InsertAreawithday(string[] insert)
    {
        try
        {
            con();
            string Save = "INSERT INTO AreaWithDays(AreaName,DaysForArea)values(@AreaName,@DaysForArea)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@AreaName", insert[2]);
            sqlcmd.Parameters.AddWithValue("@DaysForArea", insert[3]);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool UpdateAreaWithDays(string AreaID, string AreaName, string Dayname)
    {
        try
        {
            con();
            string update = "Update AreaWithDays set AreaName='" + AreaName + "',DaysForArea='" + Dayname + "' where ID='" + AreaID + "'";

            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable getAreabyid(long ID)
    {
        con();
        string id = @"select * from AreaWithDays where ID='" + ID + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getAreawithdayList()
    {
        string id = "select * from AreaWithDays";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public bool AreawithdayDeletebyid(string ID)
    {
        try
        {
            con();
            string Delete = "Delete from AreaWithDays where ID=@ID";
            sqlcmd = new SqlCommand(Delete, cn);
            sqlcmd.Parameters.AddWithValue("@id", ID);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable SlectPerson(string Email, string Password)
    {
        string id = "select * from CustomerRegistration where Email='" + Email + "'and Password='" + Password + "' ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable selectdatebypostcode(string post)
    {
        string id = "select DaysForArea from AreaWithDays where AreaWithDays.AreaName <=50 ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable selectdatebypostcode100(string post)
    {
        string id = "select DaysForArea from AreaWithDays where AreaWithDays.AreaName <= 100 and AreaWithDays.AreaName >= 51 ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable selectdatebypostcode150(string post)
    {
        string id = "select DaysForArea from AreaWithDays where AreaWithDays.AreaName >= 101 and AreaWithDays.AreaName <= 250 ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable selectCollectionDate()
    {
        string id = "select DayName from CollectionDays ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetCategoryNo()
    {
        con();
        string id = @"Select ISNULL(Max(Id),0)+1 from Menu";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public bool InsertCategory(string[] insert)
    {
        try
        {
            con();
            string Save = "INSERT INTO Menu(MenuText,MenuLevel)values(@MenuText,@MenuLevel)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@MenuText", insert[1]);
            sqlcmd.Parameters.AddWithValue("@MenuLevel", '0');

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    //public bool UpdateCategoryname(string CategoryId, string CategoryName)
    //{
    //    try
    //    {
    //        con();
    //        string update = "Update Menu set MenuText='" + CategoryName + "' where Id='" + CategoryId + "'";

    //        sqlcmd = new SqlCommand(update, cn);
    //        sqlcmd.ExecuteNonQuery();
    //        return true;
    //    }
    //    catch (Exception)
    //    {
    //        throw;
    //    }
    //}

    public DataTable getSubCategory()
    {
        string id = "select * from Menu where MenuLevel !='0'";
        // string id = "select Id,MenuText,MenuLevel,ParentId,(select MenuText from Menu where Id='2' ) as new  from Menu where MenuLevel !='0'";

        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getCategory()
    {
        string id = "select * from Menu inner join CategoryImages on Menu.Id = CategoryImages.CatID where MenuLevel ='0' order by CategoryImages.CatID asc";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;


    }

    public bool CategoryDeletebyid(string ID)
    {
        try
        {
            con();
            string Delete = "Delete from Menu where Id=@ID";
            sqlcmd = new SqlCommand(Delete, cn);
            sqlcmd.Parameters.AddWithValue("@id", ID);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable getCategoryid(long ID)
    {
        con();
        string id = @"select * from Menu where Id='" + ID + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable LoadCategoryname()
    {
        string id = "select * from Menu where MenuLevel='0'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getSubCategoryid(long ID)
    {
        con();
        string id = @"select * from Menu where Id='" + ID + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getSubCategoryByCategort(string ID)
    {
        con();
        string id = @"select * from Menu where ParentId='" + ID + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getSubCategoryByonly()
    {
        con();
        string id = @"select * from Menu";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public bool InsertSubCategory(string[] insert)
    {
        try
        {
            con();
            string Save = "INSERT INTO Menu(MenuText,MenuLevel,ParentId)values(@MenuText,@MenuLevel,@ParentId)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@MenuText", insert[1]);
            sqlcmd.Parameters.AddWithValue("@MenuLevel", insert[2]);
            sqlcmd.Parameters.AddWithValue("@ParentId", insert[3]);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable GetFrozenBestSeller()
    {
        con();
        // string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='9' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='9' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='2' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetPackaginganddisposalBestSeller()
    {
        con();
        // string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='9' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='11' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='2' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public bool UpdateSubCategoryname(string SubCategoryId, string SubCategoryName, string Menulevel, string ParentID)
    {
        try
        {
            con();
            string update = "Update Menu set MenuText='" + SubCategoryName + "',MenuLevel='" + Menulevel + "',ParentId='" + ParentID + "'  where Id='" + SubCategoryId + "'";

            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable GetVoucher()
    {
        DataTable _dt = new DataTable();
        try
        {
            con();
            string sql = "select ISNULL(Max(PID),0)+1 from tblProducts";
            sqlcmd = new SqlCommand(sql, cn);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            da.Fill(_dt);
        }
        catch (Exception)
        {
            throw;
        }
        return _dt;
    }

    public DataTable GetallSize()
    {
        DataTable _dt = new DataTable();
        try
        {
            con();
            string sql = "select * from ProductSize";
            sqlcmd = new SqlCommand(sql, cn);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            da.Fill(_dt);
        }
        catch (Exception)
        {
            throw;
        }
        return _dt;
    }

    public DataTable GetallCategories()
    {
        DataTable _dt = new DataTable();
        try
        {
            con();
            string sql = "select * from Menu where MenuLevel='0'";
            sqlcmd = new SqlCommand(sql, cn);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            da.Fill(_dt);
        }
        catch (Exception)
        {
            throw;
        }
        return _dt;
    }

    public DataTable GetProductName()
    {
        DataTable _dt = new DataTable();
        try
        {
            con();
            string sql = "select * from tblProducts";
            sqlcmd = new SqlCommand(sql, cn);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            da.Fill(_dt);
        }
        catch (Exception)
        {
            throw;
        }
        return _dt;
    }

    public DataTable GetallBrands()
    {
        DataTable _dt = new DataTable();
        try
        {
            con();
            string sql = "select * from BrandName";
            sqlcmd = new SqlCommand(sql, cn);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            da.Fill(_dt);
        }
        catch (Exception)
        {
            throw;
        }
        return _dt;
    }



    public DataTable GetSubCategory()
    {
        DataTable _dt = new DataTable();
        try
        {
            con();
            string sql = "select * from Menu where MenuLevel !='0'";
            sqlcmd = new SqlCommand(sql, cn);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            da.Fill(_dt);
        }
        catch (Exception)
        {
            throw;
        }
        return _dt;
    }

    public bool insertProduct(string[] insert)
    {

        try
        {
            con();
            string Save = "INSERT INTO tblProducts(VoucherNo,PName,PPrice,PSelPrice,Quantity,Unit,Status,CollectionPrice,ProductCode,Vat,Discount,Occation,OccationDesc,OccationRemain,CollectionOldPrice,Ingredients,NutritionValue,AllergyAdvice)values(@VoucherNo,@PName,@PPrice,@PSelPrice,@Quantity,@Unit,@Status,@CollectionPrice,@ProductCode,@Vat,@Discount,@Occation,@OccationDesc,@OccationRemain,@CollectionOldPrice,@Ingredients,@NutritionValue,@AllergyAdvice)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@VoucherNo", insert[0]);

            sqlcmd.Parameters.AddWithValue("@PName", insert[1]);
            //sqlcmd.Parameters.AddWithValue("@PCategoryID", insert[2]);
            //sqlcmd.Parameters.AddWithValue("@PSubCatID", insert[3]);
            //sqlcmd.Parameters.AddWithValue("@ProductID", insert[4]);
            sqlcmd.Parameters.AddWithValue("@PPrice", insert[6]);
            sqlcmd.Parameters.AddWithValue("@PSelPrice", insert[7]);
            sqlcmd.Parameters.AddWithValue("@Unit", insert[8]);
            //sqlcmd.Parameters.AddWithValue("@PBrandID", insert[9]);
            //sqlcmd.Parameters.AddWithValue("@PDescription", insert[11]);
            //sqlcmd.Parameters.AddWithValue("@PProductDetails", insert[12]);
            sqlcmd.Parameters.AddWithValue("@Quantity", insert[5]);
            sqlcmd.Parameters.AddWithValue("@Status", "OK");
            sqlcmd.Parameters.AddWithValue("@CollectionPrice", insert[14]);
            sqlcmd.Parameters.AddWithValue("@ProductCode", insert[15]);
            sqlcmd.Parameters.AddWithValue("@Vat", insert[16]);
            sqlcmd.Parameters.AddWithValue("@Discount", insert[17]);
            sqlcmd.Parameters.AddWithValue("@Occation", insert[18]);
            sqlcmd.Parameters.AddWithValue("@OccationDesc", insert[19]);
            sqlcmd.Parameters.AddWithValue("@OccationRemain", insert[20]);
            sqlcmd.Parameters.AddWithValue("@CollectionOldPrice", insert[21]);
            sqlcmd.Parameters.AddWithValue("@Ingredients", insert[22]);
            sqlcmd.Parameters.AddWithValue("@NutritionValue", insert[23]);
            sqlcmd.Parameters.AddWithValue("@AllergyAdvice", insert[24]);
            //sqlcmd.Parameters.AddWithValue("@Section", insert[25]);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable SelectMaxPID()
    {
        con();
        string id = @"select ISNULL(Max(PID),0) as PID from tblProducts";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }



    public bool insertProductsizequantity(string PID, string SizeID, int Quantity)
    {
        try
        {
            con();
            string Save = "INSERT INTO tblProductSizeQuantity(PID,SizeID,Quantity)values(@PID,@SizeID,@Quantity)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@PID", PID);
            sqlcmd.Parameters.AddWithValue("@SizeID", SizeID);
            sqlcmd.Parameters.AddWithValue("@Quantity", Quantity);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool UpdateProductsizequantity(string PID, string SizeID, int Quantity)
    {
        try
        {
            con();
            string Save = "UPDATE  tblProductSizeQuantity set SizeID=@SizeID , Quantity=@Quantity where PID=@PID";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@PID", PID);
            sqlcmd.Parameters.AddWithValue("@SizeID", SizeID);
            sqlcmd.Parameters.AddWithValue("@Quantity", Quantity);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable GetSubcatFoodandcipboard()
    {
        con();
        string id = @"Select *  from Menu where ParentId=2";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable FooterSubcatFoodandcipboard()
    {
        con();
        string id = @"Select top 5 *  from Menu where ParentId=2";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetSubcatPopular()
    {
        con();
        string id = @"Select *  from Menu where ParentId=1";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetSubcatFresh()
    {
        con();
        string id = @"Select *  from Menu where ParentId=3";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable FooterSubcatFresh()
    {
        con();
        string id = @"Select top 5 *  from Menu where ParentId=3";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetSubcatdrinkandbreverage()
    {
        con();
        string id = @"Select *  from Menu where ParentId=4";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable FooterSubcatdrinkandbreverage()
    {
        con();
        string id = @"Select top 5  *  from Menu where ParentId=4";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetSubcatdairyandchese()
    {
        con();
        string id = @"Select *  from Menu where ParentId=8";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable FooterSubcatdairyandchese()
    {
        con();
        string id = @"Select top 5 *  from Menu where ParentId=8";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetSubcatFrozenfood()
    {
        con();
        string id = @"Select *  from Menu where ParentId=9";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetSubcatPackaginganddisposal()
    {
        con();
        string id = @"Select *  from Menu where ParentId=11";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetSubcatCookingoilandfat()
    {
        con();
        string id = @"Select *  from Menu where ParentId=10";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetSubcatPackaginganddisposable()
    {
        con();
        string id = @"Select *  from Menu where ParentId=11";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetSubcatHygieneandcleaning()
    {
        con();
        string id = @"Select *  from Menu where ParentId=12";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable FooterSubcatFrozenfood()
    {
        con();
        string id = @"Select top 5 *  from Menu where ParentId=9";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetSubcatPackingDisposal()
    {
        con();
        string id = @"Select *  from Menu where ParentId=11";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetFrozenDeals()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='9' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='3' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetSuperDeals()
    {
        con();
        //string sql = @"Select top 5 * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation!='' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        string sql = @"Select top 5 * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation='Deals' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetAllSuperDeals()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation!='' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetAllSuperDealsNameAsc()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation!='' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PName Asc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetAllSuperDealsNameDesc()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation!='' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PName Desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetAllSuperDealsPriceDesc()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation!='' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PSelPrice Desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetAllSuperDealsPriceAsc()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation!='' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PSelPrice Asc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetAllPopulars()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation='Popular' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetAllPopularsNameAsc()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation='Popular' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PName Asc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetAllPopularsNameDesc()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation='Popular' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PName Desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetAllPopularsPriceDesc()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation='Popular' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PSelPrice Desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetAllPopularsPriceAsc()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation='Popular' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PSelPrice Asc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetPackaginganddisposalDeals()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='11' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='3' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetFoodAndCupbordBestsellers()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='2' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='2' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetFoodAndCupbordDeal()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='2' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='3' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetFreshBestSellers()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='3' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='2' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetFreshDeal()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='3' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='3' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetDrinkAndBraverageBestsellers()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='4' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='2' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetDrinkAndBraverageDeals()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='4' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='3' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetDairyandCheeseDeals()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='8' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='3' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetDairyandCheeseBestSellers()
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='8' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='2' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }



    public DataTable GetFoodcupboardNewArrival()
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='2' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='2' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='1' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetProductByCategoryname1(string CatID)
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='"+ CatID + "' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetProductByCategoryname(string CatID)
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='"+ CatID + "' order by C.PID desc ) C";
        string sql = @"Select top 12 * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetProductByNameAsc(string CatID)
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='"+ CatID + "' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PName asc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetProductByNameDesc(string CatID)
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='"+ CatID + "' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PName desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetProductByPriceHighToLow(string CatID)
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='"+ CatID + "' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PSelPrice desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetProductByPriceLowToHigh(string CatID)
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='"+ CatID + "' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PSelPrice asc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetTop12Products(string CatID)
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='"+ CatID + "' order by C.PID desc ) C";
        string sql = @"Select top 12 * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetTop24Products(string CatID)
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='"+ CatID + "' order by C.PID desc ) C";
        string sql = @"Select top 24 * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetTop48Products(string CatID)
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='"+ CatID + "' order by C.PID desc ) C";
        string sql = @"Select top 48 * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetFilterProducts(string CatID, string a, string b)
    {
        con();
        string sql = @"Select top 48 * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' and B.PSelPrice between '" + a + "' and '" + b + "') F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetFilterProducts1(string CatID, string a, string b)
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation='Popular' and B.PSelPrice between '" + a + "' and '" + b + "') F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public DataTable GetFilterProducts13(string CatID, string a, string b)
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.Occation!='' and B.PSelPrice between '" + a + "' and '" + b + "' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetProductByCategorynameandSubcategory(string CatID, string Subcat)
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='"+ CatID + "' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' ) F cross apply(select top 1 * from ProductSubCategory G where G.PID=B.PID and G.SubCategoryID='" + Subcat + "' ) G  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable foodcupboardbannerimage()
    {
        con();
        string sql = @"Select * from Menu B  cross apply(select top 1 * from CategoryImages C where C.CatID = B.Id and B.Id='2' order by C.CatIMGID asc ) C ";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable foodcupboardthumbimage()
    {
        con();
        string sql = @"Select * from Menu B  cross apply(select top 2 * from CategoryImages C where C.CatID = B.Id and B.Id='2' order by C.CatIMGID desc ) C";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetFreshNewArrival()
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='3' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='3' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='1' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable Freshbannerimage()
    {
        con();
        string sql = @"Select * from Menu B  cross apply(select top 1 * from CategoryImages C where C.CatID = B.Id and B.Id='3' order by C.CatIMGID asc ) C";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable freshthumbimage()
    {
        con();
        string sql = @"Select * from Menu B  cross apply(select top 2 * from CategoryImages C where C.CatID = B.Id and B.Id='3' order by C.CatIMGID desc ) C";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetDrinkandBraverazeNewArrival()
    {
        con();
        // string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='4' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='4' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='1' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable DrinkandBreveragebannerimage()
    {
        con();
        string sql = @"Select * from Menu B  cross apply(select top 1 * from CategoryImages C where C.CatID = B.Id and B.Id='4' order by C.CatIMGID asc ) C ";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable Drinkthumbimage()
    {
        con();
        string sql = @"Select * from Menu B  cross apply(select top 2 * from CategoryImages C where C.CatID = B.Id and B.Id='4' order by C.CatIMGID desc ) C";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetDairyandCheeseNewArrival()
    {
        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='8' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='8' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='1' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable Dairyandcheesebannerimage()
    {
        con();
        string sql = @"Select * from Menu B  cross apply(select top 1 * from CategoryImages C where C.CatID = B.Id and B.Id='8' order by C.CatIMGID asc ) C";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable Dairyandcheesethumbimage()
    {
        con();
        string sql = @"Select * from Menu B  cross apply(select top 2 * from CategoryImages C where C.CatID = B.Id and B.Id='8' order by C.CatIMGID desc ) C ";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable Packaginganddisposalthumbimage()
    {
        con();
        string sql = @"Select * from Menu B  cross apply(select top 2 * from CategoryImages C where C.CatID = B.Id and B.Id='11' order by C.CatIMGID desc ) C";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable LoadBigImageinCategorypage(string CatID)

    {
        con();
        string sql = @"Select top 1  * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' )F cross apply(Select top 1 * from  CategoryImages G where F.CategoryID=G.CatID) H  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        // string sql = @"Select * from Menu B  cross apply(select top 1 * from CategoryImages C where C.CatID = B.Id and B.Id='" + CatID + "' order by C.CatIMGID asc ) C ";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetFrozenNewArrival()
    {
        con();
        // string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='9' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='9' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='1' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetPackaginganddisposalNewArrival()
    {
        con();
        // string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='9' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='11' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C cross apply(select top 1 * from ProductSection S where S.PID = B.PID and Section='1' order by S.PID desc ) S order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable Frozenbannerimage()
    {
        con();
        string sql = @"Select * from Menu B  cross apply(select top 1 * from CategoryImages C where C.CatID = B.Id and B.Id='9' order by C.CatIMGID asc ) C ";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable Frozenthumbimage()
    {
        con();
        string sql = @"Select * from Menu B  cross apply(select top 2 * from CategoryImages C where C.CatID = B.Id and B.Id='9' order by C.CatIMGID desc ) C";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetProductByPIDsingleimage(int PID)
    {

        string sql = @"select top 1 * from tblProductImages where tblProductImages.PID ='" + PID + "'";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetProductByPIDthreeimage(string PID)
    {
        con();
        string sql = @"select  * from tblProductImages where tblProductImages.PID ='" + PID + "'";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetBrandimage(string PID)
    {
        con();
        string sql = @"select  * from tblBrandImages inner join ProductBrand on ProductBrand.BrandID=tblBrandImages.BID where ProductBrand.PID ='" + PID + "'";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetProductInfoByPID(string PID)
    {
        con();
        //string sql = @"select  * from tblProducts inner join ProductCategory on ProductCategory.PID=tblProducts.PID where tblProducts.PID ='" + PID + "'";
        string sql = @"Select top 12 * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.PID='"+PID+"' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    //public DataTable Getsubcatidbyname(string SubcatText)
    //{
    //    con();
    //    string sql = @"select  * from Menu where MenuText ='" + SubcatText + "'";
    //    SqlDataAdapter da = new SqlDataAdapter(sql, cn);
    //    DataTable dt = new DataTable();
    //    da.Fill(dt);
    //    return dt;
    //}

    public DataTable getproductbysubcat(string subcatid, string catid)
    {

        con();
        //string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.PCategoryID='" + catid + "' and B.PSubCatID ='" + subcatid + "' order by C.PID desc ) C";
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + catid + "' ) F   cross apply(select top 1 * from dbo.ProductSubCategory G where G.PID=B.PID and G.SubCategoryID='" + subcatid + "' ) G cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;

    }

    public bool insertBrand(string[] insert)
    {
        try
        {
            con();
            string Save = "INSERT INTO BrandName(BrandName)values(@BrandName)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@BrandName", insert[0]);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable SelectBrandMaxID()
    {
        con();
        string id = @"select ISNULL(Max(ID),0) as BID from BrandName";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getBrandid(long ID)
    {
        con();
        string id = @"select * from BrandName where ID='" + ID + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetBrandNo()
    {
        con();
        string id = @"Select ISNULL(Max(ID),0)+1 from BrandName";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetSizeNo()
    {
        con();
        string id = @"Select ISNULL(Max(ID),0)+1 from ProductSize";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetTitle()
    {
        con();
        string id = @"Select ISNULL(Max(ID),0)+1 from TitleSet";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public bool UpdateBrandname(string BrandId, string BrandName)
    {
        try
        {
            con();
            string update = "Update BrandName set BrandName='" + BrandName + "' where ID='" + BrandId + "'";

            sqlcmd = new SqlCommand(update, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable getBrand()
    {
        string id = "select * from BrandName inner join tblBrandImages on tblBrandImages.BID=BrandName.ID";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public bool BrandDeletebyid(string ID)
    {
        try
        {
            con();
            string Delete = "Delete from BrandName where ID=@ID";
            sqlcmd = new SqlCommand(Delete, cn);
            sqlcmd.Parameters.AddWithValue("@ID", ID);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool EditBrand(string[] insert)
    {
        try
        {
            con();
            string Save = "Update BrandName set BrandName=@BrandName where ID=@ID ";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@ID", insert[0]);
            sqlcmd.Parameters.AddWithValue("@BrandName", insert[1]);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool updatephoto(string BID, string Pname, string Extention, string lblPIMGID)
    {
        try
        {
            con();
            string Save = "update tblBrandImages set BID='" + BID + "', Name = '" + Pname.ToString().Trim() + "',Extention='" + Extention + "' where BIMGID='" + lblPIMGID + "'";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool DeleteBrand(string ProductID)
    {
        con();
        string insertreginfo = "Delete from BrandName where ID='" + ProductID + "' ";
        sqlcmd = new SqlCommand(insertreginfo, cn);
        sqlcmd.ExecuteNonQuery();
        return true;
    }

    public bool deletefromBrandImage(string ProductID)
    {
        con();
        string insertreginfo = "Delete from tblBrandImages where BID='" + ProductID + "' ";
        sqlcmd = new SqlCommand(insertreginfo, cn);
        sqlcmd.ExecuteNonQuery();
        return true;
    }

    public DataTable GetProductforEdit()
    {
        con();
        //string sql = @"Select * from tblProducts inner join tblProductImages on tblProducts.PID = tblProductImages.PID order by tblProducts.PID DESC  ";
        string sql = @"Select * from tblProducts inner join ProductCategory on ProductCategory.PID=tblProducts.PID inner join Menu on Menu.Id=ProductCategory.CategoryID  order by tblProducts.PID DESC  ";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public bool EditProduct(string[] insert)
    {
        try
        {
            con();
            string Save = "Update tblProducts set PName=@PName ,PPrice=@PPrice,PSelPrice=@PSelPrice,Unit=@Unit,CollectionPrice=@CollectionPrice,Occation=@Occation,OccationDesc=@OccationDesc,OccationRemain=@OccationRemain where PID=@PID ";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@PID", insert[0]);
            sqlcmd.Parameters.AddWithValue("@PName", insert[1]);
            sqlcmd.Parameters.AddWithValue("@PPrice", insert[2]);
            sqlcmd.Parameters.AddWithValue("@PSelPrice", insert[3]);
            //sqlcmd.Parameters.AddWithValue("@PDescription", insert[4]);
            //sqlcmd.Parameters.AddWithValue("@PProductDetails", insert[5]);
            sqlcmd.Parameters.AddWithValue("@Unit", insert[8]);
            sqlcmd.Parameters.AddWithValue("@CollectionPrice", insert[9]);

            sqlcmd.Parameters.AddWithValue("@Occation", insert[10]);
            sqlcmd.Parameters.AddWithValue("@OccationDesc", insert[11]);
            sqlcmd.Parameters.AddWithValue("@OccationRemain", insert[12]);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool DeleteProduct(string ProductID)
    {
        con();
        string insertreginfo = "Delete from tblProducts where PID='" + ProductID + "' ";
        sqlcmd = new SqlCommand(insertreginfo, cn);
        sqlcmd.ExecuteNonQuery();
        return true;
    }

    public bool deletefromPrdImage(string ProductID)
    {
        con();
        string insertreginfo = "Delete from tblProductImages where PID='" + ProductID + "' ";
        sqlcmd = new SqlCommand(insertreginfo, cn);
        sqlcmd.ExecuteNonQuery();
        return true;
    }

    public DataTable searchproductbyname(string name)
    {
        con();
        //string sql = @"Select * from tblProducts inner join tblProductImages on tblProducts.PID = tblProductImages.PID inner join ProductCategory on ProductCategory.PID=tblProducts.PID inner join Menu on Menu.Id=ProductCategory.CategoryID where tblProducts.PName='" + name + "'  ";
        string sql = @"Select * from tblProducts inner join ProductCategory on ProductCategory.PID=tblProducts.PID inner join Menu on Menu.Id=ProductCategory.CategoryID where tblProducts.PName='" + name + "'  order by tblProducts.PID DESC  ";

        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable searchproductbyCode(string name)
    {
        con();
        //string sql = @"Select * from tblProducts inner join tblProductImages on tblProducts.PID = tblProductImages.PID inner join ProductCategory on ProductCategory.PID=tblProducts.PID inner join Menu on Menu.Id=ProductCategory.CategoryID where tblProducts.PName='" + name + "'  ";
        string sql = @"Select * from tblProducts inner join ProductCategory on ProductCategory.PID=tblProducts.PID inner join Menu on Menu.Id=ProductCategory.CategoryID where tblProducts.ProductCode='" + name + "'  order by tblProducts.PID DESC  ";

        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable checkOccation()
    {
        con();
        string sql = @"Select top 1  * from tblProducts inner join ProductCategory on ProductCategory.PID =tblProducts.PID inner join   Menu on Menu.Id=ProductCategory.CategoryID where tblProducts.Occation!=''  ";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetImageNo()
    {
        con();
        string id = @"Select ISNULL(Max(ID),0)+1 from SliderImage";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public bool insertsliderimage(string[] insert)
    {
        try
        {
            con();
            string Save = "INSERT INTO SliderImage(ImageName,ImageDescTop,ImageDescbottom)values(@ImageName,@ImageDescTop,@ImageDescbottom)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@ImageName", insert[0]);
            sqlcmd.Parameters.AddWithValue("@ImageDescTop", insert[1]);
            sqlcmd.Parameters.AddWithValue("@ImageDescbottom", insert[2]);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable SelectSliderimageMaxID()
    {
        con();
        string id = @"select ISNULL(Max(ID),0) as ID from SliderImage";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public bool UpdateImage(string Extention, string ID, string txtimagename)
    {
        try
        {
            con();
            string Save = "Update SliderImage set ImageName=@ImageName ,Extention=@Extention where ID=@ID ";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@ID", ID);
            sqlcmd.Parameters.AddWithValue("@ImageName", txtimagename.Trim() + "01");
            sqlcmd.Parameters.AddWithValue("@Extention", Extention);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }



    public DataTable getproductbysubcat()
    {
        con();
        string sql = @"Select * from tblProducts B  cross apply(select top 1 * from tblProductImages C where C.PID = B.PID and B.Occation !='' order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable selectinforAdmin(string[] loginfo)
    {
        con();
        string id = @"select * from AdminRegistration   where Name='" + loginfo[0] + "' and Password='" + loginfo[1] + "'  ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetallAdminUser()
    {
        DataTable _dt = new DataTable();
        try
        {
            con();
            string sql = "select * from AdminRegistration";
            sqlcmd = new SqlCommand(sql, cn);
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            da.Fill(_dt);
        }
        catch (Exception)
        {
            throw;
        }
        return _dt;
    }

    public bool InsertAdminUser(string[] insert)
    {
        try
        {
            con();
            string Save = "INSERT INTO AdminRegistration(Name,Password)values(@Name,@Password)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@Name", insert[0]);
            sqlcmd.Parameters.AddWithValue("@Password", insert[1]);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool DeleteAdminUser(string ID)
    {
        con();
        string insertreginfo = "Delete from AdminRegistration where ID='" + ID + "' ";
        sqlcmd = new SqlCommand(insertreginfo, cn);
        sqlcmd.ExecuteNonQuery();
        return true;
    }

    public bool EditAdminUser(string[] insert)
    {
        try
        {
            con();
            string Save = "Update AdminRegistration set Name=@Name ,Password=@Password where ID=@ID ";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@ID", insert[0]);
            sqlcmd.Parameters.AddWithValue("@Name", insert[1]);
            sqlcmd.Parameters.AddWithValue("@Password", insert[2]);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool InsertSliderDetails(string[] insert)
    {
        try
        {
            con();
            string Save = "INSERT INTO SliderDetails(Title,Description,Position)values(@Title,@Description,@Position)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@Title", insert[1]);
            sqlcmd.Parameters.AddWithValue("@Description", insert[2]);
            sqlcmd.Parameters.AddWithValue("@Position", insert[0]);


            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool updateSliderDetails(string[] insert)
    {
        try
        {
            con();
            string Save = "Update SliderDetails set Title=@Title ,Description=@Description where Position=@Position ";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@Title", insert[1]);
            sqlcmd.Parameters.AddWithValue("@Description", insert[2]);
            sqlcmd.Parameters.AddWithValue("@Position", insert[0]);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable GetCustomerInfo()
    {
        con();
        string id = @"select * from CustomerRegistration order by ID desc";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetCustomerReview()
    {
        con();
        string id = @"select * from UserComments order by ID desc";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetCustomerInfoById(string cId)
    {
        con();
        string id = @"select * from CustomerRegistration Where ID='" + cId + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetCustomerInfoByEmail(string email)
    {
        con();
        string id = @"select * from CustomerRegistration where Email='" + email + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetCustomerreviewByEmail(string email)
    {
        con();
        string id = @"select * from UserComments where ProDuctID='" + email + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getSizeList()
    {
        con();
        string id = @"select * from ProductSize";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable checkposition(string[] insert)
    {
        con();
        string id = @"select * from SliderDetails where Position='" + insert[0] + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public void DeleteCustomerInfo(string ID)
    {
        try
        {
            con();
            string Delete = "Delete from CustomerRegistration where ID=@ID ";
            sqlcmd = new SqlCommand(Delete, cn);
            sqlcmd.Parameters.AddWithValue("@ID", ID);
            sqlcmd.ExecuteNonQuery();
        }
        catch (Exception)
        {
            throw;
        }
    }
    public void DeleteCustomerReview(string ID)
    {
        try
        {
            con();
            string Delete = "Delete from UserComments where ID=@ID ";
            sqlcmd = new SqlCommand(Delete, cn);
            sqlcmd.Parameters.AddWithValue("@ID", ID);
            sqlcmd.ExecuteNonQuery();
        }
        catch (Exception)
        {
            throw;
        }
    }
    public void DeleteOrderInfo(string ID)
    {
        try
        {
            con();
            string Delete = "Delete from TblOrder where id=@ID ";
            sqlcmd = new SqlCommand(Delete, cn);
            sqlcmd.Parameters.AddWithValue("@ID", ID);
            sqlcmd.ExecuteNonQuery();
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable getTitleSetList()
    {
        con();
        string id = @"select * from TitleSet";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getFirstSliderdetails()
    {
        con();
        string id = @"select * from SliderDetails where Position='1'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable getSecondSliderdetails()
    {
        con();
        string id = @"select * from SliderDetails where Position='2'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getThirdSliderdetails()
    {
        con();
        string id = @"select * from SliderDetails where Position='3'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getFourthSliderdetails()
    {
        con();
        string id = @"select * from SliderDetails where Position='4'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getFifthSliderdetails()
    {
        con();
        string id = @"select * from SliderDetails where Position='5'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetRelatedProduct(string CatID)
    {
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and F.CategoryID='" + CatID + "' ) F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetRelatedProduct1(string pname)
    {
        string a = "%" + pname + "%";
        con();
        string sql = @"Select * from tblProducts B cross apply(select top 1 * from ProductCategory F where F.PID=B.PID and B.PName LIKE '" + a + "') F cross apply(select top 1 * from tblProductImages C where C.PID = B.PID  order by C.PID desc ) C order by B.PID desc";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable CategoryID(string pID)
    {
        con();
        string sql = @"Select * from ProductCategory inner join ProductSubCategory on ProductSubCategory.PID=ProductCategory.PID where ProductCategory.PID='" + pID + "'";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public bool InsertComment(string[] insert)
    {
        try
        {
            con();
            string Save = "INSERT INTO UserComments(CustomerName,Comments,LevelNo,ProDuctID,Date)values(@CustomerName,@Comments,@LevelNo,@ProDuctID,@Date)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@CustomerName", insert[0]);
            sqlcmd.Parameters.AddWithValue("@Comments", insert[2]);
            sqlcmd.Parameters.AddWithValue("@LevelNo", "Null");
            sqlcmd.Parameters.AddWithValue("@ProDuctID", insert[3]);
            sqlcmd.Parameters.AddWithValue("@Date", DateTime.Now);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool InsertReplyComment(string[] insert, string MainCommentID)
    {
        try
        {
            con();
            string Save = "INSERT INTO UserComments(CustomerName,Comments,LevelNo,ProDuctID,Date)values(@CustomerName,@Comments,@LevelNo,@ProDuctID,@Date)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@CustomerName", insert[0]);
            sqlcmd.Parameters.AddWithValue("@Comments", insert[2]);
            sqlcmd.Parameters.AddWithValue("@LevelNo", MainCommentID);
            sqlcmd.Parameters.AddWithValue("@ProDuctID", insert[3]);
            sqlcmd.Parameters.AddWithValue("@Date", DateTime.Now);


            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable GetMenuComment(string pId)
    {
        con();
        string id = @"Select top 4 *  from UserComments where ProDuctId='"+pId+"'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetReplyComment(string Maincommentid)
    {
        con();
        string id = @"Select *  from UserComments where LevelNo='" + Maincommentid + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public bool UpdateTblproducts(string[] insert, string PID)
    {
        try
        {
            con();
            string Save = "Update tblProducts set ProductCode=@ProductCode ,PName=@PName,Occation=@Occation,OccationDesc=@OccationDesc,OccationRemain=@OccationRemain,PPrice=@PPrice,PSelPrice=@PSelPrice,CollectionOldPrice=@CollectionOldPrice,CollectionPrice=@CollectionPrice,Vat=@Vat,Discount=@Discount,Quantity=@Quantity,Ingredients=@Ingredients,NutritionValue=@NutritionValue,AllergyAdvice=@AllergyAdvice,Unit=@Unit where PID=@PID ";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@ProductCode", insert[15]);
            sqlcmd.Parameters.AddWithValue("@PName", insert[1]);
            sqlcmd.Parameters.AddWithValue("@Occation", insert[18]);
            sqlcmd.Parameters.AddWithValue("@OccationDesc", insert[19]);
            sqlcmd.Parameters.AddWithValue("@OccationRemain", insert[20]);
            sqlcmd.Parameters.AddWithValue("@PPrice", insert[6]);
            sqlcmd.Parameters.AddWithValue("@PSelPrice", insert[7]);
            sqlcmd.Parameters.AddWithValue("@CollectionOldPrice", insert[21]);
            sqlcmd.Parameters.AddWithValue("@CollectionPrice", insert[14]);
            sqlcmd.Parameters.AddWithValue("@Vat", insert[16]);
            sqlcmd.Parameters.AddWithValue("@Discount", insert[17]);
            sqlcmd.Parameters.AddWithValue("@Quantity", insert[5]);
            //sqlcmd.Parameters.AddWithValue("@PDescription", insert[11]);
            //sqlcmd.Parameters.AddWithValue("@PProductDetails", insert[12]);
            sqlcmd.Parameters.AddWithValue("@Ingredients", insert[22]);
            sqlcmd.Parameters.AddWithValue("@NutritionValue", insert[23]);
            sqlcmd.Parameters.AddWithValue("@AllergyAdvice", insert[24]);
            sqlcmd.Parameters.AddWithValue("@Unit", insert[8]);
            //sqlcmd.Parameters.AddWithValue("@Section", insert[25]);
            sqlcmd.Parameters.AddWithValue("@PID", PID);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable GetImageformImagetable(string Category)
    {
        con();
        string id = @"Select *  from tblProductImages where PID='" + Category + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetImageformImagetable1(string Category)
    {
        con();
        string id = @"Select top 1* from tblProductImages where PID='" + Category + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetBrandsRowID(string PID, string BrandID)
    {
        con();
        string id = @"Select *  from ProductBrand where PID='" + PID + "' and BrandID='" + BrandID + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }


    public bool EditCustomer(string[] insert)
    {
        try
        {
            con();
            string Save = "Update CustomerRegistration set Distance=@Distance,Phone=@Phone,Email=@Email,Password=@Password where ID=@ID ";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@Distance", insert[0]);
            sqlcmd.Parameters.AddWithValue("@Phone", insert[3]);
            sqlcmd.Parameters.AddWithValue("@Email", insert[1]);
            sqlcmd.Parameters.AddWithValue("@Password", insert[2]);
            sqlcmd.Parameters.AddWithValue("@ID", insert[4]);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable CheckDistance(string email, string password)
    {
        con();
        string id = @"Select *  from CustomerRegistration where Email='" + email + "' and Password='" + password + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetCollectionTimeSlot()
    {
        con();
        string id = @"Select *  from CollectionTime";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getCustomersOrder(string Email)
    {
        con();
        string id = @"select * from TblOrder where Customerid='" + Email + "' and Status!='Processing' Order by Id Desc ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable getCustomersOrderRecentInvoice(string Email)
    {
        con();
        string id = @"select * from TblOrder where Customerid='" + Email + "' and Status='Processing' Order by Id Desc ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable getCustomersOrderRecentInvoice1(string Email)
    {
        con();
        string id = @"select orderid,Date,ShoppingType,Status,SUM(Total) as Total, SUM(Vat) as Vat from TblOrder where Customerid='" + Email + "' and Status='Processing' group by orderid,Date,ShoppingType,Status order by orderid desc ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetCustomersOrderByOrderId(string Email, string orderId)
    {
        con();
        string id = @"select * from TblOrder where Customerid='" + Email + "' and orderid='"+orderId+"' ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable getAllCustomersOrder()
    {
        con();
        string id = @"select * from TblOrder inner join CustomerRegistration on TblOrder.Customerid=CustomerRegistration.Email ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable LoadOrderByOrderID(string orderNo)
    {
        con();
        string id = @"select * from TblOrder inner join CustomerRegistration on TblOrder.Customerid=CustomerRegistration.Email where orderid='" + orderNo + "' ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable checkEmail(string email)
    {
        con();
        string id = @"select * from CustomerRegistration where Email='" + email + "' ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetOrderDetails(string orderID)
    {
        con();
        //string id = @"select * from TblOrder where orderid='" + orderID + "' ";
        string id = @"select orderid as OrderID,Pname as Product,Quantity,Price,Vat,Total from TblOrder where orderid='" + orderID + "' ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public bool UpdateAction(string Action, string orderNo)
    {
        try
        {
            con();
            string Save = "Update TblOrder set Status=@Status where orderid=@orderid ";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@Status", Action);
            sqlcmd.Parameters.AddWithValue("@orderid", orderNo);

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable Alltotal(string orderNo)
    {
        con();
        //string id = @"select * from TblOrder where orderid='" + orderID + "' ";
        string id = @"  select sum(Total) as Alltotal,FirstName,PostCode from TblOrder inner join CustomerRegistration on CustomerRegistration.Email=TblOrder.Customerid where orderid='" + orderNo + "' group by FirstName,PostCode ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetProductVattwenty(string orderNo)
    {
        con();
        //string id = @"select * from TblOrder where orderid='" + orderID + "' ";
        string id = @"select Vat as VatRate, SUM(Total) as Net,Vat*SUM(Total)/100 as Vat from TblOrder where Vat=20 and orderid='" + orderNo + "' group by  Vat  ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetProductVatzero(string orderNo)
    {
        con();
        //string id = @"select * from TblOrder where orderid='" + orderID + "' ";
        string id = @"select Vat as VatRate, SUM(Total) as Net,Vat*SUM(Total)/100 as Vat from TblOrder where Vat=0 and orderid='" + orderNo + "' group by  Vat  ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    //   public DataTable GetProductVat(string orderNo)
    //   {
    //       con();
    //       //string id = @"select * from TblOrder where orderid='" + orderID + "' ";
    //       string id = @"select Vat, 
    //  (select SUM(Total) from TblOrder where Vat=20 and orderid='OSN206')as withtwentypercentvat,
    //  (select SUM(Total) from TblOrder where Vat=0 and orderid='OSN206')as withzeropercentvat,
    //  ((select SUM(Total) from TblOrder where Vat=20 and orderid='OSN206')*Vat/100) as productvat
    //from  TblOrder where orderid='"+orderNo+"' group by  Vat";
    //       DataTable dta = new DataTable();
    //       SqlDataAdapter da = new SqlDataAdapter(id, cn);
    //       da.Fill(dta);
    //       return dta;
    //   }


    public DataTable CheckPasswordbymail(string email)
    {
        con();
        //string id = @"select * from TblOrder where orderid='" + orderID + "' ";
        string id = @"select * from CustomerRegistration where Email='" + email + "' ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable CheckHeaderBanner()
    {
        con();
        //string id = @"select * from TblOrder where orderid='" + orderID + "' ";
        string id = @"select * from HeaderBannerCheck where Allow='1' ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public bool insertBannerShowhide(string selectedValue)
    {
        try
        {
            con();
            string Save = "UPDATE HeaderBannerCheck set Allow=@Allow where ID=@ID";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@Allow", selectedValue);
            sqlcmd.Parameters.AddWithValue("@ID", '1');

            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool InsertSubcriptionEmail(string email, string Date)
    {
        try
        {
            con();
            string Save = "Insert into EmailSubcription (Email,SubmissionDate)values(@Email,@SubmissionDate)";
            sqlcmd = new SqlCommand(Save, cn);
            sqlcmd.Parameters.AddWithValue("@Email", email);
            sqlcmd.Parameters.AddWithValue("@SubmissionDate", Date);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public DataTable LoadSubcriptionEmail()
    {
        con();
        //string id = @"select * from TblOrder where orderid='" + orderID + "' ";
        string id = @"select * from EmailSubcription order by ID desc ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }

    public DataTable GetProductSizeById(string pID)
    {
        con();
        string id = @"select * from tblProductSizeQuantity Where PID='" + pID + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetProductSectionById(string pID)
    {
        con();
        string id = @"select * from ProductSection Where PID='" + pID + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetProductCategoryById(string pID)
    {
        con();
        string id = @"select * from ProductCategory Where PID='" + pID + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetProductSubCategoryById(string pID)
    {
        con();
        string id = @"select * from ProductSubCategory Where PID='" + pID + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public DataTable GetProductBrandById(string pID)
    {
        con();
        string id = @"select * from ProductBrand Where PID='" + pID + "'";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
    public bool DeleteProductSize(string pID)
    {
        try
        {
            con();
            string insertreginfo = "Delete from tblProductSizeQuantity where PID='" + pID + "' ";
            sqlcmd = new SqlCommand(insertreginfo, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }
    public bool DeleteProductCategory(string pID)
    {
        try
        {
            con();
            string insertreginfo = "Delete from ProductCategory where PID='" + pID + "' ";
            sqlcmd = new SqlCommand(insertreginfo, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }
    public bool DeleteProductSubCategory(string pID)
    {
        try
        {
            con();
            string insertreginfo = "Delete from ProductSubCategory where PID='" + pID + "' ";
            sqlcmd = new SqlCommand(insertreginfo, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool DeleteProductBrand(string pID)
    {
        try
        {
            con();
            string insertreginfo = "Delete from ProductBrand where PID='" + pID + "' ";
            sqlcmd = new SqlCommand(insertreginfo, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }
    public bool DeleteProductSection(string pID)
    {
        try
        {
            con();
            string insertreginfo = "Delete from ProductSection where PID='" + pID + "' ";
            sqlcmd = new SqlCommand(insertreginfo, cn);
            sqlcmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }

     public DataTable LoadOrderByOrderID1(string orderNo)
    {
        con();
        string id = @"select Top 1.* from TblOrder inner join CustomerRegistration on TblOrder.Customerid=CustomerRegistration.Email where orderid='" + orderNo + "' ";
        DataTable dta = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(id, cn);
        da.Fill(dta);
        return dta;
    }
}