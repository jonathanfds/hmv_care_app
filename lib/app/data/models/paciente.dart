// To parse this JSON data, do
//
//     final Paciente = PacienteFromJson(jsonString);

import 'dart:convert';

import 'package:hmv_care_app/app/data/models/base_model.dart';
import 'package:intl/intl.dart';

Paciente PacienteFromJson(String str) => Paciente.fromJson(json.decode(str));

String PacienteToJson(Paciente data) => json.encode(data.toJson());

class Paciente implements IBaseModel {
  Paciente(
      {required this.id,
      this.observacoes,
      this.telefone,
      this.fumante,
      this.convenio,
      this.possuiHistoricoCardiaco,
      this.email,
      this.remediosAlergia,
      this.remediosControlados,
      this.plano,
      this.dataNascimento,
      this.cpf,
      this.nomeMae,
      this.endereco,
      this.atividadeFisica,
      this.nomeCompleto,
      this.doencas,
      this.peso,
      this.altura,
      this.bebidaAlcoolica,
      this.foto,
      this.ultimaAtualizacao});
  @override
  String id;
  String? observacoes;
  String? telefone;
  bool? fumante;
  String? convenio;
  bool? possuiHistoricoCardiaco;
  String? email;
  String? remediosAlergia;
  String? remediosControlados;
  String? plano;
  String? dataNascimento;
  String? cpf;
  String? nomeMae;
  String? endereco;
  String? atividadeFisica;
  String? nomeCompleto;
  String? ultimaAtualizacao;
  String? doencas;
  String? peso;
  String? altura;
  bool? bebidaAlcoolica;
  String? foto;
  String get idade {
    var dtNasci = DateFormat('dd/MM/yyyy').parse(dataNascimento!);
    final difference = DateTime.now().difference(dtNasci).inDays ~/ 365;
    return difference.toString();
  }

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        observacoes: json["observacoes"],
        telefone: json["telefone"],
        fumante: json["fumante"],
        convenio: json["convenio"],
        possuiHistoricoCardiaco: json["possui_historico_cardiaco"],
        email: json["email"],
        remediosAlergia: json["remedios_alergia"],
        remediosControlados: json["remedios_controlados"],
        plano: json["plano"],
        peso: json["peso"],
        altura: json["altura"],
        dataNascimento: json["data_nascimento"],
        cpf: json["cpf"],
        nomeMae: json["nome_mae"],
        endereco: json["endereco"],
        atividadeFisica: json["atividade_fisica"],
        id: json["id"],
        ultimaAtualizacao: json["ultima_atualizacao"],
        nomeCompleto: json["nome_completo"],
        doencas: json["doencas"],
        bebidaAlcoolica: json["bebida_alcoolica"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "observacoes": observacoes,
        "telefone": telefone,
        "fumante": fumante,
        "convenio": convenio,
        "possui_historico_cardiaco": possuiHistoricoCardiaco,
        "email": email,
        "remedios_alergia": remediosAlergia,
        "remedios_controlados": remediosControlados,
        "plano": plano,
        "peso": peso,
        "altura": altura,
        "data_nascimento": dataNascimento,
        "cpf": cpf,
        "nome_mae": nomeMae,
        "endereco": endereco,
        "atividade_fisica": atividadeFisica,
        "id": id,
        "nome_completo": nomeCompleto,
        "doencas": doencas,
        "ultima_atualizacao": ultimaAtualizacao,
        "bebida_alcoolica": bebidaAlcoolica,
      };

  @override
  Map<String, dynamic> toUpdateJson() => {
        "observacoes": {"Value": observacoes},
        "telefone": {"Value": telefone},
        "fumante": {"Value": fumante},
        "convenio": {"Value": convenio},
        "possui_historico_cardiaco": {"Value": possuiHistoricoCardiaco},
        "email": {"Value": email},
        "remedios_alergia": {"Value": remediosAlergia},
        "remedios_controlados": {"Value": remediosControlados},
        "plano": {"Value": plano},
        "data_nascimento": {"Value": dataNascimento},
        "cpf": {"Value": cpf},
        "peso": {"Value": peso},
        "altura": {"Value": altura},
        "nome_mae": {"Value": nomeMae},
        "endereco": {"Value": endereco},
        "atividade_fisica": {"Value": atividadeFisica},
        "nome_completo": {"Value": nomeCompleto},
        "doencas": {"Value": doencas},
        "ultima_atualizacao": {"Value": ultimaAtualizacao},
        "bebida_alcoolica": {"Value": bebidaAlcoolica},
      };
}
