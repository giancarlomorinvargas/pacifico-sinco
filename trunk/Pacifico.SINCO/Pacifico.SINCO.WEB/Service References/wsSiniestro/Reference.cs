﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34003
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pacifico.SINCO.WEB.wsSiniestro {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="wsSiniestro.IwsSiniestro")]
    public interface IwsSiniestro {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IwsSiniestro/wsObtenerNombreWS", ReplyAction="http://tempuri.org/IwsSiniestro/wsObtenerNombreWSResponse")]
        string wsObtenerNombreWS();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IwsSiniestro/wsObtenerNombreWS", ReplyAction="http://tempuri.org/IwsSiniestro/wsObtenerNombreWSResponse")]
        System.Threading.Tasks.Task<string> wsObtenerNombreWSAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IwsSiniestro/ListarSiniestro", ReplyAction="http://tempuri.org/IwsSiniestro/ListarSiniestroResponse")]
        Pacifico.SINCO.EN.enSiniestro[] ListarSiniestro(Pacifico.SINCO.EN.enSiniestro pEnSiniestro);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IwsSiniestro/ListarSiniestro", ReplyAction="http://tempuri.org/IwsSiniestro/ListarSiniestroResponse")]
        System.Threading.Tasks.Task<Pacifico.SINCO.EN.enSiniestro[]> ListarSiniestroAsync(Pacifico.SINCO.EN.enSiniestro pEnSiniestro);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IwsSiniestro/IngresarSiniestro", ReplyAction="http://tempuri.org/IwsSiniestro/IngresarSiniestroResponse")]
        bool IngresarSiniestro(Pacifico.SINCO.EN.enSiniestro pEnSiniestro);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IwsSiniestro/IngresarSiniestro", ReplyAction="http://tempuri.org/IwsSiniestro/IngresarSiniestroResponse")]
        System.Threading.Tasks.Task<bool> IngresarSiniestroAsync(Pacifico.SINCO.EN.enSiniestro pEnSiniestro);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IwsSiniestroChannel : Pacifico.SINCO.WEB.wsSiniestro.IwsSiniestro, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class IwsSiniestroClient : System.ServiceModel.ClientBase<Pacifico.SINCO.WEB.wsSiniestro.IwsSiniestro>, Pacifico.SINCO.WEB.wsSiniestro.IwsSiniestro {
        
        public IwsSiniestroClient() {
        }
        
        public IwsSiniestroClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public IwsSiniestroClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public IwsSiniestroClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public IwsSiniestroClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string wsObtenerNombreWS() {
            return base.Channel.wsObtenerNombreWS();
        }
        
        public System.Threading.Tasks.Task<string> wsObtenerNombreWSAsync() {
            return base.Channel.wsObtenerNombreWSAsync();
        }
        
        public Pacifico.SINCO.EN.enSiniestro[] ListarSiniestro(Pacifico.SINCO.EN.enSiniestro pEnSiniestro) {
            return base.Channel.ListarSiniestro(pEnSiniestro);
        }
        
        public System.Threading.Tasks.Task<Pacifico.SINCO.EN.enSiniestro[]> ListarSiniestroAsync(Pacifico.SINCO.EN.enSiniestro pEnSiniestro) {
            return base.Channel.ListarSiniestroAsync(pEnSiniestro);
        }
        
        public bool IngresarSiniestro(Pacifico.SINCO.EN.enSiniestro pEnSiniestro) {
            return base.Channel.IngresarSiniestro(pEnSiniestro);
        }
        
        public System.Threading.Tasks.Task<bool> IngresarSiniestroAsync(Pacifico.SINCO.EN.enSiniestro pEnSiniestro) {
            return base.Channel.IngresarSiniestroAsync(pEnSiniestro);
        }
    }
}
