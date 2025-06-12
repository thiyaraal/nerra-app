import 'package:flutter/material.dart';
import 'package:narra_apps/core/constants/color_styles.dart';
import 'package:narra_apps/core/helpers/app_provider.dart';

import 'package:narra_apps/core/helpers/go_routes.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.getProviders(),
      child: MaterialApp.router(
        title: 'HCISDDRMOBILE',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: ColorStyles.white),
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: ColorStyles.white,
        ),
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
