import 'dart:io';
import 'package:sipalma/src/application/api/api_exception.dart';
import 'package:sipalma/src/application/api/api_service.dart';
import 'package:sipalma/src/domain/billing/billing.dart';
import 'api_response.dart';

class BillingsRepository {
  final ApiService _apiService;
  BillingsRepository(this._apiService);
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

  Future<ApiResponse<Billing>> uploadImage(
      Map<String, dynamic> obj, File? filePhoto) async {
    try {
      Map<String, dynamic> objData = {
        'id_user': obj['id_user'],
        'id_tagihan': obj['id_tagihan'],
        'nominal': obj['nominal']
      };
      final response = await _apiService.uploadRequest(
          'pembayaran/upload_bukti', objData, filePhoto!);
      final data = Billing.fromJson(response.data['data'][0]);
      if (response.statusCode != 201) {
        throw 'server internal error 500';
      }
      return ApiResponse(data: data);
    } catch (e) {
      throw Exception('server error 400');
    }
  }
}
