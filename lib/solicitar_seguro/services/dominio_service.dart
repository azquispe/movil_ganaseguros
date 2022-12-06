import 'dart:convert';

import 'package:movil_ganaseguros/solicitar_seguro/models/dominio_model.dart';
import 'package:http/http.dart' as http;
import 'package:movil_ganaseguros/utils/api.dart' as api;

class DominioService {
  Future<List<DominioModel>> obtenerDominioPorDominio(String pDominio) async {
    final  url = "${api.API_MOVIL_GANASEGURO}/app-web/findByDominio/$pDominio";
    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }).timeout(Duration(seconds: api.TIMEOUT_SECOND));
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeData = json.decode(response.body) as Map<String, dynamic>;
      if (decodeData['codigoMensaje'].toString() == 'CODMW1000') {
        final vDecodeData = json.decode(response.body)["dominios"] as List;
        List<DominioModel> lstDominio = vDecodeData.map((obj) => DominioModel.fromMap(obj)).toList();
        return lstDominio;
      } else {
        return [];
      }
    }
    return [];
  }
}