import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipalma/src/application/auth/auth_service.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() async {}

  Future<void> submitLogin(String email, String password) async {
    try {
      state = const AsyncValue.loading();
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.login(email, password);
      if (response.success) {
        state = const AsyncValue.data(null);
      } else {
        state =
            AsyncValue.error('Kredensial tidak terdaftar', StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error('Server error', StackTrace.current);
    }
    ref.keepAlive().close();
  }
}
