import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/data/billing_repository.dart';
import 'api/api_service.dart';

final apiServiceProvidder = Provider((ref) => ApiService());

final billingRepoProvider =
    Provider((ref) => BillingRepository(ref.watch(apiServiceProvidder)));

final billingProvider = FutureProvider((ref) async {
  final repository = ref.watch(billingRepoProvider);
  final response = await repository.getBillings();
  if (response.success) {
    return response.data!;
  } else {
    throw response.error!;
  }
});
