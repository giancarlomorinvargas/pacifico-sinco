﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.18063
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pacifico.SINCO.WEB.wsPresupuesto {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="wsPresupuesto.IPresupuestoWS")]
    public interface IPresupuestoWS {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/wsObtenerNombreWS", ReplyAction="http://tempuri.org/IPresupuestoWS/wsObtenerNombreWSResponse")]
        string wsObtenerNombreWS();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/wsObtenerNombreWS", ReplyAction="http://tempuri.org/IPresupuestoWS/wsObtenerNombreWSResponse")]
        System.Threading.Tasks.Task<string> wsObtenerNombreWSAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ObtenerPresupuesto", ReplyAction="http://tempuri.org/IPresupuestoWS/ObtenerPresupuestoResponse")]
        string ObtenerPresupuesto(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ObtenerPresupuesto", ReplyAction="http://tempuri.org/IPresupuestoWS/ObtenerPresupuestoResponse")]
        System.Threading.Tasks.Task<string> ObtenerPresupuestoAsync(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ListarPresupuesto", ReplyAction="http://tempuri.org/IPresupuestoWS/ListarPresupuestoResponse")]
        string ListarPresupuesto();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ListarPresupuesto", ReplyAction="http://tempuri.org/IPresupuestoWS/ListarPresupuestoResponse")]
        System.Threading.Tasks.Task<string> ListarPresupuestoAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/BuscarPresupuesto", ReplyAction="http://tempuri.org/IPresupuestoWS/BuscarPresupuestoResponse")]
        string BuscarPresupuesto(string numPresupuesto, string numInforme, string numPoliza, string fechaPresupuesto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/BuscarPresupuesto", ReplyAction="http://tempuri.org/IPresupuestoWS/BuscarPresupuestoResponse")]
        System.Threading.Tasks.Task<string> BuscarPresupuestoAsync(string numPresupuesto, string numInforme, string numPoliza, string fechaPresupuesto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/AgregarPresupuesto", ReplyAction="http://tempuri.org/IPresupuestoWS/AgregarPresupuestoResponse")]
        string AgregarPresupuesto(Pacifico.SINCO.EN.PresupuestoEN presupuesto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/AgregarPresupuesto", ReplyAction="http://tempuri.org/IPresupuestoWS/AgregarPresupuestoResponse")]
        System.Threading.Tasks.Task<string> AgregarPresupuestoAsync(Pacifico.SINCO.EN.PresupuestoEN presupuesto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ModificarPresupuesto", ReplyAction="http://tempuri.org/IPresupuestoWS/ModificarPresupuestoResponse")]
        string ModificarPresupuesto(Pacifico.SINCO.EN.PresupuestoEN presupuesto, Pacifico.SINCO.EN.DetallePresupuestoEN[] destallePresupuesto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ModificarPresupuesto", ReplyAction="http://tempuri.org/IPresupuestoWS/ModificarPresupuestoResponse")]
        System.Threading.Tasks.Task<string> ModificarPresupuestoAsync(Pacifico.SINCO.EN.PresupuestoEN presupuesto, Pacifico.SINCO.EN.DetallePresupuestoEN[] destallePresupuesto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ListarPresupuestoPendiente", ReplyAction="http://tempuri.org/IPresupuestoWS/ListarPresupuestoPendienteResponse")]
        string ListarPresupuestoPendiente();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ListarPresupuestoPendiente", ReplyAction="http://tempuri.org/IPresupuestoWS/ListarPresupuestoPendienteResponse")]
        System.Threading.Tasks.Task<string> ListarPresupuestoPendienteAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ObtenerPresupuestoDetalle", ReplyAction="http://tempuri.org/IPresupuestoWS/ObtenerPresupuestoDetalleResponse")]
        string ObtenerPresupuestoDetalle(int numPresupuesto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ObtenerPresupuestoDetalle", ReplyAction="http://tempuri.org/IPresupuestoWS/ObtenerPresupuestoDetalleResponse")]
        System.Threading.Tasks.Task<string> ObtenerPresupuestoDetalleAsync(int numPresupuesto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ObtenerPresupuestoPendienteDetalle", ReplyAction="http://tempuri.org/IPresupuestoWS/ObtenerPresupuestoPendienteDetalleResponse")]
        string ObtenerPresupuestoPendienteDetalle(int Id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPresupuestoWS/ObtenerPresupuestoPendienteDetalle", ReplyAction="http://tempuri.org/IPresupuestoWS/ObtenerPresupuestoPendienteDetalleResponse")]
        System.Threading.Tasks.Task<string> ObtenerPresupuestoPendienteDetalleAsync(int Id);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IPresupuestoWSChannel : Pacifico.SINCO.WEB.wsPresupuesto.IPresupuestoWS, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class PresupuestoWSClient : System.ServiceModel.ClientBase<Pacifico.SINCO.WEB.wsPresupuesto.IPresupuestoWS>, Pacifico.SINCO.WEB.wsPresupuesto.IPresupuestoWS {
        
        public PresupuestoWSClient() {
        }
        
        public PresupuestoWSClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public PresupuestoWSClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public PresupuestoWSClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public PresupuestoWSClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string wsObtenerNombreWS() {
            return base.Channel.wsObtenerNombreWS();
        }
        
        public System.Threading.Tasks.Task<string> wsObtenerNombreWSAsync() {
            return base.Channel.wsObtenerNombreWSAsync();
        }
        
        public string ObtenerPresupuesto(int id) {
            return base.Channel.ObtenerPresupuesto(id);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerPresupuestoAsync(int id) {
            return base.Channel.ObtenerPresupuestoAsync(id);
        }
        
        public string ListarPresupuesto() {
            return base.Channel.ListarPresupuesto();
        }
        
        public System.Threading.Tasks.Task<string> ListarPresupuestoAsync() {
            return base.Channel.ListarPresupuestoAsync();
        }
        
        public string BuscarPresupuesto(string numPresupuesto, string numInforme, string numPoliza, string fechaPresupuesto) {
            return base.Channel.BuscarPresupuesto(numPresupuesto, numInforme, numPoliza, fechaPresupuesto);
        }
        
        public System.Threading.Tasks.Task<string> BuscarPresupuestoAsync(string numPresupuesto, string numInforme, string numPoliza, string fechaPresupuesto) {
            return base.Channel.BuscarPresupuestoAsync(numPresupuesto, numInforme, numPoliza, fechaPresupuesto);
        }
        
        public string AgregarPresupuesto(Pacifico.SINCO.EN.PresupuestoEN presupuesto) {
            return base.Channel.AgregarPresupuesto(presupuesto);
        }
        
        public System.Threading.Tasks.Task<string> AgregarPresupuestoAsync(Pacifico.SINCO.EN.PresupuestoEN presupuesto) {
            return base.Channel.AgregarPresupuestoAsync(presupuesto);
        }
        
        public string ModificarPresupuesto(Pacifico.SINCO.EN.PresupuestoEN presupuesto, Pacifico.SINCO.EN.DetallePresupuestoEN[] destallePresupuesto) {
            return base.Channel.ModificarPresupuesto(presupuesto, destallePresupuesto);
        }
        
        public System.Threading.Tasks.Task<string> ModificarPresupuestoAsync(Pacifico.SINCO.EN.PresupuestoEN presupuesto, Pacifico.SINCO.EN.DetallePresupuestoEN[] destallePresupuesto) {
            return base.Channel.ModificarPresupuestoAsync(presupuesto, destallePresupuesto);
        }
        
        public string ListarPresupuestoPendiente() {
            return base.Channel.ListarPresupuestoPendiente();
        }
        
        public System.Threading.Tasks.Task<string> ListarPresupuestoPendienteAsync() {
            return base.Channel.ListarPresupuestoPendienteAsync();
        }
        
        public string ObtenerPresupuestoDetalle(int numPresupuesto) {
            return base.Channel.ObtenerPresupuestoDetalle(numPresupuesto);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerPresupuestoDetalleAsync(int numPresupuesto) {
            return base.Channel.ObtenerPresupuestoDetalleAsync(numPresupuesto);
        }
        
        public string ObtenerPresupuestoPendienteDetalle(int Id) {
            return base.Channel.ObtenerPresupuestoPendienteDetalle(Id);
        }
        
        public System.Threading.Tasks.Task<string> ObtenerPresupuestoPendienteDetalleAsync(int Id) {
            return base.Channel.ObtenerPresupuestoPendienteDetalleAsync(Id);
        }
    }
}
