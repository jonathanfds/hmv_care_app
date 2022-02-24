import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'emergencia_controller.dart';

class EmergenciaPage extends GetView<EmergenciaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('EmergenciaPage')),
        body: SafeArea(child: Text('EmergenciaController')));
  }
}
