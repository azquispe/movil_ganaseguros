// To parse this JSON data, do
//
//     final solicitudSeguroModel = solicitudSeguroModelFromMap(jsonString);


import 'dart:convert';

class SolicitudSeguroModel {
  SolicitudSeguroModel({
    required this.nombres,
    required this.apellidos,
    required this.telefonoCelular,
    required this.correo,
    required this.ciudad,
    required this.tieneSeguroConNosotros,
    required this.tieneSeguroConOtros,
    required this.tipoProductoId,
    required this.descripcion
  });

  String nombres;
  String apellidos;
  String telefonoCelular;
  String correo;
  String ciudad;
  bool tieneSeguroConNosotros;
  bool tieneSeguroConOtros;
  int tipoProductoId;
  String descripcion;



  factory SolicitudSeguroModel.fromJson(String str) => SolicitudSeguroModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SolicitudSeguroModel.fromMap(Map<String, dynamic> json) => SolicitudSeguroModel(
    nombres: json["nombres"] == null ? null : json["nombres"],
    apellidos: json["apellidos"] == null ? null : json["apellidos"],
    telefonoCelular: json["telefonoCelular"] == null ? null : json["telefonoCelular"],
    correo: json["correo"] == null ? null : json["correo"],
    ciudad: json["ciudad"] == null ? null : json["ciudad"],
    tieneSeguroConNosotros: json["tieneSeguroConNosotros"] == null ? null : json["tieneSeguroConNosotros"],
    tieneSeguroConOtros: json["tieneSeguroConOtros"] == null ? null : json["tieneSeguroConOtros"],
    tipoProductoId: json["tipoProductoId"] == null ? null : json["tipoProductoId"],
    descripcion: json["descripcion"] == null ? null : json["descripcion"],
  );

  Map<String, dynamic> toMap() => {
    "nombres": nombres == null ? null : nombres,
    "apellidos": apellidos == null ? null : apellidos,
    "telefonoCelular": telefonoCelular == null ? null : telefonoCelular,
    "correo": correo == null ? null : correo,
    "ciudad": ciudad == null ? null : ciudad,
    "tieneSeguroConNosotros": tieneSeguroConNosotros == null ? null : tieneSeguroConNosotros,
    "tieneSeguroConOtros": tieneSeguroConOtros == null ? null : tieneSeguroConOtros,
    "tipoProductoId": tipoProductoId == null ? null : tipoProductoId,
    "descripcion": descripcion == null ? null : descripcion,
  };
}

