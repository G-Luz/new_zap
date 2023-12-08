import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_zap/modules/user_settings/user_settings_module.dart';
 
void main() {

  setUpAll(() {
    initModule(UserSettingsModule());
  });
}