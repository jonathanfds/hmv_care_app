import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hmv_care_app/app/data/models/emergencia.dart';
import 'package:hmv_care_app/app/data/models/paciente.dart';
import 'package:hmv_care_app/app/data/providers/datastorage_api.dart';

class EmergenciasRepository {
  final DataStorageRepositoryApi api;
  EmergenciasRepository(this.api);
  final _table = 'emergencias';

  Future<List<Emergencia>> getAll() async {
    var items = await api.getAll(_table);
    var data = items.map((t) => Emergencia.fromJson(t));
    return List<Emergencia>.from(data);
  }

  Future<Emergencia> getById(String id) async {
    var item = await api.get(_table, id);
    return Emergencia.fromJson(item);
  }

  Future<bool> delete(id) {
    return api.delete(_table, id);
  }

  Future<bool> update(Emergencia obj) {
    return api.update(_table, obj);
  }

  Future<bool> insert(Emergencia obj) {
    return api.insert(_table, obj);
  }
}
