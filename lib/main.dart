import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/common/utils/static_values.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

part 'init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  try {
    await setupDependency(true);
    runApp(
      RootRestorationScope(restorationId: 'root', child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Form Stepper",
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    )
    );
  } catch (e, stackTrace) {
    debugPrint('Error: $e');
    debugPrint('Stack Trace: $stackTrace');
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Form Stepper",
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    );
  }
}