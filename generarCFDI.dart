import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gnp_movil/PagoPolizaModule/ExraViews/ImporteView.dart';
import 'package:gnp_movil/Session/Session.dart';
import 'package:gnp_movil/ThemeGNP/OrangeButton.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/Providers/Models/DatosFiscalesCfdi.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/Providers/Models/ListaSiniestros.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/Providers/Models/pagoAplicadoCfdi.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/Widgets/NaranjaButtonGNPCustom.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/Widgets/TextFieldCfdi.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/Widgets/dialogCustomGNP.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/utils/constantesAutosDeducible.dart';
import 'package:gnp_movil/TramitesModule/TramitesController.dart';
import 'package:gnp_movil/Utils/AlertModule/GNPDialog.dart';
import 'package:gnp_movil/Utils/AlertModule/MyDialog.dart';
import 'package:gnp_movil/Utils/AppColors.dart';
import 'Providers/Models/pagoPolizaCFDI.dart';
import 'Providers/providersCFDI.dart';
import 'Widgets/CuadrosDatosAutos.dart';

class GenerarCFDI extends StatefulWidget {
final PagoPolizaCfdi pagoPoliza;
final PagoAplicadCfdi pago;
final DatosFiscalesCfdi datosFiscales;
final Vehiculo vehiculo;
final String tarjetaGuardada;
final String idPago;
  GenerarCFDI({Key key, this.pagoPoliza, this.pago, this.datosFiscales, this.vehiculo, this.tarjetaGuardada, this.idPago,}) : super(key: key);

  @override
  _GenerarCFDIState createState() => _GenerarCFDIState();
}




