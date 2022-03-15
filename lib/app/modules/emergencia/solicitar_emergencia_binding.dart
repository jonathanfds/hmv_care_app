import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/ModelProvider.dart';
import 'package:hmv_care_app/app/data/providers/graphql_storage_api.dart';
import 'package:hmv_care_app/app/data/providers/dio_custom_client.dart';
import 'package:hmv_care_app/app/data/repositories/emergencias_repository.dart';

import 'solicitar_emergencia_controller.dart';

class SolicitarEmergenciaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SolicitarEmergenciaController>(() =>
        SolicitarEmergenciaController(Get.find(), Get.arguments as Pacientes));
  }
}
