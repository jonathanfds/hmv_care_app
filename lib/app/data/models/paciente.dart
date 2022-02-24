// To parse this JSON data, do
//
//     final Paciente = PacienteFromJson(jsonString);

import 'dart:convert';

import 'package:hmv_care_app/app/data/models/base_model.dart';

Paciente PacienteFromJson(String str) => Paciente.fromJson(json.decode(str));

String PacienteToJson(Paciente data) => json.encode(data.toJson());

class Paciente implements IBaseModel {
  Paciente({
    required this.id,
    this.observacoes,
    this.telefone,
    this.fumante,
    this.convenio,
    this.possuiHistoricoCardiaco,
    this.email,
    this.quaisRemedios,
    this.usaRemedioControlado,
    this.plano,
    this.dataNascimento,
    this.cpf,
    this.nomeMae,
    this.endereco,
    this.sedentarismo,
    this.nomeCompleto,
  });
  @override
  String id;
  String? observacoes;
  String? telefone;
  bool? fumante;
  String? convenio;
  bool? possuiHistoricoCardiaco;
  String? email;
  String? quaisRemedios;
  bool? usaRemedioControlado;
  String? plano;
  String? dataNascimento;
  String? cpf;
  String? nomeMae;
  String? endereco;
  bool? sedentarismo;
  String? nomeCompleto;

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        observacoes: json["observacoes"],
        telefone: json["telefone"],
        fumante: json["fumante"],
        convenio: json["convenio"],
        possuiHistoricoCardiaco: json["possui_historico_cardiaco"],
        email: json["email"],
        quaisRemedios: json["quais_remedios"],
        usaRemedioControlado: json["usa_remedio_controlado"],
        plano: json["plano"],
        dataNascimento: json["data_nascimento"],
        cpf: json["cpf"],
        nomeMae: json["nome_mae"],
        endereco: json["endereco"],
        sedentarismo: json["sedentarismo"],
        id: json["id"],
        nomeCompleto: json["nome_completo"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "observacoes": observacoes,
        "telefone": telefone,
        "fumante": fumante,
        "convenio": convenio,
        "possui_historico_cardiaco": possuiHistoricoCardiaco,
        "email": email,
        "quais_remedios": quaisRemedios,
        "usa_remedio_controlado": usaRemedioControlado,
        "plano": plano,
        "data_nascimento": dataNascimento,
        "cpf": cpf,
        "nome_mae": nomeMae,
        "endereco": endereco,
        "sedentarismo": sedentarismo,
        "id": id,
        "nome_completo": nomeCompleto,
      };

  @override
  Map<String, dynamic> toUpdateJson() => {
        "observacoes": {"Value": observacoes},
        "telefone": {"Value": telefone},
        "fumante": {"Value": fumante},
        "convenio": {"Value": convenio},
        "possui_historico_cardiaco": {"Value": possuiHistoricoCardiaco},
        "email": {"Value": email},
        "quais_remedios": {"Value": quaisRemedios},
        "usa_remedio_controlado": {"Value": usaRemedioControlado},
        "plano": {"Value": plano},
        "data_nascimento": {"Value": dataNascimento},
        "cpf": {"Value": cpf},
        "nome_mae": {"Value": nomeMae},
        "endereco": {"Value": endereco},
        "sedentarismo": {"Value": sedentarismo},
        "nome_completo": {"Value": nomeCompleto},
      };
}
