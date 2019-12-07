import 'dart:convert';

import 'package:test_wai_kuai/Util/Web/HttpController.dart';

void main() {
  Map<String, String> req = {'phoneNum': "18396871815", 'verificationCode': "666666"};
  print(json.encode(req));
}
