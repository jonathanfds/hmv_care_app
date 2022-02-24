import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmergenciaController extends GetxController {
  EmergenciaController();

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
