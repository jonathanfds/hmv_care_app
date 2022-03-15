import 'dart:convert';

import 'package:get/get.dart';
import 'package:graphql/client.dart';

import '../../models/ModelProvider.dart';
import '../../repositories/pacientes_repository.dart';

class PacientesGraphQLApi extends IPacientesRepository {
  get _graphQLClient => Get.find<GraphQLClient>();
  @override
  Future<bool> delete(id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Pacientes>> getAll() async {
    String query = r'''query MyQuery {
                    listPacientes {
                      items {
                        user_id
                        updatedAt
                        telefone
                        remedios_controlados
                        remedios_alergia
                        possui_historico_cardiaco
                        plano
                        peso
                        owner
                        observacoes
                        nome_mae
                        nome_completo
                        id
                        fumante
                        endereco
                        email
                        doencas
                        data_nascimento
                        createdAt
                        cpf
                        convenio
                        bebida_alcoolica
                        atividade_fisica
                        altura
                        _version
                        _lastChangedAt
                        _deleted
                      }
                    }
                  }
                  ''';
    final QueryOptions options = QueryOptions(
      document: gql(query),
    );
    final QueryResult result = await _graphQLClient.query(options);

    if (result.exception == null) {
      var items = result.data!['listPacientes']["items"];
      items = items.where((t) => t['_deleted'] != true).toList();
      var data = items.map((t) => Pacientes.fromJson(t));
      return List<Pacientes>.from(data);
    }
    return [];
  }

  @override
  Future<Pacientes?> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(Pacientes obj) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Pacientes obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
