import 'dart:convert';

import 'package:get/get.dart';
import 'package:graphql/client.dart';

import '../../models/Emergencia.dart';
import '../../repositories/emergencias_repository.dart';

class EmergenciasGraphQLApi extends IEmergenciasRepository {
  get _graphQLClient => Get.find<GraphQLClient>();
  @override
  Future<bool> delete(id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Emergencia>> getAll() async {
    String query = r'''query MyQuery {
                        listEmergencias {
                          items {
                            _deleted
                            _lastChangedAt
                            _version
                            createdAt
                            data
                            emergenciaPacienteId
                            id
                            localizacao
                            owner
                            paciente {
                              _deleted
                              _lastChangedAt
                              _version
                              altura
                              bebida_alcoolica
                              atividade_fisica
                              convenio
                              cpf
                              createdAt
                              data_nascimento
                              doencas
                              email
                              endereco
                              fumante
                              id
                              nome_completo
                              nome_mae
                              observacoes
                              owner
                              peso
                              plano
                              possui_historico_cardiaco
                              remedios_alergia
                              remedios_controlados
                              telefone
                              updatedAt
                              user_id
                            }
                            questionario {
                              resposta
                              pergunta
                            }
                            severidade
                            status
                            updatedAt
                          }
                        }
                      }''';
    final QueryOptions options = QueryOptions(
      document: gql(query),
    );
    final QueryResult result = await _graphQLClient.query(options);

    if (result.exception == null) {
      var items = result.data!['listEmergencias']["items"] as List;
      items = items.where((t) => t['_deleted'] != true).toList();
      var data = items.map((t) {
        return Emergencia.fromRawJson(t);
      });
      return List<Emergencia>.from(data);
    }
    return [];
  }

  @override
  Future<Emergencia> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(Emergencia obj) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Emergencia obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
