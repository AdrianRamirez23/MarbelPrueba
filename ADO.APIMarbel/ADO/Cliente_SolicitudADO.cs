using ADO.APIMarbel.Maestros;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO.APIMarbel.ADO
{
    class Cliente_SolicitudADO
    {
        private string Conexion = ConfigurationManager.ConnectionStrings["SQLConection"].ConnectionString;

        internal void CrearClienteSolicitud(Cliente_SolicitudBack sol)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Conexion))
                {
                    string sentencia = "exec Marbel_Clientes_CRUD 1,'"+sol.idCliente+"','"+sol.PrimerNombre+"','"+sol.SegundoNombre+"','"+sol.PrimerApellido+"','"+sol.SegundoApellido+"','"+sol.TipoDocumento+"','"+sol.Direccion+"','"+sol.Celular+"','"+sol.Email+"','"+sol.TipoVehiculo+"','"+sol.PlacaVehiculo+"','"+sol.DescripcionSolicitud+"','"+sol.Presupuesto+"','','"+sol.EstadoSolicitud+"','"+sol.idMecanico+"'";
                    SqlCommand cmd = new SqlCommand(sentencia, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw(ex);
            }
        }
        internal List<Cliente_SolicitudBack> ListaServiciosClientes()
        {
            try
            {
                List<Cliente_SolicitudBack> sols = new List<Cliente_SolicitudBack>();
                using (SqlConnection con = new SqlConnection(Conexion))
                {
                    string sentencia = "exec Marbel_Clientes_CRUD 2,'','','','','','','','','','','','','','','',''";
                    SqlCommand cmd = new SqlCommand(sentencia, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Cliente_SolicitudBack sol = new Cliente_SolicitudBack();
                        sol.idCliente = rdr[0] == DBNull.Value ? "" : rdr.GetString(0);
                        sol.PrimerNombre = rdr[1] == DBNull.Value ? "" : rdr.GetString(1);
                        sol.SegundoNombre = rdr[2] == DBNull.Value ? "" : rdr.GetString(2);
                        sol.PrimerApellido = rdr[3] == DBNull.Value ? "" : rdr.GetString(3);
                        sol.SegundoApellido = rdr[4] == DBNull.Value ? "" : rdr.GetString(4);
                        sol.TipoDocumento = rdr[5] == DBNull.Value ? "" : rdr.GetString(5);
                        sol.Direccion = rdr[6] == DBNull.Value ? "" : rdr.GetString(6);
                        sol.Celular = rdr[7] == DBNull.Value ? "" : rdr.GetString(7);
                        sol.Email = rdr[8] == DBNull.Value ? "" : rdr.GetString(8);
                        sol.TipoVehiculo = rdr[9] == DBNull.Value ? "" : rdr.GetString(9);
                        sol.PlacaVehiculo = rdr[10] == DBNull.Value ? "" : rdr.GetString(10);
                        sol.DescripcionSolicitud = rdr[11] == DBNull.Value ? "" : rdr.GetString(11);
                        sol.FechaSolicitud = rdr[12] == DBNull.Value ? Convert.ToDateTime("yyyy-mm-dd") : rdr.GetDateTime(12);
                        sol.Presupuesto = rdr[13] == DBNull.Value ? 0 : float.Parse(rdr.GetValue(13).ToString());
                        sol.idSolicitud = rdr[14] == DBNull.Value ? 0 : rdr.GetInt32(14);
                        sol.EstadoSolicitud = rdr[15] == DBNull.Value ? "" : rdr.GetString(15);
                        sols.Add(sol);
                    }
                    return sols;
                }
            }
            catch (Exception ex)
            {

                throw(ex);
            }
        }
        internal Cliente_SolicitudBack ListaServiciosXClientes(string idCliente)
        {
            try
            {
                Cliente_SolicitudBack sol = new Cliente_SolicitudBack();
                using (SqlConnection con = new SqlConnection(Conexion))
                {
                    string sentencia = "exec Marbel_Clientes_CRUD 3,'"+idCliente+"','','','','','','','','','','','','','','',''";
                    SqlCommand cmd = new SqlCommand(sentencia, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                       
                        sol.idCliente = rdr[0] == DBNull.Value ? "" : rdr.GetString(0);
                        sol.PrimerNombre = rdr[1] == DBNull.Value ? "" : rdr.GetString(1);
                        sol.SegundoNombre = rdr[2] == DBNull.Value ? "" : rdr.GetString(2);
                        sol.PrimerApellido = rdr[3] == DBNull.Value ? "" : rdr.GetString(3);
                        sol.SegundoApellido = rdr[4] == DBNull.Value ? "" : rdr.GetString(4);
                        sol.TipoDocumento = rdr[5] == DBNull.Value ? "" : rdr.GetString(5);
                        sol.Direccion = rdr[6] == DBNull.Value ? "" : rdr.GetString(6);
                        sol.Celular = rdr[7] == DBNull.Value ? "" : rdr.GetString(7);
                        sol.Email = rdr[8] == DBNull.Value ? "" : rdr.GetString(8);
                        sol.TipoVehiculo = rdr[9] == DBNull.Value ? "" : rdr.GetString(9);
                        sol.PlacaVehiculo = rdr[10] == DBNull.Value ? "" : rdr.GetString(10);
                        sol.DescripcionSolicitud = rdr[11] == DBNull.Value ? "" : rdr.GetString(11);
                        sol.FechaSolicitud = rdr[12] == DBNull.Value ? Convert.ToDateTime("yyyy-mm-dd") : rdr.GetDateTime(12);
                        sol.Presupuesto = rdr[13] == DBNull.Value ? 0 : float.Parse(rdr.GetValue(13).ToString());
                        sol.idSolicitud = rdr[14] == DBNull.Value ? 0 : rdr.GetInt32(14);
                        sol.EstadoSolicitud = rdr[15] == DBNull.Value ? "" : rdr.GetString(15);
                        
                    }
                    return sol;
                }
            }
            catch (Exception ex)
            {

                throw (ex);
            }
        }
        internal void EditarServiciosClientes(Cliente_SolicitudBack sol)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Conexion))
                {
                    string sentencia = "exec Marbel_Clientes_CRUD 4,'" + sol.idCliente + "','" + sol.PrimerNombre + "','" + sol.SegundoNombre + "','" + sol.PrimerApellido + "','" + sol.SegundoApellido + "','" + sol.TipoDocumento + "','" + sol.Direccion + "','" + sol.Celular + "','" + sol.Email + "','" + sol.TipoVehiculo + "','" + sol.PlacaVehiculo + "','" + sol.DescripcionSolicitud + "','" + sol.Presupuesto + "','','" + sol.EstadoSolicitud + "','" + sol.idMecanico + "'";
                    SqlCommand cmd = new SqlCommand(sentencia, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
      
        internal void EliminarServiciosXClientes(int idsol, string idCliente)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Conexion))
                {
                    string sentencia = "exec Marbel_Clientes_CRUD 5,'" +idCliente + "','','','','','','',','','','','','','"+idsol+"','',''";
                    SqlCommand cmd = new SqlCommand(sentencia, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
    }
}
