import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movil_ganaseguros/solicitar_seguro/models/solicitud_seguro_model.dart';
import 'package:movil_ganaseguros/utils/api.dart' as api;
class SolicitaSeguroService {
  Future<bool> enviarSolicitudSeguro(
      SolicitudSeguroModel solicitudSeguroModel) async {
    const url = "${api.API_MOVIL_GANASEGURO}/app-web/v1/solicitud-seguro";

    final response = await http
        .post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombres': solicitudSeguroModel.nombres != null? solicitudSeguroModel.nombres.toString(): "",
        'apellidos': solicitudSeguroModel.apellidos != null? solicitudSeguroModel.apellidos.toString(): "",
        'telefonoCelular': solicitudSeguroModel.telefonoCelular != null? solicitudSeguroModel.telefonoCelular.toString(): "",
        'correo': solicitudSeguroModel.correo != null? solicitudSeguroModel.correo.toString(): "",
        'ciudad': solicitudSeguroModel.ciudad != null? solicitudSeguroModel.ciudad.toString(): "",
        'tieneSeguroConNosotros': solicitudSeguroModel.tieneSeguroConNosotros != null? solicitudSeguroModel.tieneSeguroConNosotros.toString(): "",
        'tieneSeguroConOtros': solicitudSeguroModel.tieneSeguroConOtros != null? solicitudSeguroModel.tieneSeguroConOtros.toString(): "",
        'tipoProductoId': solicitudSeguroModel.tipoProductoId != null? solicitudSeguroModel.tipoProductoId.toString(): "",
        'descripcion':solicitudSeguroModel.descripcion != null? solicitudSeguroModel.descripcion.toString(): "",
        "tipoMedioSolicitudSeguroId":'1003'
      }),
    )
        .timeout(Duration(seconds: api.TIMEOUT_SECOND));
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeData = json.decode(response.body) as Map<String, dynamic>;

      if (decodeData['codigoMensaje'].toString() == 'CODMW1000') {
        return true;

      } else {
        return false;
      }
    }else{
      return false;
    }
  }
}