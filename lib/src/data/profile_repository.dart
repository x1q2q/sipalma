import 'package:sipalma/src/application/api/api_exception.dart';
import 'package:sipalma/src/application/api/api_service.dart';
import 'package:sipalma/src/domain/profile/profile.dart';
import 'api_response.dart';

class ProfileRepository {
  final ApiService _apiService;
  ProfileRepository(this._apiService);
  Future<ApiResponse<Profile>> getUser(int userId) async {
    try {
      final response = await _apiService.getRequest('auth/profil/$userId');
      final data = Profile.fromJson(response.data['data'][0]);
      return ApiResponse(data: data);
    } catch (e) {
      return ApiResponse(
          error: e is ApiException ? e : ApiException(e.toString()));
    }
  }

  Future<ApiResponse<Profile>> updateUser(Profile item) async {
    try {
      Map<String, dynamic> newData = {
        'id': item.id,
        'name': item.name,
        'email': item.email,
        'address': item.address,
        'password': item.password
      };
      final response = await _apiService.putRequest('auth/update', newData);
      final data = Profile.fromJson(response.data['data'][0]);
      return ApiResponse(data: data);
    } catch (e) {
      throw Exception('server error 400');
    }
  }
}
