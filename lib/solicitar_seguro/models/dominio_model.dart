// To parse this JSON data, do
//
//     final dominioModel = dominioModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class DominioModel {
  DominioModel({
    required this.dominioId,
    required this.dominio,
    required this.descripcion,
    required this.abreviatura,
  });

  int  dominioId;
  String  dominio;
  String  descripcion;
  String  abreviatura;

  factory DominioModel.fromJson(String str) => DominioModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DominioModel.fromMap(Map<String, dynamic> json) => DominioModel(
    dominioId: json["dominioId"] == null ? null : json["dominioId"],
    dominio: json["dominio"] == null ? null : json["dominio"],
    descripcion: json["descripcion"] == null ? null : json["descripcion"],
    abreviatura: json["abreviatura"] == null ? null : json["abreviatura"],
  );

  Map<String, dynamic> toMap() => {
    "dominioId": dominioId == null ? null : dominioId,
    "dominio": dominio == null ? null : dominio,
    "descripcion": descripcion == null ? null : descripcion,
    "abreviatura": abreviatura == null ? null : abreviatura,
  };
}
