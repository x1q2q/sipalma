import 'package:dio/dio.dart';
import 'package:sipalma/src/utils/constants.dart';
import 'api_exception.dart';

class ApiService {
  final Dio dio;
  ApiService() : dio = Dio(BaseOptions(baseUrl: Constants.pathApi));

  Future<Response> getRequest(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response;
    } on DioException catch (e) {
      throw ApiException(e.message!, e.response!.statusCode);
    }
  }
}
