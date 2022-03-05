import 'dart:async';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hmv_care_app/app/data/services/interfaces/authentication_service.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'app/data/services/authentication/amplify_auth_service.dart';
import 'app/data/services/authentication/api_auth_service.dart';
import 'app/features/authentication/authentication_controller.dart';

import 'app/app.dart';
// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

// Generated in previous step
import 'amplifyconfiguration.dart';
import 'core/utils/constants.dart';

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //Preserve the SplashScreen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await _configureAmplify();
  await initHive();
  await _initServices();
  await _initializeControllers();

  //Removes the SplashScreen
  FlutterNativeSplash.remove();
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR', null);
  runApp(const MyApp());
}

initHive() async {
  await Hive.initFlutter();
  await Hive.openBox(AppConfig.HIVEBOX_STORAGE);
}

_initializeControllers() {
  Get.lazyPut(() => AuthenticationController(Get.find()));
}

_initServices() async {
  print('Starting application services ...');
  /*if (GetPlatform.isMobile) {
    await Get.putAsync<IAuthenticationService>(() => AmplifyAuthService().init());
  } else {
    await Get.putAsync<IAuthenticationService>(() => ApiAuthService().init());
  }*/
  await Get.putAsync<IAuthenticationService>(() => ApiAuthService().init());
  print('All services started...');
}

_configureAmplify() async {
  if (GetPlatform.isMobile) {
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    //AmplifyDataStore datastorePlugin = AmplifyDataStore(modelProvider: AmplifyModelProvider.instance);

    await Amplify.addPlugins([authPlugin]);
    try {
      await Amplify.configure(amplifyconfig);
      print('Amplify started...');
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }
}
