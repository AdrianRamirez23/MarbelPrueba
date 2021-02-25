using MVC.Web.Marbel.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace MVC.Web.Marbel.Controllers
{
    public class SolicitudClientesController : Controller
    {
        private static string url = "https://localhost:44360/ClienteSolicitud";
        // GET: SolicitudClientes
        public ActionResult Index()
        {
            try
            {
                string Metodo = "ListaServiciosClientes";
                var json = new WebClient().DownloadString(url + Metodo);
                dynamic m = JsonConvert.DeserializeObject(json);

                List<ClienteSolicitud> Servicios = new List<ClienteSolicitud>();

                foreach (var sol in m)
                {
                    ClienteSolicitud solBack = new ClienteSolicitud();
                    solBack.idCliente = sol.idCliente;
                    solBack.PrimerNombre = sol.PrimerNombre;
                    solBack.SegundoNombre = sol.SegundoNombre;
                    solBack.PrimerApellido = sol.PrimerApellido;
                    solBack.SegundoApellido = sol.SegundoApellido;
                    solBack.TipoDocumento = sol.TipoDocumento;
                    solBack.Direccion = sol.Direccion;
                    solBack.Celular = sol.Celular;
                    solBack.Email = sol.Email;
                    solBack.TipoVehiculo = sol.TipoVehiculo;
                    solBack.PlacaVehiculo = sol.PlacaVehiculo;
                    solBack.DescripcionSolicitud = sol.DescripcionSolicitud;
                    solBack.Presupuesto = sol.Presupuesto;
                    solBack.idSolicitud = sol.idSolicitud;
                    solBack.EstadoSolicitud = sol.EstadoSolicitud;
                    Servicios.Add(solBack);
                }
                return View(Servicios);
            }
            catch (Exception ex)
            {

                throw(ex);
            }
            
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ClienteSolicitud Sol)
        {
            if (!ModelState.IsValid)
                return View();
            try
            {
                string metodo = "CrearClienteSolicitud";
                string Result = null;
                var objson = JsonConvert.SerializeObject(Sol);

                WebRequest request = WebRequest.Create(url + metodo);
                request.Method = "post";
                request.ContentType = "application/json;charset=UTF-8";

                using (var oSW = new StreamWriter(request.GetRequestStream()))
                {
                    oSW.Write(objson);
                    oSW.Flush();
                    oSW.Close();
                }
                WebResponse respon = request.GetResponse();

                using (var oSR = new StreamReader(respon.GetResponseStream()))
                {
                    Result = oSR.ReadToEnd();
                }

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public ActionResult Edit(string idCliente)
        {
            try
            {
                string Metodo = "ListaServiciosXClientes?idCliente=" + idCliente;
                var json = new WebClient().DownloadString(url + Metodo);
                var m = JsonConvert.DeserializeObject<ClienteSolicitud>(json);

                ClienteSolicitud Sol = new ClienteSolicitud();
                Sol.idCliente = m.idCliente;
                Sol.PrimerNombre = m.PrimerNombre;
                Sol.SegundoNombre = m.SegundoNombre;
                Sol.PrimerApellido = m.PrimerApellido;
                Sol.SegundoApellido = m.SegundoApellido;
                Sol.TipoDocumento = m.TipoDocumento;
                Sol.Direccion = m.Direccion;
                Sol.Celular = m.Celular;
                Sol.Email = m.Email;
                Sol.TipoVehiculo = m.TipoVehiculo;
                Sol.PlacaVehiculo = m.PlacaVehiculo;
                Sol.DescripcionSolicitud = m.DescripcionSolicitud;
                Sol.Presupuesto = m.Presupuesto;
                Sol.idSolicitud = m.idSolicitud;
                Sol.EstadoSolicitud = m.EstadoSolicitud;

                return View(Sol);
            }
            catch (Exception)
            {

                throw;
            }
        }
        [HttpPut]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ClienteSolicitud Sol)
        {
            if (!ModelState.IsValid)
                return View();
            try
            {
                string metodo = "EditarServiciosClientes";
                string Result = null;
                var objson = JsonConvert.SerializeObject(Sol);

                WebRequest request = WebRequest.Create(url + metodo);
                request.Method = "put";
                request.ContentType = "application/json;charset=UTF-8";

                using (var oSW = new StreamWriter(request.GetRequestStream()))
                {
                    oSW.Write(objson);
                    oSW.Flush();
                    oSW.Close();
                }
                WebResponse respon = request.GetResponse();

                using (var oSR = new StreamReader(respon.GetResponseStream()))
                {
                    Result = oSR.ReadToEnd();
                }

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public ActionResult Delete(int idsol, string idCliente)
        {
            try
            {         
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(url);

                    var deletetask = client.DeleteAsync($"EliminarServiciosXClientes?idsol=" + idsol.ToString() + "&idCliente=" + idCliente);
                    deletetask.Wait();
                    var result = deletetask.Result;
                    if (result.IsSuccessStatusCode)
                    {
                        return RedirectToAction("Index");
                    }
                  
                }
                return View("Index");
                    
            }
            catch (Exception ex)
            {

                throw(ex);
            }
        }
      
      

    }
}