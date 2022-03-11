import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import '../../../core/utils/constants.dart';
import '../../features/authentication/authentication_controller.dart';
import '../models/Emergencia.dart';
import '../models/Pacientes.dart';

class GraphQLStorageApi {
  GraphQLStorageApi();
  GraphQLClient? _graphQLClient;
  GraphQLClient get graphQLClient {
    return _graphQLClient ?? _getGraphQLClient();
  }

  GraphQLClient _getGraphQLClient() {
    final HttpLink httpLink = HttpLink(
        'https://n4gcecaeivatfl6ps6aihijske.appsync-api.us-east-2.amazonaws.com/graphql');

    final AuthLink authLink = AuthLink(getToken: () async {
      var token = await Get.find<AuthenticationController>().getToken();
      return '$token';
    });
    final Link link = authLink.concat(httpLink);
    _graphQLClient = GraphQLClient(link: link, cache: GraphQLCache());
    return _graphQLClient!;
  }

  Future<dynamic> getAll(String tableName) async {
    try {
      String fields = "";
      String queryName = "list$tableName";
      if (tableName == Pacientes.schema.name) {
        fields = Pacientes.schema.fields!.keys.join(" ");
        queryName = "list${Pacientes.schema.pluralName}";
      } else if (tableName == Emergencia.schema.name) {
        fields = Emergencia.schema.fields!.keys.join(" ");
        queryName = "list${Emergencia.schema.pluralName}";
      }

      String query =
          'query GetAll$tableName { $queryName { items { $fields } } }';

      final QueryOptions options = QueryOptions(
        document: gql(query),
      );
      final QueryResult result = await graphQLClient.query(options);

      if (result.exception == null) {
        return result.data![queryName]["items"];
      } else {
        print('erro -get');
      }
    } catch (ex) {
      print(ex);
    }
    return null;
  }

  Future<dynamic> get(String tableName, String id) async {
    return null;
  }

  Future<bool> delete(String tableName, String id) async {
    return false;
  }

  Future<bool> update(String tableName, dynamic obj) async {
    return false;
  }

  Future<bool> insert(String tableName, dynamic obj) async {
    return false;
  }
}
