import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/data/announcement_repository.dart';
import 'api/api_service.dart';

final apiServiceProvidder = Provider((ref) => ApiService());

final announcementRepoProvider =
    Provider((ref) => AnnouncementRepository(ref.watch(apiServiceProvidder)));

final announcementProvider = FutureProvider((ref) async {
  final repository = ref.watch(announcementRepoProvider);
  final response = await repository.getAnnouncements();
  if (response.success) {
    return response.data!;
  } else {
    throw response.error!;
  }
});
