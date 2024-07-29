import 'dart:async';
import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipalma/src/application/billing/billings_service.dart';
import 'package:sipalma/src/application/auth/auth_service.dart';
part 'billing_controller.g.dart';

@riverpod
class BillingController extends _$BillingController {
  @override
  FutureOr<void> build() async {}

  Future<bool> uploadImage(
      {required Map<String, dynamic> data, required File? filePhoto}) async {
    final authHive = ref.read(hiveServiceProvider);
    final idUser = authHive.getActiveUser()!.idUser;
    data['id_user'] = idUser;
    state = const AsyncValue.loading();
    final repository = ref.read(billingsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      await repository.uploadImage(data, filePhoto);
    });
    return state.hasError;
  }
}
