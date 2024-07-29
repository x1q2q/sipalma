import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipalma/src/data/profile_repository.dart';
import 'package:sipalma/src/domain/profile/profile.dart';
import 'package:sipalma/src/application/auth/auth_service.dart';
import 'package:sipalma/src/application/api/api_service.dart';

part 'profile_service.g.dart';

@riverpod
ApiService apiService(ApiServiceRef ref) => ApiService();

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) =>
    ProfileRepository(ref.watch(apiServiceProvider));

@riverpod
Future<Profile> fetchProfile(FetchProfileRef ref) async {
  final authHive = ref.read(hiveServiceProvider);
  final idUser = authHive.getActiveUser()!.idUser;
  final repository = ref.watch(profileRepositoryProvider);
  final response = await repository.getUser(idUser);
  if (response.success) {
    return response.data!;
  } else {
    throw response.error!;
  }
}