class _GenerarCFDIState extends State<GenerarCFDI> {
 final _formKey = GlobalKey<FormState>();

TextEditingController nombre = new TextEditingController();
TextEditingController razonSocial = new TextEditingController();
TextEditingController apellidoPaternoC = new TextEditingController();
TextEditingController apellidoMaternoC = new TextEditingController();
TextEditingController rfc = new TextEditingController();
TextEditingController calleC = new TextEditingController();
TextEditingController numeroC = new TextEditingController();
TextEditingController numeroInteriorC = new TextEditingController();
TextEditingController codigoPostal = new TextEditingController();
TextEditingController colonia = new TextEditingController();
TextEditingController delegacion = new TextEditingController();
TextEditingController estado = new TextEditingController();
TextEditingController email = new TextEditingController();
TextEditingController telefono = new TextEditingController();


String vehiculoMarca="";
String vehiculoModelo="";
String vehiculoPlacas="";
String vehiculoConcepto="";
String vehiculoImporte="";
String tarjeta="";

/*    String nombreRazon="";
   String apellidoPaterno="";
   String apellidoMaterno="";
   String calle="";
   String numero="";
   String interior="";
    String rfcField="";
   String codigoPostalField="";
   String coloniaField = "";
   String delegacionField = "";
   String estadoField = "";
   String emailField = "";
   String telefonoField = ""; */
/*    String idPago;
   String estatusCfdi;
   String rfcF;

   String numeroCliente;
   String calle;
   String numero;
   String interior;
   String coloniaF;
   String codigoPostalF;
   String delegacionMunicipio;
   String ciudad;
   String estadoF;
   String pais;
   String telefonoF;
   String correoElectronico; */

bool pruebaMoral = false;

String campoReq = "Campo requerido";

String tarjetaGuardada="";
String idPago="";
String radioValue="pruebaFisica";

bool acuerdo=false;

bool focus=false;
bool localFocus=false;
bool validacionFinal=false;
final ScrollController _homeController = ScrollController();
   int _currentTab=0;

String errorNombre="";
String errorPrimerApellido="";
String errorSegundoApellido="";
String errorTextRfc="";
String errorDomicilioFiscal="";
String errorNumeroExterior="";
String errorCodigoPostal="";
String errorColonia="";
String errorMunicipio="";
String errorEstado="";
String errorCorreo="";
String errorTelefono="";
void initState() { 
  super.initState();

 if(widget.vehiculo==null){

  if(widget.pago!=null){
 vehiculoMarca=widget.pago.vehiculo.marcaVehiculo;
 vehiculoModelo=widget.pago.vehiculo.modelo;
 vehiculoPlacas=widget.pago.vehiculo.placas;
 vehiculoConcepto=widget.pago.vehiculo.vin;
}  

} else{
  vehiculoMarca=widget.vehiculo.marcaVehiculo;
  vehiculoModelo=widget.vehiculo.modelo;
  vehiculoPlacas=widget.vehiculo.placas;
  vehiculoConcepto=widget.vehiculo.vin;
  
} 
validateX=null;



 if(widget.datosFiscales!=null){
   nombre.text=widget.datosFiscales.datosFiscales.nombreRazon;
   apellidoPaternoC.text=widget.datosFiscales.datosFiscales.apellidoPaterno;
   apellidoMaternoC.text=widget.datosFiscales.datosFiscales.apellidoMaterno;
   calleC.text=widget.datosFiscales.datosFiscales.domicilio.calle;
   numeroC.text=widget.datosFiscales.datosFiscales.domicilio.numero;
   numeroInteriorC.text=widget.datosFiscales.datosFiscales.domicilio.interior;
   codigoPostal.text=widget.datosFiscales.datosFiscales.domicilio.codigoPostal;
   rfc.text=widget.datosFiscales.datosFiscales.rfc;
   colonia.text = widget.datosFiscales.datosFiscales.domicilio.colonia;
   delegacion.text= widget.datosFiscales.datosFiscales.domicilio.delegacionMunicipio;
   estado.text = widget.datosFiscales.datosFiscales.domicilio.estado;
   email.text = widget.datosFiscales.datosFiscales.domicilio.correoElectronico;
   telefono.text = widget.datosFiscales.datosFiscales.domicilio.telefono;
   pruebaMoral=widget.datosFiscales.datosFiscales.isMoral;
   if(pruebaMoral==true){
     radioValue="pruebaMoral";
   } 
} 

/* if(nombre.text=="" || nombre.text.isEmpty){
  errorNombre="Campo requerido";
}
if(nombre.text=="" || nombre.text.isEmpty){
  errorNombre="Campo requerido";
}
if(apellidoPaternoC.text=="" || apellidoPaternoC.text.isEmpty){
  errorPrimerApellido="Campo requerido";
}
if(apellidoMaternoC.text=="" || apellidoMaternoC.text.isEmpty){
  errorSegundoApellido="Campo requerido";
}
if(rfc.text=="" || rfc.text.isEmpty){
  errorTextRfc="Campo requerido";
}

if(calleC.text=="" || calleC.text.isEmpty){
  errorDomicilioFiscal="Campo requerido";
}
if(numeroC.text=="" || numeroC.text.isEmpty){
  errorNumeroExterior="Campo requerido";
}
if(codigoPostal.text=="" || codigoPostal.text.isEmpty){
  errorCodigoPostal="Campo requerido";
}
if(colonia.text=="" || colonia.text.isEmpty){
  errorColonia="Campo requerido";
}
if(delegacion.text=="" || delegacion.text.isEmpty){
  errorMunicipio="Campo requerido";
}
if(estado.text=="" || estado.text.isEmpty){
  errorEstado="Campo requerido";
}
if(email.text=="" || email.text.isEmpty){
  errorCorreo="Campo requerido";
}
if(telefono.text=="" || telefono.text.isEmpty){
  errorTelefono="Campo requerido";
}  */
 
if(widget.tarjetaGuardada==null && widget.pago!=null){
  tarjetaGuardada=widget.pago.numTarjeta;
} 
if(widget.tarjetaGuardada!=null){
  tarjetaGuardada=widget.tarjetaGuardada;
}

if(widget.idPago==null && widget.pago!=null){
  idPago=widget.pago.numTarjeta;
} 
if(widget.idPago!=null){
  idPago=widget.idPago;
}

}





void _selectedTab(int index) {

   if (_currentTab == index) {
     _homeController.animateTo(
         0.0,
         curve: Curves.easeOut,
         duration: const Duration(milliseconds: 200),
       );
   } else {
     setState(() {
       _currentTab = index;
     });
   }
      if (_currentTab == index) {
       _homeController.animateTo(
         0.0,
         curve: Curves.easeOut,
         duration: const Duration(milliseconds: 200),
       );
     setState(() {
       _currentTab = index;
           focus=true;
     });
   }
 }
 var focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Comprobante fiscal"),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: (){
            cfdiPageNavigator(context);
          },
        ),
      ),
      body:  
      
    Form(
    key: _formKey,

 
          child: ListView(
            controller: _homeController,
              children: [
             
                     Container(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 2),
                  child: Column(
                    children: [
             Text("Con el objetivo de expedir correctamente el comprobante fiscal, es necesario validar nombre, dirección y RFC, en caso de no coincidir, puedes editarlos.", style: TextStyle(color: Color.fromRGBO(51, 68, 95, 1)),),
                    ],
                  ),
                ),
           

                 bottomLine(),
                CuadrosDatosAutos(
                title: "DATOS FISCALES",
                editable1: false,
                ),

Container(
    margin: EdgeInsets.fromLTRB(16, 32, 16, 8),
  child: Text("¿Qué tipo de persona eres?"),
),
     Container(
   margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
    decoration: BoxDecoration(  borderRadius: BorderRadius.circular(6),
    border: Border.all(color: pruebaMoral==true ? Color.fromRGBO(206, 216, 231, 1) : Color.fromRGBO(255, 176, 34, 1))
  ),
  child:   ListTile(
     leading:  Radio(
       groupValue: radioValue,
     
  
      value: "pruebaFisica",
      onChanged: (value){
          setState(() {
            
          });
      pruebaMoral=false;
  
      radioValue=value;
      nombre.text="";
          apellidoPaternoC.text="";
          apellidoMaternoC.text="";
          rfc.text="";
  
    
    } 
    ),
    title: Text("Persona Fisica"),
  ),
),

Container(
    margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
    
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
    border: Border.all(color: pruebaMoral==false ? Color.fromRGBO(206, 216, 231, 1) : Color.fromRGBO(255, 176, 34, 1))
  ),
  child:   ListTile(
     leading:  Radio(
       groupValue: radioValue,
     
      
      value: "pruebaMoral", 
      onChanged: (value){
          setState(() {
            
          });
      pruebaMoral=true;
  
    radioValue=value;
      nombre.text="";
          apellidoPaternoC.text="";
          apellidoMaternoC.text="";
          rfc.text="";
  
    
    } 
    ),
    title: Text("Persona Moral"),
  ),
),

   Column(
    children: [
 
  pruebaMoral==false ? Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
      controller: nombre,
      validator:  validacionCampos(nombre.text, errorNombre, "", "Campo requerido"),
      keyboardType: TextInputType.name,
     decoration: new InputDecoration(
      labelText: "Nombre(s)",
      errorText: errorNombre!="" ? errorNombre : "",
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      autofocus: false,
     onChanged:( String valor) async { setState(() {});
       errorNombre=  validateFieldsCfdi(valor, "", "Campo requerido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorNombre="Campo requerido";
     } else{
    if(valor!="" && errorNombre!=null){
     setState(() {});
   errorNombre=errorNombre;
     }
     if(valor!="" && errorNombre==null){
       setState(() { }); errorNombre=null;
     }
setState(() {});
     }
errorNombre=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  },
                        ),
                      ) : Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
      controller: nombre,
      validator:  validacionCampos(nombre.text, errorNombre, "", "Campo requerido"),
      keyboardType: TextInputType.name,
     decoration: new InputDecoration(
      labelText: "Razón social",
      errorText: errorNombre!="" ? errorNombre : "",
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      autofocus: false,
           onChanged:( String valor) async { setState(() {});
       errorNombre=  validateFieldsCfdi(valor, "", "Campo requerido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorNombre="Campo requerido";
     } else{
    if(valor!="" && errorNombre!=null){
     setState(() {});
   errorNombre=errorNombre;
     }
     if(valor!="" && errorNombre==null){
       setState(() { }); errorNombre=null;
     }
setState(() {});
     }
errorNombre=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  },
                        ),
                      ),
               
       pruebaMoral==false ?         Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
     inputFormatters: [ UpperCaseTextFormatter()],
      controller: apellidoPaternoC,
      validator:  validacionCampos(apellidoPaternoC.text, errorPrimerApellido, "", "Campo requerido"),
      keyboardType: TextInputType.name,
     decoration: new InputDecoration(
      labelText: "Primer Apellido",
      errorText: errorPrimerApellido!="" ? errorPrimerApellido : "",
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      autofocus: false,
           onChanged:( String valor) async { setState(() {});
       errorPrimerApellido=  validateFieldsCfdi(valor, "", "Campo requerido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorPrimerApellido="Campo requerido";
     } else{
    if(valor!="" && errorPrimerApellido!=null){
     setState(() {});
   errorPrimerApellido=errorPrimerApellido;
     }
     if(valor!="" && errorPrimerApellido==null){
       setState(() { }); errorNombre=null;
     }
setState(() {});
     }
errorPrimerApellido=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  },
                        ),
                      )
             : Container(),
             pruebaMoral==false ?         Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
     inputFormatters: [ UpperCaseTextFormatter()],
      controller: apellidoMaternoC,
      validator:  validacionCampos(apellidoMaternoC.text, errorSegundoApellido, "", "Campo requerido"), 
      keyboardType: TextInputType.name,
     decoration: new InputDecoration(
      labelText: "Segundo Apellido",
      errorText: errorSegundoApellido!="" ? errorSegundoApellido : "",
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      autofocus: false,
               onChanged:( String valor) async { setState(() {});
       errorSegundoApellido=  validateFieldsCfdi(valor, "", "Campo requerido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorSegundoApellido="Campo requerido";
     } else{
    if(valor!="" && errorSegundoApellido!=null){
     setState(() {});
   errorSegundoApellido=errorSegundoApellido;
     }
     if(valor!="" && errorSegundoApellido==null){
       setState(() { }); errorSegundoApellido=null;
     }
setState(() {});
     }
errorSegundoApellido=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  },
      
                        ),
                      )
             : Container(), 
     Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
     inputFormatters: [ UpperCaseTextFormatter()],
     decoration: new InputDecoration(
      labelText: "RFC",
      errorText: errorTextRfc!="" ? errorTextRfc : "",  
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      focusNode: focusNode,
      autofocus: focus,
      maxLength: pruebaMoral==false ? 13 : 12,
      controller: rfc,
      keyboardType: TextInputType.name,
      validator:  validacionCampos(rfc.text, errorTextRfc, "^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])([A-Z]|[0-9]){2}([A]|[0-9]){1})?\u0024", "RFC Inválido"),
       onChanged:( String valor) async { setState(() {});
       errorTextRfc=  validateFieldsCfdi(valor, "^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])([A-Z]|[0-9]){2}([A]|[0-9]){1})?\u0024", "RFC Inválido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorTextRfc="Campo requerido";
     } else{
    if(valor!="" && errorTextRfc!=null){
     setState(() {});
   errorTextRfc=errorTextRfc;
     }
     if(valor!="" && errorTextRfc==null){
       setState(() { }); errorTextRfc=null;
     }
setState(() {});
     }
errorTextRfc=  validateFieldsCfdi(valor, "^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])([A-Z]|[0-9]){2}([A]|[0-9]){1})?\u0024", "RFC Inválido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  },
                        ),
                      ),

       Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
     decoration: new InputDecoration(
      labelText: "Domicilio fiscal (calle)",
      errorText: errorDomicilioFiscal!="" ? errorDomicilioFiscal : "",  
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      controller: calleC,
      keyboardType: TextInputType.name,
      validator:  validacionCampos(calleC.text, errorDomicilioFiscal, "", "Campo requerido"),
          onChanged:( String valor) async { setState(() {});
       errorDomicilioFiscal=  validateFieldsCfdi(valor, "", "Campo requerido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorDomicilioFiscal="Campo requerido";
     } else{
    if(valor!="" && errorDomicilioFiscal!=null){
     setState(() {});
   errorDomicilioFiscal=errorDomicilioFiscal;
     }
     if(valor!="" && errorDomicilioFiscal==null){
       setState(() { }); errorDomicilioFiscal=null;
     }
setState(() {});
     }
errorDomicilioFiscal=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  },
                        ),
                      ),
         Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
     decoration: new InputDecoration(
      labelText: "Número exterior",
      errorText: errorNumeroExterior!="" ? errorNumeroExterior : "",  
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      controller: numeroC,
      keyboardType: TextInputType.number,
      validator:  validacionCampos(numeroC.text, errorNumeroExterior, "", "Campo requerido"),
        onChanged:( String valor) async { setState(() {});
       errorNumeroExterior=  validateFieldsCfdi(valor, "", "Campo requerido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorNumeroExterior="Campo requerido";
     } else{
    if(valor!="" && errorNumeroExterior!=null){
     setState(() {});
   errorNumeroExterior=errorNumeroExterior;
     }
     if(valor!="" && errorNumeroExterior==null){
       setState(() { }); errorNumeroExterior=null;
     }
setState(() {});
     }
errorNumeroExterior=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  }, 
                        ),
                      ),
      Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
     decoration: new InputDecoration(
      labelText: "Número interior",
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      controller: numeroInteriorC,
      keyboardType: TextInputType.number,
                        ),
                      ),
             
       Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
       maxLength: 5,
     decoration: new InputDecoration(
      labelText: "Código postal",
      errorText: errorCodigoPostal!="" ? errorCodigoPostal : "",  
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      controller: codigoPostal,
      keyboardType: TextInputType.number,
      validator:  validacionCampos(codigoPostal.text, errorCodigoPostal, "^[0-9]{5}", "Código postal inválido"),
         onChanged:( String valor) async { setState(() {});
       errorCodigoPostal=  validateFieldsCfdi(valor, "", "Campo requerido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorCodigoPostal="Campo requerido";
     } else{
    if(valor!="" && errorCodigoPostal!=null){
     setState(() {});
   errorCodigoPostal=errorCodigoPostal;
     }
     if(valor!="" && errorCodigoPostal==null){
       setState(() { }); errorCodigoPostal=null;
     }
setState(() {});
     }
errorCodigoPostal=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  }, 
                        ),
                      ), 
           Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
     decoration: new InputDecoration(
      labelText: "Colonia",
      errorText: errorColonia!="" ? errorColonia : "",  
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      controller: colonia,
      keyboardType: TextInputType.name,
      validator:  validacionCampos(colonia.text, errorColonia, "", "Campo requerido"),
         onChanged:( String valor) async { setState(() {});
       errorColonia=  validateFieldsCfdi(valor, "", "Campo requerido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorColonia="Campo requerido";
     } else{
    if(valor!="" && errorColonia!=null){
     setState(() {});
   errorColonia=errorColonia;
     }
     if(valor!="" && errorColonia==null){
       setState(() { }); errorColonia=null;
     }
setState(() {});
     }
errorColonia=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  }, 
                        ),
                      ), 
         Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
     decoration: new InputDecoration(
      labelText: "Alcaldía/Municipio",
      errorText: errorMunicipio!="" ? errorMunicipio : "",  
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      controller: delegacion,
      keyboardType: TextInputType.name,
      validator:  validacionCampos(delegacion.text, errorMunicipio, "", "Campo requerido"),
         onChanged:( String valor) async { setState(() {});
       errorMunicipio=  validateFieldsCfdi(valor, "", "Campo requerido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorMunicipio="Campo requerido";
     } else{
    if(valor!="" && errorMunicipio!=null){
     setState(() {});
   errorMunicipio=errorMunicipio;
     }
     if(valor!="" && errorMunicipio==null){
       setState(() { }); errorMunicipio=null;
     }
setState(() {});
     }
errorMunicipio=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  }, 
                        ),
                      ), 

       Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
     decoration: new InputDecoration(
      labelText: "Estado",
      errorText: errorEstado!="" ? errorEstado : "",  
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      controller: estado,
      keyboardType: TextInputType.name,
      validator:  validacionCampos(estado.text, errorEstado, "", "Campo requerido"),
         onChanged:( String valor) async { setState(() {});
       errorMunicipio=  validateFieldsCfdi(valor, "", "Campo requerido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorEstado="Campo requerido";
     } else{
    if(valor!="" && errorEstado!=null){
     setState(() {});
   errorEstado=errorEstado;
     }
     if(valor!="" && errorEstado==null){
       setState(() { }); errorEstado=null;
     }
setState(() {});
     }
errorEstado=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  }, 
                        ),
                      ),

            Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
     decoration: new InputDecoration(
      labelText: "Correo electrónico",
      errorText: errorCorreo!="" ? errorCorreo : "",  
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      controller: email,
      keyboardType: TextInputType.name,
      validator:  validacionCampos(email.text, errorCorreo, "^[a-zA-Z0-9.!#'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*", "Correo electrónico inválido"),
         onChanged:( String valor) async { setState(() {});
       errorCorreo=  validateFieldsCfdi(valor, "^[a-zA-Z0-9.!#'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*", "Correo electrónico inválido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorCorreo="Campo requerido";
     } else{
    if(valor!="" && errorCorreo!=null){
     setState(() {});
   errorCorreo=errorCorreo;
     }
     if(valor!="" && errorCorreo==null){
       setState(() { }); errorCorreo=null;
     }
setState(() {});
     }
errorCorreo=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  }, 
                        ),
                      ),

          Padding(
     padding: const EdgeInsets.all(16.0),
     child: TextFormField(
       maxLength: 10,
     decoration: new InputDecoration(
      labelText:  "Teléfono",
      errorText: errorTelefono!="" ? errorTelefono : "",  
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15, bottom: 6, top: 6, right: 15),
        ),
      controller: telefono,
      keyboardType: TextInputType.number,
      validator:  validacionCampos(email.text, errorCorreo, "^([0-9]){10}", "Teléfono inválido"),
         onChanged:( String valor) async { setState(() {});
       errorTelefono=  validateFieldsCfdi(valor, "^([0-9]){10}", "Teléfono inválido"); 
      setState(() {});
     if(valor.isEmpty || valor==""){
    setState(() {});
       errorTelefono="Campo requerido";
     } else{
    if(valor!="" && errorTelefono!=null){
     setState(() {});
   errorTelefono=errorTelefono;
     }
     if(valor!="" && errorTelefono==null){
       setState(() { }); errorTelefono=null;
     }
setState(() {});
     }
errorTelefono=  validateFieldsCfdi(valor, "", "Campo requerido");
validacionFinal=   validacion(!_formKey.currentState.validate());
  }, 
                        ),
                      ),
           SizedBox(
                  height: 25,
                ),
   bottomLine(),

   CuadrosDatosAutos(
  
                title: "DATOS DEL TRAMITE", 
                titulo1: "Número de Póliza",
                contenido1: widget.pagoPoliza==null ? "" : widget.pagoPoliza.poliza,
                editable1: false,
                ),
              CuadrosDatosAutos(
                title: "",
                titulo1: "Número de Siniestro",
                contenido1: widget.pagoPoliza==null ? "" :  widget.pagoPoliza.codSiniestro,
                editable1: false,
                ),  


                   CuadrosDatosAutos(
                title: "",
                titulo1: "Vehículo (Marca/Tipo)",
                contenido1: widget.pagoPoliza==null ? "" :  vehiculoMarca,
                editable1: false,
                ),  
                  CuadrosDatosAutos(
                title: "",
                titulo1: "Modelo",
                contenido1: widget.pagoPoliza==null ? "" :  vehiculoModelo,
                editable1: false,
                ),  
                  CuadrosDatosAutos(
                title: "",
                titulo1: "Placas",
                contenido1: vehiculoPlacas,
                editable1: false,
                ),  
                          CuadrosDatosAutos(
                title: "",
                titulo1: "Concepto",
                contenido1: "Deducible",
                editable1: false,
                ),  
                          CuadrosDatosAutos(
                title: "",
                titulo1: "Importe",
                contenido1: widget.pagoPoliza==null ? "" :  currencyMXN.format(widget.pagoPoliza.monto),
                editable1: false,
                ),  
                          CuadrosDatosAutos(
                title: "",
                titulo1: "Método de Pago",
                contenido1: "Tarjeta",
                editable1: false,
                ),  
                          CuadrosDatosAutos(
               
                title: "",
                titulo1: "Tarjeta",
                contenido1: tarjetaGuardada,
                editable1: false,
                ), 

                  Container(
    margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
    decoration: BoxDecoration(
    border: Border.all(color:  Colors.blueAccent )
  ),
  child:   ListTile(
     leading:  Checkbox(
    
     
      
      value: acuerdo, 
      onChanged: (bool value){
          setState(() {
            
          });
     
   acuerdo=!acuerdo;


   if(validacionFinal==false){
         validacionFinal=   validacion(!_formKey.currentState.validate());
   }  
    
    } 
    ),
    title: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text("Confirmo que la información es correcta y estoy de acuerdo con que, en caso de existir algún error u omisión en la información, no será posible realizar cambios posteriores."),
    ),
  ),
),

                    BotonNaranjaCfdi(
                  title: "Generar CFDI",
                  onPressed: validacionFinal==true && acuerdo==true  ?  ()  {
                    setState(() {
                      
                    });
 cfdiRequest();                  
                  } : null,
                  ),
    ],
  ),                 
              ],
   
          ),
        ),
    
    );
  }


  validacion(validacion){
   // validacion(!_formKey.currentState.validate());
  setState(() {
    
  });
 if (!_formKey.currentState.validate()) {

      setState(() {
        
      });
   print("validado");
 
 /*   showAlertCustomCFDI(title: "Por favor ingrese los campos correctamente", context: context, textButtonOK: "Aceptar", message: "No se puede realizar la solicitud si hay datos faltantes o incorrectos, favor verifique los campos"); */
    return false;
  } else{
  setState(() {
    
  });
   return true;
  }   
  }

