import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/repositories/pacientes_repository.dart';

import '../../data/providers/datastorage_api.dart';
import '../../data/providers/dio_custom_client.dart';
import 'habitos_controller.dart';

class HabitosBinding implements Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<PacientesRepository>()) {
      Get.lazyPut<PacientesRepository>(() => PacientesRepository(
          DataStorageRepositoryApi(httpClient: DioCustomClient.getClient)));
    }
    Get.lazyPut<HabitosController>(() => HabitosController(Get.find()));
  }
}
