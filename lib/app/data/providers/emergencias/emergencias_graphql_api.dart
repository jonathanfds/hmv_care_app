import 'dart:convert';

import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:hmv_care_app/app/data/providers/graphql_storage_api.dart';

import '../../models/Emergencia.dart';
import '../../repositories/emergencias_repository.dart';

class EmergenciasGraphQLApi extends IEmergenciasRepository {
  @override
  Future<bool> delete(id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  Future<GraphQLClient> getGraphQLClient() async {
    if (Get.isRegistered<GraphQLClient>()) {
      return Get.find<GraphQLClient>();
    } else {
      return await GraphQLStorageApi.setupGraphQLClient();
    }
  }

  @override
  Future<List<Emergencia>> getAll() async {
    String query = r'''query MyQuery {
                        syncEmergencias {
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
    var client = await getGraphQLClient();
    final QueryResult result = await client.query(options);

    if (result.exception == null) {
      var items = result.data!['syncEmergencias']["items"] as List;
      items = items.where((t) => t['_deleted'] != true).toList();
      var data = items.map((t) {
        return Emergencia.fromRawJson(t);
      });
      var list = List<Emergencia>.from(data);
      var dateNow = DateTime.now().toUtc();
      return list
          .where((t) =>
              t.createdAt != null &&
              t.createdAt!.getDateTimeInUtc().day == dateNow.day &&
              dateNow.month == t.createdAt!.getDateTimeInUtc().month)
          .toList();
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
