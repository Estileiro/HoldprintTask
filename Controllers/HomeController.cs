using HoldPrintClient.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HoldPrintClient.Controllers
{
    public class HomeController : Controller
    {
        CamadaDatabase.db dblayer = new CamadaDatabase.db();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetCliente()
        {
            return View();
        }

        public ActionResult UpdateCliente(int id)
        {
            return View();
        }
        //Add registro

        public JsonResult Add_registro(Cliente cli)

        {

            string res = string.Empty;

            try

            {

                dblayer.Add_cliente(cli);

                res = "Cliente Adicionado!";

            }

            catch (Exception)

            {

                res = "Falha ao adicionar cliente";

            }

            return Json(res, JsonRequestBehavior.AllowGet);



        }

        // Mostra todos os registros de clientes

        public JsonResult Get_registro()

        {

            DataSet ds = dblayer.get_cliente();

            List<Cliente> listrs = new List<Cliente>();

            foreach (DataRow dr in ds.Tables[0].Rows)

            {

                listrs.Add(new Cliente

                {

                    Id = Convert.ToInt32(dr["Id"]),

                    Email = dr["Email"].ToString(),

                    Password = dr["Password"].ToString(),

                    Nome = dr["Nome"].ToString(),

                    Endereco = dr["Endereco"].ToString(),

                    Cidade = dr["Cidade"].ToString()

                });

            }

            return Json(listrs, JsonRequestBehavior.AllowGet);

        }

        // Mostra registros de cliente pelo id

        public JsonResult Get_registrobyid(int id)

        {

            DataSet ds = dblayer.get_clientebyid(id);

            List<Cliente> listrs = new List<Cliente>();

            foreach (DataRow dr in ds.Tables[0].Rows)

            {

                listrs.Add(new Cliente

                {

                    Id = Convert.ToInt32(dr["Id"]),

                    Email = dr["Email"].ToString(),

                    Password = dr["Password"].ToString(),

                    Nome = dr["Nome"].ToString(),

                    Endereco = dr["Endereco"].ToString(),

                    Cidade = dr["Cidade"].ToString()

                });

            }

            return Json(listrs, JsonRequestBehavior.AllowGet);

        }

        // Update registro de clientes

        public JsonResult Update_registro(Cliente cli)

        {

            string res = string.Empty;

            try

            {

                dblayer.update_cliente(cli);

                res = "Cliente Atualizado!";

            }

            catch (Exception)

            {

                res = "Falha na atualização do cliente!";

            }

            return Json(res, JsonRequestBehavior.AllowGet);



        }

        // Delete registro de cliente

        public JsonResult delete_registro(int id)

        {

            string res = string.Empty;

            try

            {

                dblayer.deletecliente(id);

                res = "Cliente Excluído!";

            }

            catch (Exception)

            {

                res = "Falha na atualização do cliente!";

            }

            return Json(res, JsonRequestBehavior.AllowGet);

        }
    }
}