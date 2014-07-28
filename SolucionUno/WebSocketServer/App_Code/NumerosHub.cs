using System;
using Microsoft.AspNet.SignalR;

/// <summary>
/// Clase que actua como Hub de conexion
/// </summary>
/// <author>Juan Sebastian Alvarez Eraso</author>
/// <date>27 Julio 2014</date>
public class NumerosHub : Hub
{

    /// <summary>
    /// Este metodo permite recibir los numeros generados aleatoriamente
    /// </summary>
    /// <param name="numero">Variable que contiene el numero</param>
    /// <author>Juan Sebastian Alvarez Eraso</author>
    /// <date>27 Julio 2014</date>
    public void EnviarNumero(string numero)
    {
        int numeroObtenido = 0;
        try
        {
            numeroObtenido = Int32.Parse(numero);
        }
        catch(Exception ex)
        {
            //La cadena enviada al hub no corresponde a un número
        }

        //Se llama al metodo estatico que acumula los numeros
        Variables.acumular(numeroObtenido);

        //El numero recibido es compartido por el canal de comunicación a todos los clientes conectados
        Clients.All.enviarMensaje(numero);
    }

}