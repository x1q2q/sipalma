import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipalma/src/application/profile/profile_service.dart';
import 'package:sipalma/src/domain/profile/profile.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<void> build() async {}

  Future<bool> updateData(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    Profile newData = Profile.fromJson(data);
    final repository = ref.read(profileRepositoryProvider);
    state = await AsyncValue.guard(() async {
      await repository.updateUser(newData);
    });
    return state.hasError;
  }

  Future<void> logout() async {
    print('telah logout');
  }
}
