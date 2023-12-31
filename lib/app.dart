import 'package:find_work_or_worker/pages/home_page.dart';
import 'package:find_work_or_worker/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: mode,
        child: ScreenUtilInit(child: userRepository.readEmail() != null ? const HomePage() : IntroPage()),
        builder: (_, mode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: mode,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            home: child,
          );
        }
    );

  }
}
