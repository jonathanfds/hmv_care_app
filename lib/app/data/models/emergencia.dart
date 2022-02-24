// To parse this JSON data, do
//
//     final emergencia = emergenciaFromJson(jsonString);

import 'dart:convert';

import 'package:hmv_care_app/app/data/models/base_model.dart';

Emergencia emergenciaFromJson(String str) =>
    Emergencia.fromJson(json.decode(str));

String emergenciaToJson(Emergencia data) => json.encode(data.toJson());

class Emergencia implements IBaseModel {
  @override
  String id;

  Emergencia({
    required this.id,
    this.pacienteId,
    this.data,
    this.localizacao,
  });
  String? pacienteId;
  String? data;
  String? localizacao;

  factory Emergencia.fromJson(Map<String, dynamic> json) => Emergencia(
        id: json["id"],
        pacienteId: json["pacienteId"],
        data: json["data"],
        localizacao: json["localizacao"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "pacienteId": pacienteId,
        "data": data,
        "localizacao": localizacao,
        "id": id,
      };

  @override
  Map<String, dynamic> toUpdateJson() => {
        "pacienteId": {"Value": pacienteId},
        "data": {"Value": data},
        "localizacao": {"Value": localizacao},
      };
}
