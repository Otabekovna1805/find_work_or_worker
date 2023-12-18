import 'package:find_work_or_worker/app.dart';
import 'package:flutter/material.dart';
import 'core/service_locator.dart';
List idForResume = [];
List idForVacancy = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await serviceLocator();

  runApp(
    const MyApp(),
  );
}
