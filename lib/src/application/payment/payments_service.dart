import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipalma/src/data/payments_repository.dart';
import 'package:sipalma/src/domain/payment/payment.dart';
import 'package:sipalma/src/application/api/api_service.dart';

part 'payments_service.g.dart';

@riverpod
ApiService apiService(ApiServiceRef ref) => ApiService();

@riverpod
PaymentsRepository paymentsRepository(PaymentsRepositoryRef ref) =>
    PaymentsRepository(ref.watch(apiServiceProvider));

@riverpod
Future<List<Payment>> fetchPayments(FetchPaymentsRef ref) async {
  final repository = ref.watch(paymentsRepositoryProvider);
  int userId = 11;
  final response = await repository.getPayments(userId);
  if (response.success) {
    return response.data!;
  } else {
    throw response.error!;
  }
}
