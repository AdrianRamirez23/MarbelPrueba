using ADO.APIMarbel.Maestros;
using ADO.APIMarbel.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO.APIMarbel.Services
{
    public class ToFront
    {
        public void CrearClienteSolicitud(Cliente_SolicitudBack sol)
        {
            new Cliente_SolicitudBL().CrearClienteSolicitud(sol);
        }
        public List<Cliente_SolicitudBack> ListaServiciosClientes()
        {
            return new Cliente_SolicitudBL().ListaServiciosClientes();
        }
        public Cliente_SolicitudBack ListaServiciosXClientes(string idCliente)
        {
            return new Cliente_SolicitudBL().ListaServiciosXClientes(idCliente);
        }
        public void EditarServiciosClientes(Cliente_SolicitudBack sol)
        {
            new Cliente_SolicitudBL().EditarServiciosClientes(sol);
        }
        public void EliminarServiciosXClientes(int idsol, string idCliente)
        {
            new Cliente_SolicitudBL().EliminarServiciosXClientes(idsol, idCliente);
        }
    }
}
