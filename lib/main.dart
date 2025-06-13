import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:narra_apps/core/constants/color_styles.dart';

import 'package:narra_apps/core/helpers/go_routes.dart';
import 'package:narra_apps/core/utils/shared_prefrences.dart';
import 'package:narra_apps/features/auth/login/cubit/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  await SharedPrefsHelper.init(prefs);

  final authCubit = AuthCubit(SharedPrefsHelper.prefsInstance);

  runApp(BlocProvider.value(value: authCubit, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: buildAppRouter(context),
      title: 'HCISDDRMOBILE',
      theme: ThemeData(
        
        appBarTheme: const AppBarTheme(backgroundColor: ColorStyles.white),
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ColorStyles.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
