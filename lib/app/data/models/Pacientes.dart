/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Pacientes type in your schema. */
@immutable
class Pacientes extends Model {
  static const classType = const _PacientesModelType();
  final String id;
  final String? _nome_completo;
  final String? _cpf;
  final String? _email;
  final String? _data_nascimento;
  final String? _nome_mae;
  final String? _telefone;
  final String? _endereco;
  final String? _convenio;
  final String? _plano;
  final String? _peso;
  final String? _altura;
  final String? _doencas;
  final String? _remedios_controlados;
  final String? _remedios_alergia;
  final bool? _possui_historico_cardiaco;
  final bool? _bebida_alcoolica;
  final bool? _fumante;
  final String? _observacoes;
  final String? _user_id;
  final AtividadeFisicaEnum? _atividade_fisica;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get nome_completo {
    return _nome_completo;
  }
  
  String? get cpf {
    return _cpf;
  }
  
  String? get email {
    return _email;
  }
  
  String? get data_nascimento {
    return _data_nascimento;
  }
  
  String? get nome_mae {
    return _nome_mae;
  }
  
  String? get telefone {
    return _telefone;
  }
  
  String? get endereco {
    return _endereco;
  }
  
  String? get convenio {
    return _convenio;
  }
  
  String? get plano {
    return _plano;
  }
  
  String? get peso {
    return _peso;
  }
  
  String? get altura {
    return _altura;
  }
  
  String? get doencas {
    return _doencas;
  }
  
  String? get remedios_controlados {
    return _remedios_controlados;
  }
  
  String? get remedios_alergia {
    return _remedios_alergia;
  }
  
  bool? get possui_historico_cardiaco {
    return _possui_historico_cardiaco;
  }
  
  bool? get bebida_alcoolica {
    return _bebida_alcoolica;
  }
  
  bool? get fumante {
    return _fumante;
  }
  
  String? get observacoes {
    return _observacoes;
  }
  
  String? get user_id {
    return _user_id;
  }
  
