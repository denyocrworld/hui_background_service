import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hui_background_service/state_util.dart';
import 'package:path_provider/path_provider.dart';
import '../view/demo_view.dart';
import 'dart:async';

class DemoController extends State<DemoView> implements MvcController {
  static late DemoController instance;
  late DemoView view;

  late Timer timer;
  String value = "";
  @override
  void initState() {
    instance = this;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      try {
        var path = await getTemporaryDirectory();
        final File file = File('${path.path}/data.txt');
        value = file.readAsStringSync();
        setState(() {});
      } on Exception catch (err) {
        log(err.toString());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
