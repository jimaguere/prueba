using System;
using Microsoft.AspNet.SignalR;

/// <summary>
/// Página de inicio
/// </summary>
/// <author>Juan Sebastian Alvarez Eraso</author>
/// <date>27 Julio 2014</date>
public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    /// <summary>
    /// Este metodo se ejecutará cada segundo (Como se encuentra configurado en el control)
    /// y permitira conectarse con el hub de suma
    /// </summary>
    /// <param name="sender">Atributo del manejador del evento timer</param>
    /// <param name="e">Atributo del manejador del evento timer</param>
    /// <author>Juan Sebastian Alvarez Eraso</author>
    /// <date>27 Julio 2014</date>
    protected void UpdateTimer_Tick(object sender, EventArgs e)
    {
        //Si la suma es mayor a 100 no se pued enviar el número, entonces por defecto se setea en 0
        int resultado = Variables.Suma <= 100 ? Variables.Suma : 0;

        lblValor.Text = "Número enviado a la gráfica: " + resultado.ToString();

        //Se realiza la conexion al hub de suma para enviar el resultado de la suma
        var context = GlobalHost.ConnectionManager.GetHubContext<SumaHub>();
        //La suma generada es compartida por el canal de comunicación a todos los clientes conectados
        context.Clients.All.enviarMensaje(resultado);

        //La variable se inicializa en 0
        Variables.Suma = 0;
    }

}