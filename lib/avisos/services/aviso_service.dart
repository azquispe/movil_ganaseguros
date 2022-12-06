import 'dart:convert';

import 'package:movil_ganaseguros/avisos/models/aviso_model.dart';
import 'package:http/http.dart' as http;
import 'package:movil_ganaseguros/utils/api.dart' as api;
import 'dart:io';

class AvisoService {
  Future<List<AvisoModel>> obtenerAvisos() async {



    const url = "${api.API_MOVIL_GANASEGURO}/app-web/v1/obtener-avisos";

    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }).timeout(Duration(seconds: api.TIMEOUT_SECOND));
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeData =
          json.decode(response.body) as Map<String, dynamic>;

      if (decodeData['codigoMensaje'].toString() == 'CODMW1000') {
        final vDecodeData = json.decode(response.body)["avisos"] as List;

        List<AvisoModel> lstAvisos =
            vDecodeData.map((obj) => AvisoModel.fromMap(obj)).toList();
        return lstAvisos;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}
