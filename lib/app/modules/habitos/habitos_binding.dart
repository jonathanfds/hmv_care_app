import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/ModelProvider.dart';
import 'package:hmv_care_app/app/data/repositories/pacientes_repository.dart';

import '../../data/providers/graphql_storage_api.dart';
import '../../data/providers/dio_custom_client.dart';
import 'habitos_controller.dart';

class HabitosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HabitosController>(
        () => HabitosController(Get.find(), Get.arguments as Pacientes));
  }
}
