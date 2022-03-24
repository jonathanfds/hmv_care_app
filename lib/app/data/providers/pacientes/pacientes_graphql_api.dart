import 'dart:convert';

import 'package:get/get.dart';
import 'package:graphql/client.dart';

import '../../models/ModelProvider.dart';
import '../../repositories/pacientes_repository.dart';
import '../graphql_storage_api.dart';

class PacientesGraphQLApi extends IPacientesRepository {
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
  Future<List<Pacientes>> getAll() async {
    String query = r'''query MyQuery {
                    syncPacientes {
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
    var client = await getGraphQLClient();
    final QueryResult result = await client.query(options);

    if (result.exception == null) {
      var items = result.data!['syncPacientes']["items"];
      items = items.where((t) => t['_deleted'] != true).toList();
      var data = items.map((t) => Pacientes.fromJson(t));
      return List<Pacientes>.from(data);
    }
    return [];
  }

  @override
  Future<Pacientes?> getById(String id) async {
    String query = r'''query MyQuery {
  getPacientes(id: "c75c3e70-91e6-4170-b404-aaa70df28c85"){                      
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
''';
    final QueryOptions options = QueryOptions(
      document: gql(query),
    );
    var client = await getGraphQLClient();
    final QueryResult result = await client.query(options);

    if (result.exception == null) {
      var paciente = Pacientes.fromJson(result.data!['getPacientes']);
      return paciente;
    }
    return null;
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
