import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sipalma/src/utils/constants.dart';
import 'package:http_parser/http_parser.dart';
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

  Future<Response> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw ApiException(e.message!, e.response!.statusCode);
    }
  }

  Future<Response> putRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.put(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw ApiException(e.message!, e.response!.statusCode);
    }
  }

  Future<Response> uploadRequest(
      String endpoint, Map<String, dynamic> objData, File filePhoto) async {
    try {
      String fileName = filePhoto.path.split('/').last;
      var fileExt = fileName.split('.').last;
      Map<String, dynamic> imgData = {
        'file': await MultipartFile.fromFile(filePhoto.path,
            filename: fileName, contentType: MediaType("image", fileExt))
      };

      FormData formData = FormData.fromMap({...objData, ...imgData});

      final response = await dio.post(endpoint, data: formData);
      return response;
    } on DioException catch (e) {
      throw ApiException(e.message!, e.response!.statusCode);
    }
  }
}
