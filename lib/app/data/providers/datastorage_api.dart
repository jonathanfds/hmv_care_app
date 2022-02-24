import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hmv_care_app/app/data/models/paciente.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import '../../../core/utils/constants.dart';
import '../models/base_model.dart';

class DataStorageRepositoryApi {
  final Dio httpClient;
  DataStorageRepositoryApi({required this.httpClient});

  Future<dynamic> getAll(String tableName) async {
    try {
      var response = await httpClient.get('/storage?TableName=$tableName');
      if (response.statusCode == 200) {
        return response.data["Items"];
      } else
        print('erro -get');
    } catch (ex) {
      print(ex);
    }
    return null;
  }

  Future<dynamic> get(String tableName, String id) async {
    try {
      var response =
          await httpClient.get('/storage?TableName=$tableName&id=$id');
      if (response.statusCode == 200) {
        print(response.data);
        return response.data["Item"];
      } else
        print('erro -get');
    } catch (ex) {
      print(ex);
    }
    return null;
  }

  Future<bool> delete(String tableName, String id) async {
    var deleteBody = {
      "Key": {"id": id}
    };
    try {
      var response = await httpClient.delete('/storage?TableName=$tableName',
          data: deleteBody, options: Options(contentType: 'application/json'));
      if (response.statusCode == 200) {
        return true;
      }
    } catch (ex) {
      print(ex);
    }
    return false;
  }

  Future<bool> update(String tableName, IBaseModel obj) async {
    var updateBody = {
      "Key": {"id": obj.id},
      "AttributeUpdates": obj.toUpdateJson()
    };
    try {
      var response = await httpClient.put('/storage?TableName=$tableName',
          data: updateBody, options: Options(contentType: 'application/json'));
      if (response.statusCode == 200) {
        return true;
      }
    } catch (ex) {
      print(ex);
    }
    return false;
  }

  Future<bool> insert(String tableName, IBaseModel obj) async {
    var postBody = {"Item": obj.toJson()};
    try {
      var response = await httpClient.post('/storage?TableName=$tableName',
          data: postBody, options: Options(contentType: 'application/json'));
      if (response.statusCode == 200) {
        return true;
      }
    } catch (ex) {
      print(ex);
    }
    return false;
  }
}
