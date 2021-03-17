using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using HoldPrintClient.Models;

namespace HoldPrintClient.CamadaDatabase
{
    public class db
    {
        SqlConnection Database = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);

         // Add Cliente

        public void Add_cliente(Cliente cli)

        {

            SqlCommand com = new SqlCommand("Sp_cliente", Database);

            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@Email", cli.Email);

            com.Parameters.AddWithValue("@Password", cli.Password);

            com.Parameters.AddWithValue("@Nome", cli.Nome);

            com.Parameters.AddWithValue("@Endereco", cli.Endereco);

            com.Parameters.AddWithValue("@Cidade", cli.Cidade);

            Database.Open();

            com.ExecuteNonQuery();

            Database.Close();

        }

        //Mostrar todos os clientes

        public DataSet get_cliente()

        {

            SqlCommand com = new SqlCommand("Sp_cliente_get", Database);

            com.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(com);

            DataSet ds = new DataSet();

            da.Fill(ds);

            return ds;

        }

        // Update todos Cliente

        public void update_cliente(Cliente cli)

        {

            SqlCommand com = new SqlCommand("Sp_cliente_Update", Database);

            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@Id", cli.Id);

            com.Parameters.AddWithValue("@Email", cli.Email);

            com.Parameters.AddWithValue("@Password", cli.Password);

            com.Parameters.AddWithValue("@Nome", cli.Nome);

            com.Parameters.AddWithValue("@Endereco", cli.Endereco);

            com.Parameters.AddWithValue("@Cidade", cli.Cidade);

            Database.Open();

            com.ExecuteNonQuery();

            Database.Close();

        }

        // Get Cliente by id

        public DataSet get_clientebyid(int id)

        {

            SqlCommand com = new SqlCommand("Sp_cliente_byid", Database);

            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@id", id);

            SqlDataAdapter da = new SqlDataAdapter(com);

            DataSet ds = new DataSet();

            da.Fill(ds);

            return ds;

        }

        // Delete record

        public void deletecliente(int id)

        {

            SqlCommand com = new SqlCommand("Sp_cliente_delete", Database);

            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@id", id);

            Database.Open();

            com.ExecuteNonQuery();

            Database.Close();

        }

    }

}
