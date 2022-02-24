import 'package:flutter/material.dart';
import 'package:hmv_care_app/app/data/models/paciente.dart';
import 'package:hmv_care_app/app/data/providers/datastorage_api.dart';

class PacientesRepository {
  final DataStorageRepositoryApi api;
  PacientesRepository(this.api);
  final _table = 'pacientes';

  Future<List<Paciente>> getAll() async {
    var items = await api.getAll(_table);
    var data = items.map((t) => Paciente.fromJson(t));
    return List<Paciente>.from(data);
  }

  Future<Paciente> getById(String id) async {
    var item = await api.get(_table, id);
    return Paciente.fromJson(item);
  }

  Future<bool> delete(id) {
    return api.delete(_table, id);
  }

  Future<bool> update(Paciente obj) {
    return api.update(_table, obj);
  }

  Future<bool> insert(Paciente obj) {
    return api.insert(_table, obj);
  }
}
