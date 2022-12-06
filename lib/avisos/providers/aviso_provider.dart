import 'package:flutter/foundation.dart';
import 'package:movil_ganaseguros/avisos/models/aviso_model.dart';
import 'package:movil_ganaseguros/avisos/services/aviso_service.dart';
import 'package:movil_ganaseguros/bd/db_provider.dart';
import 'package:movil_ganaseguros/polizas/models/datos_persona_model.dart';

class AvisoProvider with ChangeNotifier {
  List<AvisoModel> _lstAvisoModel = [];
  bool descargandoAviso = false;
  List<AvisoModel> get lstAvisoModel => _lstAvisoModel;

  set lstAvisoModel(List<AvisoModel> value) {
    _lstAvisoModel = value;
    notifyListeners();
  }

  AvisoService _avisoService = new AvisoService();

  Future<void> obtenerAvisos() async {
    this.lstAvisoModel= [];
    this.descargandoAviso = true;
    this.lstAvisoModel = await _avisoService.obtenerAvisos();
    this.descargandoAviso = false;
  }

}
