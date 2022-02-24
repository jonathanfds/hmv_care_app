import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/providers/datastorage_api.dart';
import 'package:hmv_care_app/app/data/providers/dio_custom_client.dart';
import 'package:hmv_care_app/app/data/repositories/pacientes_repository.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(PacientesRepository(
        DataStorageRepositoryApi(httpClient: DioCustomClient.getClient))));
  }
}
