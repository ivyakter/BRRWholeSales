using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for DataUpLoadClass
/// </summary>
public class DataUpLoadClass
{

    public DataTable GetDataTable(string sql)
    {
        SqlConnection _connStr = new SqlConnection(ConfigurationManager.ConnectionStrings["DBcon"].ConnectionString);
        if (_connStr.State == ConnectionState.Closed)
        {
            _connStr.Open();
        }
        SqlCommand cmd = new SqlCommand(sql, _connStr);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        _connStr.Close();
        return dt;
        
    }

    public int InsertData(string sql)
    {
        SqlConnection _connStrServer = new SqlConnection(ConfigurationManager.ConnectionStrings["DBconT"].ConnectionString);
        if (_connStrServer.State == ConnectionState.Closed)
        {
            _connStrServer.Open();
        }
        SqlCommand cmd = new SqlCommand(sql, _connStrServer);
       int a = cmd.ExecuteNonQuery();

       _connStrServer.Close();
        return a;

    }
    public int InsertDataLocal(string sql)
    {
        SqlConnection _connStrServer = new SqlConnection(ConfigurationManager.ConnectionStrings["DBcon"].ConnectionString);
        if (_connStrServer.State == ConnectionState.Closed)
        {
            _connStrServer.Open();
        }
        SqlCommand cmd = new SqlCommand(sql, _connStrServer);
        int a = cmd.ExecuteNonQuery();

        _connStrServer.Close();
        return a;

    }


}