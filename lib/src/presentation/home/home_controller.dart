import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipalma/src/application/auth/auth_service.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<void> build() async {}

  String getActiveUser() {
    final authHive = ref.read(hiveServiceProvider);
    return authHive.getActiveUser()!.name;
  }
}
