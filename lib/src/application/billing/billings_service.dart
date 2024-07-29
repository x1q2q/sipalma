import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipalma/src/data/billings_repository.dart';
import 'package:sipalma/src/domain/billing/billing.dart';
import 'package:sipalma/src/application/api/api_service.dart';

part 'billings_service.g.dart';

@riverpod
ApiService apiService(ApiServiceRef ref) => ApiService();

@riverpod
BillingsRepository billingsRepository(BillingsRepositoryRef ref) =>
    BillingsRepository(ref.watch(apiServiceProvider));

@riverpod
Future<List<Billing>> fetchBillings(FetchBillingsRef ref) async {
  final repository = ref.watch(billingsRepositoryProvider);
  final response = await repository.getBillings();
  if (response.success) {
    return response.data!;
  } else {
    throw response.error!;
  }
}

@riverpod
Future<List<Billing>> searchBilling(SearchBillingRef ref,
    {required String query}) async {
  final repository = ref.watch(billingsRepositoryProvider);
  final response = await repository.searchBilling(query);
  print(query);
  if (response.success) {
    return response.data!;
  } else {
    throw response.error!;
  }
}
