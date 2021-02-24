using ADO.APIMarbel.Maestros;
using ADO.APIMarbel.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Web.API_Marbel.Models;

namespace Web.API_Marbel.Controllers
{
    /// <summary>
    /// Api principal del proyecto
    /// </summary>
    [RoutePrefix("ClienteSolicitud")]
    public class ClienteSolicitudController : ApiController
    {
        //POST: api/ClienteSolicitud/CrearClienteSolicitud
        ///<summary>
        ///Crea una nueva solicitud de servicio
        /// </summary>
        [Route("CrearClienteSolicitud")]
        [HttpPost]
        public IHttpActionResult CrearClienteSolicitud(Cliente_Solicitud Clisol)
        {
            if (!ModelState.IsValid)
            {
                return NotFound();
            }
            else
            {
                Cliente_SolicitudBack solBack = new Cliente_SolicitudBack();
                solBack.idCliente = Clisol.idCliente;
                solBack.PrimerNombre = Clisol.PrimerNombre;
                solBack.SegundoNombre = Clisol.SegundoNombre;
                solBack.PrimerApellido = Clisol.PrimerApellido;
                solBack.SegundoApellido = Clisol.SegundoApellido    ;
                solBack.TipoDocumento = Clisol.TipoDocumento;
                solBack.Direccion = Clisol.Direccion;
                solBack.Celular = Clisol.Celular;
                solBack.Email = Clisol.Email;
                solBack.TipoVehiculo = Clisol.TipoVehiculo;
                solBack.PlacaVehiculo = Clisol.PlacaVehiculo;
                solBack.DescripcionSolicitud = Clisol.DescripcionSolicitud;
                solBack.Presupuesto = Clisol.Presupuesto;
                solBack.EstadoSolicitud = Clisol.EstadoSolicitud;
              
                new ToFront().CrearClienteSolicitud(solBack);
                return Ok();
            }
        }
        //GET: api/ClienteSolicitud/ListaServiciosClientes
        ///<summary>
        ///Lista servicios agendados
        /// </summary>
        [Route("ListaServiciosClientes")]
        [HttpGet]
        public List<Cliente_Solicitud> ListaServiciosClientes()
        {

            List<Cliente_SolicitudBack> solBack = new List<Cliente_SolicitudBack>();
            List<Cliente_Solicitud> Clisol = new List<Cliente_Solicitud>();

            solBack = new ToFront().ListaServiciosClientes();

            foreach (Cliente_SolicitudBack sols in solBack)
            {
                Cliente_Solicitud solB = new Cliente_Solicitud();
                solB.idCliente = sols.idCliente;
                solB.PrimerNombre = sols.PrimerNombre;
                solB.SegundoNombre = sols.SegundoNombre;
                solB.PrimerApellido = sols.PrimerApellido;
                solB.SegundoApellido = sols.SegundoApellido;
                solB.TipoDocumento = sols.TipoDocumento;
                solB.Direccion = sols.Direccion;
                solB.Celular = sols.Celular;
                solB.Email = sols.Email;
                solB.TipoVehiculo = sols.TipoVehiculo;
                solB.PlacaVehiculo = sols.PlacaVehiculo;
                solB.DescripcionSolicitud = sols.DescripcionSolicitud;
                solB.Presupuesto = sols.Presupuesto;
                solB.idSolicitud = sols.idSolicitud;
                solB.EstadoSolicitud = sols.EstadoSolicitud;
                Clisol.Add(solB);
            }
            return Clisol;
        }
        //GET: api/ClienteSolicitud/ListaServiciosXClientes
        ///<summary>
        ///Lista servicios agendados
        /// </summary>
        [Route("ListaServiciosXClientes")]
        [HttpGet]
        public Cliente_Solicitud ListaServiciosXClientes(string idCliente)
        {
            Cliente_SolicitudBack solBack = new Cliente_SolicitudBack();
            Cliente_Solicitud Clisol = new Cliente_Solicitud();
            if (!string.IsNullOrEmpty(idCliente))
            {
                solBack = new ToFront().ListaServiciosXClientes(idCliente);

                Clisol.idCliente = solBack.idCliente;
                Clisol.PrimerNombre = solBack.PrimerNombre;
                Clisol.SegundoNombre = solBack.SegundoNombre;
                Clisol.PrimerApellido = solBack.PrimerApellido;
                Clisol.SegundoApellido = solBack.SegundoApellido;
                Clisol.TipoDocumento = solBack.TipoDocumento;
                Clisol.Direccion = solBack.Direccion;
                Clisol.Celular = solBack.Celular;
                Clisol.Email = solBack.Email;
                Clisol.TipoVehiculo = solBack.TipoVehiculo;
                Clisol.PlacaVehiculo = solBack.PlacaVehiculo;
                Clisol.DescripcionSolicitud = solBack.DescripcionSolicitud;
                Clisol.Presupuesto = solBack.Presupuesto;
                Clisol.idSolicitud = solBack.idSolicitud;
                Clisol.EstadoSolicitud = solBack.EstadoSolicitud;

                return Clisol;
            }
            else
            {
                return Clisol;
            }
        }
        //PUT: api/ClienteSolicitud/EditarServiciosClientes
        ///<summary>
        ///Lista servicios agendados
        /// </summary>
        [Route("EditarServiciosClientes")]
        [HttpPut]
        public IHttpActionResult EditarServiciosClientes(Cliente_Solicitud sol)
        {
            
            
            if (ModelState.IsValid)
            {
                Cliente_SolicitudBack solBack = new Cliente_SolicitudBack();
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

                 new ToFront().EditarServiciosClientes(solBack);

                return Ok();
            }
            else
            {
                return NotFound();
            }
        }
        //DELETE: api/ClienteSolicitud/EliminarServiciosXClientes
        ///<summary>
        ///Lista servicios agendados
        /// </summary>
        [Route("EliminarServiciosXClientes")]
        [HttpDelete]
        public IHttpActionResult EliminarServiciosXClientes(int idsol, string idCliente)
        {

            if (idsol!=0 && !string.IsNullOrEmpty(idCliente))
            {

                new ToFront().EliminarServiciosXClientes(idsol, idCliente);

                return Ok();
            }
            else
            {
                return NotFound();
            }
        }
    }
}
