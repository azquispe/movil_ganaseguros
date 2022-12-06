import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movil_ganaseguros/solicitar_seguro/models/dominio_model.dart';
import 'package:movil_ganaseguros/solicitar_seguro/services/dominio_service.dart';
import 'package:movil_ganaseguros/solicitar_seguro/services/solicita_seguro_service.dart';

import '../models/solicitud_seguro_model.dart';
import '../../polizas/services/consulta_poliza_service.dart';

class SolicitaSeguroProvider with ChangeNotifier{
  TextEditingController  _txtNombreController = TextEditingController();
  TextEditingController _txtApellidoController = TextEditingController();
  TextEditingController _txtTelCelController = TextEditingController();
  TextEditingController _txtCorreoController = TextEditingController();
  String _ciudad = "LA PAZ";
  bool _boolTieneSeguroConNosotros = false;
  bool _boolTieneSeguroConOtros = false;
  String _tipoProductoId = "1004";
  TextEditingController _txtDescripcionController = TextEditingController();


  TextEditingController get txtNombreController => _txtNombreController;

  set txtNombreController(TextEditingController value) {
    _txtNombreController = value;
  }
  TextEditingController get txtApellidoController => _txtApellidoController;

  set txtApellidoController(TextEditingController value) {
    _txtApellidoController = value;
  }

  TextEditingController get txtTelCelController => _txtTelCelController;

  set txtTelCelController(TextEditingController value) {
    _txtTelCelController = value;
  }

  TextEditingController get txtCorreoController => _txtCorreoController;

  set txtCorreoController(TextEditingController value) {
    _txtCorreoController = value;
  }


  String get tipoProductoId => _tipoProductoId;

  set tipoProductoId(String value) {
    _tipoProductoId = value;
  }

  String get ciudad => _ciudad;

  set ciudad(String value) {
    _ciudad = value;
    notifyListeners();
  }

  bool get boolTieneSeguroConNosotros => _boolTieneSeguroConNosotros;

  set boolTieneSeguroConNosotros(bool value) {
    _boolTieneSeguroConNosotros = value;
    notifyListeners();
  }

  bool get boolTieneSeguroConOtros => _boolTieneSeguroConOtros;

  set boolTieneSeguroConOtros(bool value) {
    _boolTieneSeguroConOtros = value;
    notifyListeners();
  }



  TextEditingController get txtDescripcionController =>
      _txtDescripcionController;

  set txtDescripcionController(TextEditingController value) {
    _txtDescripcionController = value;
  }



  List<String> _ciudadItems = [
    "LA PAZ",
    "COCHABAMBA",
    "POTOSI",
    "CHUQUISACA",
    "TARIJA",
    "BENI",
    "PANDO",
    "SANTA CRUZ"
  ];
  List<String> get ciudades => _ciudadItems;

  List<DominioModel> _tipoProductos = [];


  List<DominioModel> get tipoProductos => _tipoProductos;

  set tipoProductos(List<DominioModel> value) {
    _tipoProductos = value;
    notifyListeners();
  }

  Future<bool> enviarSolicitudSeguro() async {
    SolicitudSeguroModel objSolicitudSeguroModel = new SolicitudSeguroModel(
        nombres: _txtNombreController.text,
        apellidos: _txtApellidoController.text,
        telefonoCelular: _txtTelCelController.text,
        correo: _txtCorreoController.text,
        ciudad: _ciudad,
        tieneSeguroConNosotros: _boolTieneSeguroConNosotros,
        tieneSeguroConOtros:_boolTieneSeguroConOtros,
        tipoProductoId:int.parse(tipoProductoId),
        descripcion: _txtDescripcionController.text
    );
    SolicitaSeguroService _solicitaSeguroService = new SolicitaSeguroService();
    return await _solicitaSeguroService.enviarSolicitudSeguro(objSolicitudSeguroModel);
  }

  Future<void> obtenerTipoProductos() async {
    this.tipoProductos = [];
    DominioService _dominioService = new DominioService();
     List<DominioModel> lstDominio =  await _dominioService.obtenerDominioPorDominio("TipoProductoID");
     /*DominioModel obj = new DominioModel(dominioId: 0, dominio: "", descripcion: "", abreviatura: "");
     lstDominio.add(obj);*/
    this.tipoProductos = lstDominio;
  }
}