import 'package:sipalma/src/application/api/api_exception.dart';
import 'package:sipalma/src/application/api/api_service.dart';
import 'package:sipalma/src/application/api/api_response.dart';
import 'package:sipalma/src/domain/billing/billing.dart';

class BillingRepository {
  final ApiService _apiService;
  BillingRepository(this._apiService);
  Future<ApiResponse<List<Billing>>> getBillings() async {
    try {
      final response = await _apiService.getRequest('tagihan');
      final data = (response.data['data'] as List)
          .map((item) => Billing.fromJson(item))
          .toList();
      return ApiResponse(data: data);
    } catch (e) {
      return ApiResponse(
          error: e is ApiException ? e : ApiException(e.toString()));
    }
  }
}
