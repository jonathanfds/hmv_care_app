import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/providers/graphql_storage_api.dart';
import 'package:hmv_care_app/app/data/providers/dio_custom_client.dart';
import 'package:hmv_care_app/app/data/repositories/emergencias_repository.dart';
import 'package:hmv_care_app/app/data/repositories/pacientes_repository.dart';
import '../../data/providers/emergencias/emergencias_amplify.dart';
import '../../data/providers/emergencias/emergencias_graphql_api.dart';
import '../../data/providers/pacientes/pacientes_amplify.dart';
import '../../data/providers/pacientes/pacientes_graphql_api.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() async {
    if (GetPlatform.isWeb) {
      GraphQLStorageApi.setupGraphQLClient();
      Get.lazyPut<IPacientesRepository>(() => PacientesGraphQLApi());
      Get.lazyPut<IEmergenciasRepository>(() => EmergenciasGraphQLApi());
    } else {
      Get.lazyPut<IPacientesRepository>(() => PacientesAmplify());
      Get.lazyPut<IEmergenciasRepository>(() => EmergenciasAmplify());
    }
    Get.lazyPut<HomeController>(() => HomeController(Get.find(), Get.find()));
  }
}
