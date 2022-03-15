import 'package:intl/intl.dart';

int calc_idade(String dataNascimento) {
  var format = DateFormat('dd/MM/yyyy');
  var dateTime = format.parse(dataNascimento);
  var dateNow = DateTime.now();
  return dateNow.difference(dateTime).inDays ~/ 365;
}

double calc_imc(String peso, String altura) {
  try {
    var p = double.parse(peso.replaceAll(',', '.'));
    var a = double.parse(altura.replaceAll(',', '.'));
    return p / (a * a);
  } catch (e) {}
  return 0;
}
