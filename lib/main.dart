import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoppos/routes/app_router.gr.dart';

import 'core/constants/colors.dart';
import 'core/constants/strings.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRoute = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final MaterialColor? _blue800Swatch = MaterialColor(Colors.blue[800]!.value, blue800Map);
    return MaterialApp.router(
      title: appName,
      theme: ThemeData(
        primarySwatch: _blue800Swatch!,
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRoute.defaultRouteParser(),
      routerDelegate: _appRoute.delegate(),
    );
  }
}
