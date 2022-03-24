import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:gql/language.dart';
import 'package:graphql/client.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import '../../../core/utils/constants.dart';
import '../../features/authentication/authentication_controller.dart';
import '../models/Emergencia.dart';
import '../models/Pacientes.dart';

class GraphQLStorageApi {
  GraphQLStorageApi();

  static Future<GraphQLClient> setupGraphQLClient() async {
    final HttpLink httpLink = HttpLink(AppConfig.API_GRAPHQL);
    final AuthLink authLink = AuthLink(getToken: () async {
      var token = await Get.find<AuthenticationController>().getToken();
      return token;
    });
    Link link = authLink.concat(httpLink);
    var token = await Get.find<AuthenticationController>().getToken();
    final authHeader = {
      "Authorization": token,
      "host":
          "${AppConfig.AWS_APP_ID}.appsync-api.${AppConfig.AWS_REGION}.amazonaws.com",
    };
    final encodedHeader = base64.encode(utf8.encode(jsonEncode(authHeader)));
    final _wsLink = WebSocketLink(
        "${AppConfig.API_GRAPHQL_REALTIME}?header=$encodedHeader&payload=e30=",
        config: SocketClientConfig(
          serializer: AppSyncRequest(authHeader: authHeader),
          inactivityTimeout: const Duration(minutes: 3),
          autoReconnect: true,
        ));
    link = Link.split((request) => request.isSubscription, _wsLink, link);
    var client = GraphQLClient(
        link: link, cache: GraphQLCache(), alwaysRebroadcast: true);
    Get.put(client);
    return client;
  }
}

class AppSyncRequest extends RequestSerializer {
  final Map<String, dynamic> authHeader;

  const AppSyncRequest({
    required this.authHeader,
  });

  @override
  Map<String, dynamic> serializeRequest(Request request) => {
        "data": jsonEncode({
          "query": printNode(request.operation.document),
          "variables": request.variables,
        }),
        "extensions": {
          "authorization": authHeader,
        }
      };
}
