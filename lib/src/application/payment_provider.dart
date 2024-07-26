import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/data/payments_repository.dart';
import 'package:sipalma/src/domain/payment/payment.dart';
import 'api/api_service.dart';

final apiServiceProvidder = Provider((ref) => ApiService());

final paymentRepoProvider =
    Provider((ref) => PaymentsRepository(ref.watch(apiServiceProvidder)));

final paymentProvider =
    FutureProvider.family<List<Payment>, String>((ref, userId) async {
  final repository = ref.watch(paymentRepoProvider);
  final response = await repository.getPayments(userId);
  if (response.success) {
    return response.data!;
  } else {
    throw response.error!;
  }
});
