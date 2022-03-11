import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hmv_care_app/app/data/models/Emergencia.dart';

import '../../models/Pacientes.dart';
import '../../repositories/pacientes_repository.dart';

class PacientesAmplify extends IPacientesRepository {
  @override
  Future<bool> delete(id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Pacientes>> getAll() async {
    List<Pacientes> items = await Amplify.DataStore.query(Pacientes.classType);
    return items;
  }

  @override
  Future<Pacientes> getById(String id) async {
    List<Pacientes> items = await Amplify.DataStore.query(Pacientes.classType,
        where: Pacientes.USER_ID.eq(id));
    return items.first;
  }

  @override
  Future<bool> insert(Pacientes obj) async {
    try {
      await Amplify.DataStore.save(obj);
      return true;
    } catch (e) {}
    return false;
  }

  @override
  Future<bool> update(Pacientes obj) async {
    try {
      await Amplify.DataStore.save(obj);
      return true;
    } catch (e) {}
    return false;
  }
}
