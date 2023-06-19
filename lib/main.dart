import 'package:hui_background_service/module/demo/view/demo_view.dart';
import 'package:hui_background_service/state_util.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hui_background_service/service/background_service/background_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BackgroundService.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoView(),
    );
  }
}
