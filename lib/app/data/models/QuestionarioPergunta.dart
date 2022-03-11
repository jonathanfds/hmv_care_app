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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the QuestionarioPergunta type in your schema. */
@immutable
class QuestionarioPergunta {
  final String? _pergunta;
  final String? _resposta;

  String? get pergunta {
    return _pergunta;
  }
  
  String? get resposta {
    return _resposta;
  }
  
  const QuestionarioPergunta._internal({pergunta, resposta}): _pergunta = pergunta, _resposta = resposta;
  
  factory QuestionarioPergunta({String? pergunta, String? resposta}) {
    return QuestionarioPergunta._internal(
      pergunta: pergunta,
      resposta: resposta);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionarioPergunta &&
      _pergunta == other._pergunta &&
      _resposta == other._resposta;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("QuestionarioPergunta {");
    buffer.write("pergunta=" + "$_pergunta" + ", ");
    buffer.write("resposta=" + "$_resposta");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  QuestionarioPergunta copyWith({String? pergunta, String? resposta}) {
    return QuestionarioPergunta._internal(
      pergunta: pergunta ?? this.pergunta,
      resposta: resposta ?? this.resposta);
  }
  
  QuestionarioPergunta.fromJson(Map<String, dynamic> json)  
    : _pergunta = json['pergunta'],
      _resposta = json['resposta'];
  
  Map<String, dynamic> toJson() => {
    'pergunta': _pergunta, 'resposta': _resposta
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "QuestionarioPergunta";
    modelSchemaDefinition.pluralName = "QuestionarioPerguntas";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'pergunta',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'resposta',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}