cfdiRequest() async {

var numCliente = Session().user.cveClienteUnico ?? "";
var rfcValidator = await validarRFC(rfc.text);

if(!_formKey.currentState.validate()){
  acuerdo=false;

   showAlertCustomCFDI(title: "Por favor ingrese los campos correctamente", context: context, textButtonOK: "Aceptar", message: "No se puede realizar la solicitud si hay datos faltantes o incorrectos, favor verifique los campos");
} else{
  if(rfcValidator==true){
 

 

 
                  var cfdi = await solicitarCFDI(
                   idPago,
                    "", //ESTATUS CFDI
                    rfc.text,
                    nombre.text, 
                    apellidoPaternoC.text, 
                    apellidoMaternoC.text, 
                      numCliente,   //NUMERO DE CLIENTE 
                   /*   "0008066530",   */
                    calleC.text, 
                    numeroC.text, //NUMERO
                    numeroInteriorC.text, //INTERIOR
                    colonia.text,  
                    codigoPostal.text,  
                    delegacion.text, 
                    delegacion.text, //CIUDAD
                    estado.text, 
                    "", //Pais  
                    telefono.text, 
                    email.text,
                    context
                    );
                  print(cfdi.idSolicitud);
                  showAlertaIngreso(); 
}
}


}




validacionCampos(String value, String errorText, String regex, String mensajeError){
setState(() {
  
});
  return (String value){
      setState(() {
  
});


  errorText=  validateFieldsCfdi(value, regex, mensajeError); 
if(value.isNotEmpty && errorText==null){
  setState(() {
    
  });
    return null;
}


if(errorText==mensajeError){
  return mensajeError;
}

if(errorText=="Campo requerido"){
  return "Campo requerido";
}

  errorText=  validateFieldsCfdi(value, regex, mensajeError); 
  };


}


  validarRFC(String rfcValue) async {


   final rfcValidate = await verificarRFC(context, rfcValue);
   if (rfcValidate.the0.exists==true){
   print("existe");
  
    return true;

   } 
   else{
     
      showAlertRfc(
        onPressedDefault: (){
          setState(() {
            
          });
            
         cfdiPageNavigator(context);
        },
        title: "RFC inválido",  textButtonOK: "Cancelar",  context: context, 
       
      bodyWidget: Column(children: [
      Container(
        padding: EdgeInsets.all(12),
        child: Text("No es posible generar factura con el RFC ingresado.\n¿Deseas editar el RFC?")),
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: BotonNaranjaCfdi(
           
          title: "Editar",  onPressed: (){
            setState(() {
              
            });
     
             Navigator.pop(context);
               acuerdo=false;
               localFocus=false;
                rfc.text="";
                errorTextRfc="Campo requerido"; 
           FocusScope.of(context).requestFocus(focusNode);
        
        }
         
        ),
      ),
  
      ],
      ));
   }



  }


  void showAlertaIngreso() {
    showCustomDialog(
        context: context,
        builder: (context) => DialogCustomGNP(
            actions: null,
            title: "Solicitud de CFDI",
            description: "En un lapso máximo de 24 h te notificaremos vía correo electrónico cuando el CFDI esté listo y disponible para su descarga.",
            textButtonOk: "Continuar",
            onPressed: (){
             cfdiPageNavigator(context);
            },
            
            ));
  }
}







  Widget importeRow(BuildContext context) {
    return Container(
        height: 40,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(children: [
          Expanded(
              child: Text(
                //this.importe ?? "",
                "\u0024 123,332.43" ?? "",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 34,
                      letterSpacing: 0.25,
                      color: AppColors.primary700)))
        ]));
  }


      Widget bottomLine() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
        height: 2,
        color: AppColors.gnpBackLight2);
  }



