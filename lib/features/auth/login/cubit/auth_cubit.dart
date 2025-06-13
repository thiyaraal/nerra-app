import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<bool>{
  static const _kLoggIN = 'is_logged_in';
  final SharedPreferences _prefs;

  AuthCubit(this._prefs) : super(_prefs.getBool(_kLoggIN) ?? false);

  Future<void> login() async {
    await _prefs.setBool(_kLoggIN, true);
    emit(true);
  }
  Future<void> logout() async {
    await _prefs.setBool(_kLoggIN, false);
    emit(false);
  }
  
}