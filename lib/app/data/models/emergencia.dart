// To parse this JSON data, do
//
//     final emergencia = emergenciaFromJson(jsonString);

import 'dart:convert';

import 'package:hmv_care_app/app/data/models/base_model.dart';
import 'package:hmv_care_app/app/data/models/paciente.dart';

Emergencia emergenciaFromJson(String str) =>
    Emergencia.fromJson(json.decode(str));

String emergenciaToJson(Emergencia data) => json.encode(data.toJson());

class Emergencia implements IBaseModel {
  @override
  String id;

  Emergencia(
      {required this.id,
      this.data,
      this.localizacao,
      this.paciente,
      this.status,
      this.severidade,
      this.questionario});

  String? data;
  String? localizacao;
  String? status;
  String? severidade;
  Paciente? paciente;
  Map<String, String>? questionario;

  factory Emergencia.fromJson(Map<String, dynamic> json) => Emergencia(
        id: json["id"],
        data: json["data"],
        localizacao: json["localizacao"],
        questionario: Map.from(json["questionario"]),
        status: json["status"],
        severidade: json["severidade"],
        paciente: Paciente.fromJson(json["paciente"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "questionario": questionario,
        "data": data ?? '',
        "localizacao": localizacao ?? '',
        "id": id,
        "status": status ?? '',
        "severidade": severidade ?? '',
        "paciente": paciente?.toJson()
      };

  @override
  Map<String, dynamic> toUpdateJson() => {
        "paciente": {"Value": paciente?.toJson()},
        "data": {"Value": data},
        "localizacao": {"Value": localizacao},
        "severidade": {"Value": severidade},
        "status": {"Value": status},
        "questionario": {"Value": questionario},
      };
}
