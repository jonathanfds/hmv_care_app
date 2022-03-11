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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Emergencia type in your schema. */
@immutable
class Emergencia extends Model {
  static const classType = const _EmergenciaModelType();
  final String id;
  final String? _data;
  final String? _localizacao;
  final EmergenciaStatusEnum? _status;
  final EmergenciaSeveridadeEnum? _severidade;
  final List<QuestionarioPergunta>? _questionario;
  final Pacientes? _paciente;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _emergenciaPacienteId;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  String? get data {
    return _data;
  }

  String? get localizacao {
    return _localizacao;
  }

  EmergenciaStatusEnum? get status {
    return _status;
  }

  EmergenciaSeveridadeEnum? get severidade {
    return _severidade;
  }

  List<QuestionarioPergunta>? get questionario {
    return _questionario;
  }

  Pacientes? get paciente {
    return _paciente;
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  String? get emergenciaPacienteId {
    return _emergenciaPacienteId;
  }

  const Emergencia._internal(
      {required this.id,
      data,
      localizacao,
      status,
      severidade,
      questionario,
      paciente,
      createdAt,
      updatedAt,
      emergenciaPacienteId})
      : _data = data,
        _localizacao = localizacao,
        _status = status,
        _severidade = severidade,
        _questionario = questionario,
        _paciente = paciente,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _emergenciaPacienteId = emergenciaPacienteId;

  factory Emergencia(
      {String? id,
      String? data,
      String? localizacao,
      EmergenciaStatusEnum? status,
      EmergenciaSeveridadeEnum? severidade,
      List<QuestionarioPergunta>? questionario,
      Pacientes? paciente,
      String? emergenciaPacienteId}) {
    return Emergencia._internal(
        id: id == null ? UUID.getUUID() : id,
        data: data,
        localizacao: localizacao,
        status: status,
        severidade: severidade,
        questionario: questionario != null
            ? List<QuestionarioPergunta>.unmodifiable(questionario)
            : questionario,
        paciente: paciente,
        emergenciaPacienteId: emergenciaPacienteId);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Emergencia &&
        id == other.id &&
        _data == other._data &&
        _localizacao == other._localizacao &&
        _status == other._status &&
        _severidade == other._severidade &&
        DeepCollectionEquality().equals(_questionario, other._questionario) &&
        _paciente == other._paciente &&
        _emergenciaPacienteId == other._emergenciaPacienteId;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Emergencia {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("data=" + "$_data" + ", ");
    buffer.write("localizacao=" + "$_localizacao" + ", ");
    buffer.write(
        "status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("severidade=" +
        (_severidade != null ? enumToString(_severidade)! : "null") +
        ", ");
    buffer.write("questionario=" +
        (_questionario != null ? _questionario!.toString() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write("updatedAt=" +
        (_updatedAt != null ? _updatedAt!.format() : "null") +
        ", ");
    buffer.write("emergenciaPacienteId=" + "$_emergenciaPacienteId");
    buffer.write("}");

    return buffer.toString();
  }

  Emergencia copyWith(
      {String? id,
      String? data,
      String? localizacao,
      EmergenciaStatusEnum? status,
      EmergenciaSeveridadeEnum? severidade,
      List<QuestionarioPergunta>? questionario,
      Pacientes? paciente,
      String? emergenciaPacienteId}) {
    return Emergencia._internal(
        id: id ?? this.id,
        data: data ?? this.data,
        localizacao: localizacao ?? this.localizacao,
        status: status ?? this.status,
        severidade: severidade ?? this.severidade,
        questionario: questionario ?? this.questionario,
        paciente: paciente ?? this.paciente,
        emergenciaPacienteId:
            emergenciaPacienteId ?? this.emergenciaPacienteId);
  }

  Emergencia.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _data = json['data'],
        _localizacao = json['localizacao'],
        _status = enumFromString<EmergenciaStatusEnum>(
            json['status'], EmergenciaStatusEnum.values),
        _severidade = enumFromString<EmergenciaSeveridadeEnum>(
            json['severidade'], EmergenciaSeveridadeEnum.values),
        _questionario = json['questionario'] is List
            ? (json['questionario'] as List)
                .where((e) => e != null)
                .map((e) => QuestionarioPergunta.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _paciente = json['paciente']?['serializedData'] != null
            ? Pacientes.fromJson(new Map<String, dynamic>.from(
                json['paciente']['serializedData']))
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null,
        _emergenciaPacienteId = json['emergenciaPacienteId'];

  Emergencia.fromRawJson(Map<String, dynamic> json)
      : id = json['id'],
        _data = json['data'],
        _localizacao = json['localizacao'],
        _status = enumFromString<EmergenciaStatusEnum>(
            json['status'], EmergenciaStatusEnum.values),
        _severidade = enumFromString<EmergenciaSeveridadeEnum>(
            json['severidade'], EmergenciaSeveridadeEnum.values),
        _questionario = json['questionario'] is List
            ? (json['questionario'] as List)
                .where((e) => e != null)
                .map((e) => QuestionarioPergunta.fromJson(
                    new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        _paciente = json['paciente'] != null
            ? Pacientes.fromJson(
                new Map<String, dynamic>.from(json['paciente']))
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null,
        _emergenciaPacienteId = json['emergenciaPacienteId'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'data': _data,
        'localizacao': _localizacao,
        'status': enumToString(_status),
        'severidade': enumToString(_severidade),
        'questionario': _questionario
            ?.map((QuestionarioPergunta? e) => e?.toJson())
            .toList(),
        'paciente': _paciente?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format(),
        'emergenciaPacienteId': _emergenciaPacienteId
      };

  static final QueryField ID = QueryField(fieldName: "emergencia.id");
  static final QueryField DATA = QueryField(fieldName: "data");
  static final QueryField LOCALIZACAO = QueryField(fieldName: "localizacao");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField SEVERIDADE = QueryField(fieldName: "severidade");
  static final QueryField QUESTIONARIO = QueryField(fieldName: "questionario");
  static final QueryField PACIENTE = QueryField(
      fieldName: "paciente",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Pacientes).toString()));
  static final QueryField EMERGENCIAPACIENTEID =
      QueryField(fieldName: "emergenciaPacienteId");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Emergencia";
    modelSchemaDefinition.pluralName = "Emergencias";

    modelSchemaDefinition.authRules = [
      AuthRule(
          authStrategy: AuthStrategy.GROUPS,
          groupClaim: "cognito:groups",
          groups: ["pacientes"],
          provider: AuthRuleProvider.USERPOOLS,
          operations: [ModelOperation.CREATE]),
      AuthRule(
          authStrategy: AuthStrategy.GROUPS,
          groupClaim: "cognito:groups",
          groups: ["hospital"],
          provider: AuthRuleProvider.USERPOOLS,
          operations: [
            ModelOperation.READ,
            ModelOperation.CREATE,
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
        key: Emergencia.DATA,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Emergencia.LOCALIZACAO,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Emergencia.STATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Emergencia.SEVERIDADE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        fieldName: 'questionario',
        isRequired: false,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection,
            ofCustomTypeName: 'QuestionarioPergunta')));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
        key: Emergencia.PACIENTE,
        isRequired: false,
        ofModelName: (Pacientes).toString(),
        associatedKey: Pacientes.ID));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Emergencia.EMERGENCIAPACIENTEID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _EmergenciaModelType extends ModelType<Emergencia> {
  const _EmergenciaModelType();

  @override
  Emergencia fromJson(Map<String, dynamic> jsonData) {
    return Emergencia.fromJson(jsonData);
  }
}
