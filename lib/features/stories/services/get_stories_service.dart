import 'package:dio/dio.dart';
import 'package:narra_apps/core/utils/shared_prefrences.dart';
import 'package:narra_apps/features/stories/models/all_stories_model.dart';

class GetStoriesService {
  static final Dio _dio = Dio(BaseOptions(baseUrl: 'https://story-api.dicoding.dev/v1'));

  static Future<List<ListStory>> fetchAllStories() async {
    final token = await SharedPrefsHelper.getToken();
    if (token == null) throw 'UNAUTHENTICATED';

    try {
      final resp = await _dio.get(
        '/stories',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (resp.statusCode == 200 && resp.data is Map<String, dynamic>) {
        final allStories = AllStoriesModel.fromJson(resp.data);
  
        return allStories.listStory ?? <ListStory>[];
      } else {
        throw 'Failed to load stories (status ${resp.statusCode})';
      }
    } on DioException catch (e) {
      final isNetworkError = e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.badResponse ||
          (e.message?.contains("SocketException") ?? false) ||
          (e.message?.contains("Failed host lookup") ?? false);
      if (isNetworkError) {
        throw 'BAD_NETWORK';
      }
      final msg = e.response?.data is Map
          ? (e.response!.data['message'] ?? e.response!.data['errorMessage'])
          : e.message;
      throw msg ?? 'Failed to load stories: ${e.response?.statusMessage}';
    } catch (e) {
      print('GetStoriesService unexpected error: $e');
      throw 'Failed to load stories: $e';
    }
  }
}