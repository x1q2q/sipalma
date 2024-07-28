import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sipalma/src/data/announcements_repository.dart';
import 'package:sipalma/src/domain/announcement/announcement.dart';
import 'package:sipalma/src/application/api/api_service.dart';

part 'announcements_service.g.dart';

@riverpod
ApiService apiService(ApiServiceRef ref) => ApiService();

@riverpod
AnnouncementsRepository announcementsRepository(
        AnnouncementsRepositoryRef ref) =>
    AnnouncementsRepository(ref.watch(apiServiceProvider));

@riverpod
Future<List<Announcement>> fetchAnnouncements(FetchAnnouncementsRef ref) async {
  final repository = ref.watch(announcementsRepositoryProvider);
  final response = await repository.getAnnouncements();
  if (response.success) {
    return response.data!;
  } else {
    throw response.error!;
  }
}