  AtividadeFisicaEnum? get atividade_fisica {
    return _atividade_fisica;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Pacientes._internal({required this.id, nome_completo, cpf, email, data_nascimento, nome_mae, telefone, endereco, convenio, plano, peso, altura, doencas, remedios_controlados, remedios_alergia, possui_historico_cardiaco, bebida_alcoolica, fumante, observacoes, user_id, atividade_fisica, createdAt, updatedAt}): _nome_completo = nome_completo, _cpf = cpf, _email = email, _data_nascimento = data_nascimento, _nome_mae = nome_mae, _telefone = telefone, _endereco = endereco, _convenio = convenio, _plano = plano, _peso = peso, _altura = altura, _doencas = doencas, _remedios_controlados = remedios_controlados, _remedios_alergia = remedios_alergia, _possui_historico_cardiaco = possui_historico_cardiaco, _bebida_alcoolica = bebida_alcoolica, _fumante = fumante, _observacoes = observacoes, _user_id = user_id, _atividade_fisica = atividade_fisica, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Pacientes({String? id, String? nome_completo, String? cpf, String? email, String? data_nascimento, String? nome_mae, String? telefone, String? endereco, String? convenio, String? plano, String? peso, String? altura, String? doencas, String? remedios_controlados, String? remedios_alergia, bool? possui_historico_cardiaco, bool? bebida_alcoolica, bool? fumante, String? observacoes, String? user_id, AtividadeFisicaEnum? atividade_fisica}) {
    return Pacientes._internal(
      id: id == null ? UUID.getUUID() : id,
      nome_completo: nome_completo,
      cpf: cpf,
      email: email,
      data_nascimento: data_nascimento,
      nome_mae: nome_mae,
      telefone: telefone,
      endereco: endereco,
      convenio: convenio,
      plano: plano,
      peso: peso,
      altura: altura,
      doencas: doencas,
      remedios_controlados: remedios_controlados,
      remedios_alergia: remedios_alergia,
      possui_historico_cardiaco: possui_historico_cardiaco,
      bebida_alcoolica: bebida_alcoolica,
      fumante: fumante,
      observacoes: observacoes,
      user_id: user_id,
      atividade_fisica: atividade_fisica);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pacientes &&
      id == other.id &&
      _nome_completo == other._nome_completo &&
      _cpf == other._cpf &&
      _email == other._email &&
      _data_nascimento == other._data_nascimento &&
      _nome_mae == other._nome_mae &&
      _telefone == other._telefone &&
      _endereco == other._endereco &&
      _convenio == other._convenio &&
      _plano == other._plano &&
      _peso == other._peso &&
      _altura == other._altura &&
      _doencas == other._doencas &&
      _remedios_controlados == other._remedios_controlados &&
      _remedios_alergia == other._remedios_alergia &&
      _possui_historico_cardiaco == other._possui_historico_cardiaco &&
      _bebida_alcoolica == other._bebida_alcoolica &&
      _fumante == other._fumante &&
      _observacoes == other._observacoes &&
      _user_id == other._user_id &&
      _atividade_fisica == other._atividade_fisica;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Pacientes {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("nome_completo=" + "$_nome_completo" + ", ");
    buffer.write("cpf=" + "$_cpf" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("data_nascimento=" + "$_data_nascimento" + ", ");
    buffer.write("nome_mae=" + "$_nome_mae" + ", ");
    buffer.write("telefone=" + "$_telefone" + ", ");
    buffer.write("endereco=" + "$_endereco" + ", ");
    buffer.write("convenio=" + "$_convenio" + ", ");
    buffer.write("plano=" + "$_plano" + ", ");
    buffer.write("peso=" + "$_peso" + ", ");
    buffer.write("altura=" + "$_altura" + ", ");
    buffer.write("doencas=" + "$_doencas" + ", ");
    buffer.write("remedios_controlados=" + "$_remedios_controlados" + ", ");
    buffer.write("remedios_alergia=" + "$_remedios_alergia" + ", ");
    buffer.write("possui_historico_cardiaco=" + (_possui_historico_cardiaco != null ? _possui_historico_cardiaco!.toString() : "null") + ", ");
    buffer.write("bebida_alcoolica=" + (_bebida_alcoolica != null ? _bebida_alcoolica!.toString() : "null") + ", ");
    buffer.write("fumante=" + (_fumante != null ? _fumante!.toString() : "null") + ", ");
    buffer.write("observacoes=" + "$_observacoes" + ", ");
    buffer.write("user_id=" + "$_user_id" + ", ");
    buffer.write("atividade_fisica=" + (_atividade_fisica != null ? enumToString(_atividade_fisica)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Pacientes copyWith({String? id, String? nome_completo, String? cpf, String? email, String? data_nascimento, String? nome_mae, String? telefone, String? endereco, String? convenio, String? plano, String? peso, String? altura, String? doencas, String? remedios_controlados, String? remedios_alergia, bool? possui_historico_cardiaco, bool? bebida_alcoolica, bool? fumante, String? observacoes, String? user_id, AtividadeFisicaEnum? atividade_fisica}) {
    return Pacientes._internal(
      id: id ?? this.id,
      nome_completo: nome_completo ?? this.nome_completo,
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
      data_nascimento: data_nascimento ?? this.data_nascimento,
      nome_mae: nome_mae ?? this.nome_mae,
      telefone: telefone ?? this.telefone,
      endereco: endereco ?? this.endereco,
      convenio: convenio ?? this.convenio,
      plano: plano ?? this.plano,
      peso: peso ?? this.peso,
      altura: altura ?? this.altura,
      doencas: doencas ?? this.doencas,
      remedios_controlados: remedios_controlados ?? this.remedios_controlados,
      remedios_alergia: remedios_alergia ?? this.remedios_alergia,
      possui_historico_cardiaco: possui_historico_cardiaco ?? this.possui_historico_cardiaco,
      bebida_alcoolica: bebida_alcoolica ?? this.bebida_alcoolica,
      fumante: fumante ?? this.fumante,
      observacoes: observacoes ?? this.observacoes,
      user_id: user_id ?? this.user_id,
      atividade_fisica: atividade_fisica ?? this.atividade_fisica);
  }
  
  Pacientes.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nome_completo = json['nome_completo'],
      _cpf = json['cpf'],
      _email = json['email'],
      _data_nascimento = json['data_nascimento'],
      _nome_mae = json['nome_mae'],
      _telefone = json['telefone'],
      _endereco = json['endereco'],
      _convenio = json['convenio'],
      _plano = json['plano'],
      _peso = json['peso'],
      _altura = json['altura'],
      _doencas = json['doencas'],
      _remedios_controlados = json['remedios_controlados'],
      _remedios_alergia = json['remedios_alergia'],
      _possui_historico_cardiaco = json['possui_historico_cardiaco'],
      _bebida_alcoolica = json['bebida_alcoolica'],
      _fumante = json['fumante'],
      _observacoes = json['observacoes'],
      _user_id = json['user_id'],
      _atividade_fisica = enumFromString<AtividadeFisicaEnum>(json['atividade_fisica'], AtividadeFisicaEnum.values),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nome_completo': _nome_completo, 'cpf': _cpf, 'email': _email, 'data_nascimento': _data_nascimento, 'nome_mae': _nome_mae, 'telefone': _telefone, 'endereco': _endereco, 'convenio': _convenio, 'plano': _plano, 'peso': _peso, 'altura': _altura, 'doencas': _doencas, 'remedios_controlados': _remedios_controlados, 'remedios_alergia': _remedios_alergia, 'possui_historico_cardiaco': _possui_historico_cardiaco, 'bebida_alcoolica': _bebida_alcoolica, 'fumante': _fumante, 'observacoes': _observacoes, 'user_id': _user_id, 'atividade_fisica': enumToString(_atividade_fisica), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "pacientes.id");
  static final QueryField NOME_COMPLETO = QueryField(fieldName: "nome_completo");
  static final QueryField CPF = QueryField(fieldName: "cpf");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField DATA_NASCIMENTO = QueryField(fieldName: "data_nascimento");
  static final QueryField NOME_MAE = QueryField(fieldName: "nome_mae");
  static final QueryField TELEFONE = QueryField(fieldName: "telefone");
  static final QueryField ENDERECO = QueryField(fieldName: "endereco");
  static final QueryField CONVENIO = QueryField(fieldName: "convenio");
  static final QueryField PLANO = QueryField(fieldName: "plano");
  static final QueryField PESO = QueryField(fieldName: "peso");
  static final QueryField ALTURA = QueryField(fieldName: "altura");
  static final QueryField DOENCAS = QueryField(fieldName: "doencas");
  static final QueryField REMEDIOS_CONTROLADOS = QueryField(fieldName: "remedios_controlados");
  static final QueryField REMEDIOS_ALERGIA = QueryField(fieldName: "remedios_alergia");
  static final QueryField POSSUI_HISTORICO_CARDIACO = QueryField(fieldName: "possui_historico_cardiaco");
  static final QueryField BEBIDA_ALCOOLICA = QueryField(fieldName: "bebida_alcoolica");
  static final QueryField FUMANTE = QueryField(fieldName: "fumante");
  static final QueryField OBSERVACOES = QueryField(fieldName: "observacoes");
  static final QueryField USER_ID = QueryField(fieldName: "user_id");
  static final QueryField ATIVIDADE_FISICA = QueryField(fieldName: "atividade_fisica");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Pacientes";
    modelSchemaDefinition.pluralName = "Pacientes";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "hospital" ],
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.READ,
          ModelOperation.UPDATE,
          ModelOperation.DELETE
        ]),
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.NOME_COMPLETO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.CPF,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.DATA_NASCIMENTO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.NOME_MAE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.TELEFONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.ENDERECO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.CONVENIO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.PLANO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.PESO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.ALTURA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.DOENCAS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.REMEDIOS_CONTROLADOS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.REMEDIOS_ALERGIA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.POSSUI_HISTORICO_CARDIACO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.BEBIDA_ALCOOLICA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.FUMANTE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.OBSERVACOES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.USER_ID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pacientes.ATIVIDADE_FISICA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _PacientesModelType extends ModelType<Pacientes> {
  const _PacientesModelType();
  
  @override
  Pacientes fromJson(Map<String, dynamic> jsonData) {
    return Pacientes.fromJson(jsonData);
  }
}