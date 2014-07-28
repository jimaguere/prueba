using System;
using Microsoft.AspNet.SignalR;

/// <summary>
/// Clase que actua como Hub de conexion
/// </summary>
/// <author>Juan Sebastian Alvarez Eraso</author>
/// <date>27 Julio 2014</date>
public class SumaHub : Hub
{

    /// <summary>
    /// Este metodo permite enviar la suma generada a los clientes conectados al hub
    /// </summary>
    /// <author>Juan Sebastian Alvarez Eraso</author>
    /// <date>27 Julio 2014</date>
    public void EnviarSuma()
    {
        //La suma generada es compartida por el canal de comunicación a todos los clientes conectados
        Clients.All.enviarMensaje(Variables.Suma);
    }

}