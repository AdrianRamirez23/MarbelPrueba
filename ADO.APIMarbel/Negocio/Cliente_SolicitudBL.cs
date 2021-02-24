using ADO.APIMarbel.ADO;
using ADO.APIMarbel.Maestros;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO.APIMarbel.Negocio
{
    class Cliente_SolicitudBL
    {
        internal void CrearClienteSolicitud(Cliente_SolicitudBack sol)
        {
            new Cliente_SolicitudADO().CrearClienteSolicitud(sol);
        }
        internal List<Cliente_SolicitudBack> ListaServiciosClientes()
        {
            return new Cliente_SolicitudADO().ListaServiciosClientes();
        }
        internal Cliente_SolicitudBack ListaServiciosXClientes(string idCliente)
        {
            return new Cliente_SolicitudADO().ListaServiciosXClientes(idCliente);
        }
        internal void EditarServiciosClientes(Cliente_SolicitudBack sol)
        {
            new Cliente_SolicitudADO().EditarServiciosClientes(sol);
        }
        internal void EliminarServiciosXClientes(int idsol, string idCliente)
        {
            new Cliente_SolicitudADO().EliminarServiciosXClientes(idsol, idCliente);
        }
    }
}
