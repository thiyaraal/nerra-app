import 'package:dio/dio.dart';

class RegisterService {
  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await Dio().post(
        'https://story-api.dicoding.dev/v1/register',
        data: {'name': name, 'email': email, 'password': password},
      );

      final data = response.data as Map<String, dynamic>?;

      if (data == null || data['registerResult'] == null) {
        throw 'Register gagal: format respons tidak sesuai.';
      }

      final registerResult = data['registerResult'] as Map<String, dynamic>;

      final userId = registerResult['userId'] as String?;
      if (userId == null || userId.isEmpty) {
        throw 'Register gagal: userId tidak tersedia.';
      }

      return {
        'userId': userId,
        'name': registerResult['name'],
        'email': registerResult['email'],
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
      print('RegisterService unexpected error: $e');
      throw 'Terjadi kesalahan tak terduga.';
    }
  }
}