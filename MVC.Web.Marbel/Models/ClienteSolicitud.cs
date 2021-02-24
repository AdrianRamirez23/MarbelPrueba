using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC.Web.Marbel.Models
{
    public class ClienteSolicitud
    {
        public string idCliente { get; set; }  
        public string PrimerNombre { get; set; }
        public string SegundoNombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string TipoDocumento { get; set; }
        public string Direccion { get; set; } 
        public string Celular { get; set; }
        public string Email { get; set; }
        public string TipoVehiculo { get; set; }
        public string PlacaVehiculo { get; set; }
        public string DescripcionSolicitud { get; set; }
        public DateTime FechaSolicitud { get; set; }
        public float Presupuesto { get; set; }
        public int idSolicitud { get; set; }
        public string EstadoSolicitud { get; set; }
        public string idMecanico { get; set; }
    }
}