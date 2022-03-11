import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';

import '../../models/Emergencia.dart';
import '../../repositories/emergencias_repository.dart';

class EmergenciasAmplify extends IEmergenciasRepository {
  @override
  Future<bool> delete(id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Emergencia>> getAll() async {
    List<Emergencia> items =
        await Amplify.DataStore.query(Emergencia.classType);
    return items;
  }

  @override
  Future<Emergencia> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(Emergencia obj) async {
    try {
      await Amplify.DataStore.save(obj);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<bool> update(Emergencia obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
