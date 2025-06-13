import 'package:dio/dio.dart';

class LoginService {
  static Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await Dio().post(
        'https://story-api.dicoding.dev/v1/login',
        data: {'email': username, 'password': password},
      );

      final data = response.data as Map<String, dynamic>?;

      if (data == null || data['loginResult'] == null) {
        throw 'Login gagal: format respons tidak sesuai.';
      }

      final loginResult = data['loginResult'] as Map<String, dynamic>;

      final token = loginResult['token'] as String?;
      if (token == null || token.isEmpty) {
        throw 'Login gagal: token tidak tersedia.';
      }

      // Kamu bisa return seluruh loginResult jika perlu
      return {
        'userId': loginResult['userId'],
        'name': loginResult['name'],
        'token': token,
      };
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final respData = e.response?.data;

      String message = 'Terjadi kesalahan saat menghubungi server.';

      if (respData is Map && respData['errorMessage'] != null) {
        message = respData['errorMessage'];
      } else if (respData is Map && respData['message'] != null) {
        message = respData['message'];
      } else if (respData is String && respData.trim().isNotEmpty) {
        message = respData;
      } else if (statusCode != null) {
        message = 'Server error ($statusCode)';
      }

      throw message;
    } catch (e) {
      // cetak untuk debugging
      print('LoginService unexpected error: $e');
      throw 'Terjadi kesalahan tak terduga.';
    }
  }
}
