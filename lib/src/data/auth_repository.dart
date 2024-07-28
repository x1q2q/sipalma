import 'package:sipalma/src/application/api/api_exception.dart';
import 'package:sipalma/src/application/api/api_service.dart';
import 'package:sipalma/src/domain/profile/profile.dart';
import 'api_response.dart';

class AuthRepository {
  final ApiService _apiService;
  AuthRepository(this._apiService);
  Future<ApiResponse<Profile>> login(String email, String password) async {
    try {
      Map<String, dynamic> newData = {'email': email, 'password': password};
      final response = await _apiService.postRequest('auth/login', newData);
      final data = Profile.fromJson(response.data['data']);
      return ApiResponse(data: data);
    } catch (e) {
      return ApiResponse(
          error: e is ApiException ? e : ApiException(e.toString()));
    }
  }
}
