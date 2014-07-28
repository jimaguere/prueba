using Microsoft.Owin;
using Owin;
[assembly: OwinStartup(typeof(Global))]

/// <summary>
/// Clase de configuración inicial
/// </summary>
/// <author>Juan Sebastian Alvarez Eraso</author>
/// <date>27 Julio 2014</date>
public class Global
{

    /// <summary>
    /// Este método permite la iniciar los hubs en la aplicación.
    /// Si se desea establecer una configuración determinada en un hub se debe hacer aqui.
    /// </summary>
    /// <param name="app">Atributo de configuración</param>
    /// <author>Juan Sebastian Alvarez Eraso</author>
    /// <date>27 Julio 2014</date>
    public void Configuration(IAppBuilder app)
    {        
        app.MapSignalR();        
    }

}