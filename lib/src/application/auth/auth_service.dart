import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipalma/src/data/auth_repository.dart';
import 'package:sipalma/src/application/api/api_service.dart';
import 'package:sipalma/src/application/hive/hive_service.dart';

part 'auth_service.g.dart';

@riverpod
ApiService apiService(ApiServiceRef ref) => ApiService();

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(ref.watch(apiServiceProvider));

@riverpod
HiveService hiveService(HiveServiceRef ref) => HiveService();
