using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.API_Marbel.Models
{
    /// <summary>
    /// Clase cliente solicitud
    /// </summary>
    public class Cliente_Solicitud
    {
        /// <summary>
        /// Cedula del cliente
        /// </summary>
        public string idCliente { get; set; }
        /// <summary>
        /// Primer nombre del cliente
        /// </summary>
        public string PrimerNombre { get; set; }
        /// <summary>
        /// Segundo Nombre del cliente
        /// </summary>
        public string SegundoNombre { get; set; }
        /// <summary>
        /// Primer Apellido del cliente
        /// </summary>
        public string PrimerApellido { get; set; }
        /// <summary>
        /// Segundo Apellido del cliente
        /// </summary>
        public string SegundoApellido { get; set; }
        /// <summary>
        /// Tipo de Documento del cliente
        /// </summary>
        public string TipoDocumento { get; set; }
        /// <summary>
        /// Direccion del cliente
        /// </summary>
        public string Direccion { get; set; }
        /// <summary>
        /// Celular del cliente
        /// </summary>
        public string Celular { get; set; }
        /// <summary>
        /// Email del cliente
        /// </summary>
        public string Email { get; set; }
        /// <summary>
        /// Tipo vehiculo del cliente
        /// </summary>
        public string TipoVehiculo { get; set; }
        /// <summary>
        /// Placa del vehiculo del cliente
        /// </summary>
        public string PlacaVehiculo { get; set; } 
        /// <summary>
        /// Descripcion de la solicitud del cliente
        /// </summary>
        public string DescripcionSolicitud { get; set; }
        /// <summary>
        /// Fecha de la solicitud del cliente
        /// </summary>
        public DateTime FechaSolicitud { get; set; }
        /// <summary>
        /// Presupuesto indicado por el cliente
        /// </summary>
        public float Presupuesto { get; set; }
        /// <summary>
        /// Id de solicitud del cliente
        /// </summary>
        public int idSolicitud { get; set; }
        /// <summary>
        /// Estado de la solicitud del cliente
        /// </summary>
        public string EstadoSolicitud { get; set; }
        /// <summary>
        /// Mecanico asignado a la solcitud del cliente
        /// </summary>
        public string idMecanico { get; set; }
    }
}