import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hmv_care_app/app/data/providers/graphql_storage_api.dart';
import '../models/ModelProvider.dart';

abstract class IEmergenciasRepository {
  Future<List<Emergencia>> getAll();
  Future<Emergencia> getById(String id);
  Future<bool> delete(id);
  Future<bool> update(Emergencia obj);
  Future<bool> insert(Emergencia obj);
}
