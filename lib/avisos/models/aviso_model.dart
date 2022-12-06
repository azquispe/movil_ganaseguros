// To parse this JSON data, do
//
//     final avisoModel = avisoModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AvisoModel {
  AvisoModel({
    this.avisosMovilId,
    this.titulo,
    this.contenido,
    this.enlace,
    this.ruta,
    this.fechaAviso,
  });

  int ? avisosMovilId;
  String? titulo;
  String? contenido;
  String? enlace;
  String? ruta;
  String? fechaAviso;

  factory AvisoModel.fromJson(String str) => AvisoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AvisoModel.fromMap(Map<String, dynamic> json) => AvisoModel(
    avisosMovilId: json["avisosMovilId"] == null ? null : json["avisosMovilId"],
    titulo: json["titulo"] == null ? null : json["titulo"],
    contenido: json["contenido"] == null ? null : json["contenido"],
    enlace: json["enlace"] == null ? null : json["enlace"],
    ruta: json["ruta"] == null ? null : json["ruta"],
    fechaAviso: json["fechaAviso"] == null ? null : json["fechaAviso"]
  );

  Map<String, dynamic> toMap() => {
    "avisosMovilId": avisosMovilId == null ? null : avisosMovilId,
    "titulo": titulo == null ? null : titulo,
    "contenido": contenido == null ? null : contenido,
    "enlace": enlace == null ? null : enlace,
    "ruta": ruta == null ? null : ruta,
    "fechaAviso": fechaAviso == null ? null : fechaAviso,
  };
}
