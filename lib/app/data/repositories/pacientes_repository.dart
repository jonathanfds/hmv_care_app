import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hmv_care_app/app/data/providers/graphql_storage_api.dart';
import '../models/ModelProvider.dart';

abstract class IPacientesRepository {
  Future<List<Pacientes>> getAll();
  Future<Pacientes?> getById(String id);
  Future<bool> delete(id);
  Future<bool> update(Pacientes obj);
  Future<bool> insert(Pacientes obj);
}
