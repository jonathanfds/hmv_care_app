import 'package:get/get.dart';

import 'lista_pacientes_controller.dart';

class ListaPacientesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListaPacientesController>(
        () => ListaPacientesController(Get.find()));
  }
}
