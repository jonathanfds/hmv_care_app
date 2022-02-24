import 'dart:convert';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:hive/hive.dart';

/// Extend CognitoStorage with Shared Preferences to persist account
/// login sessions
class HiveCognitoStorage extends CognitoStorage {
  final Box<dynamic> _hiveBox;
  HiveCognitoStorage(this._hiveBox);

  @override
  Future getItem(String key) async {
    String item;
    try {
      item = json.decode(_hiveBox.get(key));
    } catch (e) {
      return null;
    }
    return item;
  }

  @override
  Future setItem(String key, value) async {
    await _hiveBox.put(key, json.encode(value));
    return getItem(key);
  }

  @override
  Future removeItem(String key) async {
    final item = getItem(key);
    if (item != null) {
      await _hiveBox.delete(key);
      return item;
    }
    return null;
  }

  @override
  Future<void> clear() async {
    await _hiveBox.clear();
  }
}
