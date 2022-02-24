import 'package:get/get.dart';

import 'emergencia_controller.dart';

class EmergenciaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmergenciaController>(() => EmergenciaController());
  }
}
