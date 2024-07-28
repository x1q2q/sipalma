import 'package:sipalma/src/application/api/api_exception.dart';
import 'package:sipalma/src/application/api/api_service.dart';
import 'package:sipalma/src/domain/payment/payment.dart';
import 'api_response.dart';

class PaymentsRepository {
  final ApiService _apiService;
  PaymentsRepository(this._apiService);
  Future<ApiResponse<List<Payment>>> getPayments(int userId) async {
    try {
      final response = await _apiService.getRequest('pembayaran/$userId');
      final data = (response.data['data'] as List)
          .map((item) => Payment.fromJson(item))
          .toList();
      return ApiResponse(data: data);
    } catch (e) {
      return ApiResponse(
          error: e is ApiException ? e : ApiException(e.toString()));
    }
  }
}
