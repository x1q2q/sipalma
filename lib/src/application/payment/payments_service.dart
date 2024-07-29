import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipalma/src/data/payments_repository.dart';
import 'package:sipalma/src/domain/payment/payment.dart';
import 'package:sipalma/src/application/auth/auth_service.dart';
import 'package:sipalma/src/application/api/api_service.dart';

part 'payments_service.g.dart';

@riverpod
ApiService apiService(ApiServiceRef ref) => ApiService();

@riverpod
PaymentsRepository paymentsRepository(PaymentsRepositoryRef ref) =>
    PaymentsRepository(ref.watch(apiServiceProvider));

@riverpod
Future<List<Payment>> fetchPayments(FetchPaymentsRef ref) async {
  final authHive = ref.read(hiveServiceProvider);
  final idUser = authHive.getActiveUser()!.idUser;
  final repository = ref.watch(paymentsRepositoryProvider);
  final response = await repository.getPayments(idUser);
  if (response.success) {
    return response.data!;
  } else {
    throw response.error!;
  }
}

@riverpod
Future<List<Payment>> searchPayment(SearchPaymentRef ref,
    {required String query}) async {
  final authHive = ref.read(hiveServiceProvider);
  final idUser = authHive.getActiveUser()!.idUser;
  final repository = ref.watch(paymentsRepositoryProvider);
  final response = await repository.searchPayment(idUser, query);
  if (response.success) {
    return response.data!;
  } else {
    throw response.error!;
  }
}
