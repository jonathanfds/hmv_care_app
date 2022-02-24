import 'emergencia.dart';

abstract class IBaseModel {
  late String id;
  Map<String, dynamic> toJson();
  Map<String, dynamic> toUpdateJson();
}
