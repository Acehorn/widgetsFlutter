import 'package:flutter/material.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/utils/constantesAutosDeducible.dart';

class TextFieldCfdi extends StatefulWidget {
  final controller;
  final String regex;
  final String mensajeError;
  final String hintText;

  const TextFieldCfdi({Key key, this.controller, this.regex, this.mensajeError, this.hintText}) : super(key: key);
  @override
  _TextFieldCfdiState createState() => _TextFieldCfdiState();
}

class _TextFieldCfdiState extends State<TextFieldCfdi> {
   String errorText;
  @override
  Widget build(BuildContext context) {
    return         Container(
        height: 100,

        padding: EdgeInsets.all(16),
        child: TextField(
             
        //   keyboardType: TextInputType.numberWithOptions(decimal: true),
/*   inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'^\d+(?:\.\d+)?$')),
  ],  */ 
  onChanged: (String value){
   
    setState(() {
      
    });
   errorText=  validateFieldsCfdi(value, widget.regex, widget.mensajeError);
  },
          controller: widget.controller,
            decoration: new InputDecoration(
           errorText: errorText!="" ? errorText : "",
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        hintText: widget.hintText),
  
        ),

      );
  }
}

String validateFieldsCfdi(String value, String regex, String mensajeError) {
   // String pattern = r'^\d+(?:\.\d+)?$';
    RegExp regExp = new RegExp(regex);
    if (value.length == 0) {
          return mensajeError;
    }
    else if (!regExp.hasMatch(value)) {
      return mensajeError;
    }
    return null;
}   
