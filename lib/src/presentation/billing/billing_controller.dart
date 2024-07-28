import 'dart:async';
import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipalma/src/application/billing/billings_service.dart';

part 'billing_controller.g.dart';

@riverpod
class BillingController extends _$BillingController {
  @override
  FutureOr<void> build() async {}

  Future<bool> uploadImage(
      {required Map<String, dynamic> data, required File? filePhoto}) async {
    state = const AsyncValue.loading();
    final repository = ref.read(billingsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      await repository.uploadImage(data, filePhoto);
      ref.keepAlive().close();
    });
    return state.hasError;
  }
}
