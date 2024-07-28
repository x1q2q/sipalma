import 'package:sipalma/src/application/api/api_exception.dart';

class ApiResponse<T> {
  final T? data;
  final ApiException? error;
  ApiResponse({this.data, this.error});
  bool get success => error == null;
}
