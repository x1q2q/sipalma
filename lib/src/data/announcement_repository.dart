import 'package:sipalma/src/application/api/api_exception.dart';
import 'package:sipalma/src/application/api/api_service.dart';
import 'package:sipalma/src/application/api/api_response.dart';
import 'package:sipalma/src/domain/announcement/announcement.dart';

class AnnouncementRepository {
  final ApiService _apiService;
  AnnouncementRepository(this._apiService);
  Future<ApiResponse<List<Announcement>>> getAnnouncements() async {
    try {
      final response = await _apiService.getRequest('pengumuman');
      final data = (response.data['data'] as List)
          .map((item) => Announcement.fromJson(item))
          .toList();
      return ApiResponse(data: data);
    } catch (e) {
      return ApiResponse(
          error: e is ApiException ? e : ApiException(e.toString()));
    }
  }
}
