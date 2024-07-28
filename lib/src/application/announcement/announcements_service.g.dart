// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcements_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiServiceHash() => r'73ad3c2e8c0d458c43bdd728c0f0fb75c5c2af98';

/// See also [apiService].
@ProviderFor(apiService)
final apiServiceProvider = AutoDisposeProvider<ApiService>.internal(
  apiService,
  name: r'apiServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ApiServiceRef = AutoDisposeProviderRef<ApiService>;
String _$announcementsRepositoryHash() =>
    r'e3c70fc2fe61a36f658dd0957b75ecbaa2ad620e';

/// See also [announcementsRepository].
@ProviderFor(announcementsRepository)
final announcementsRepositoryProvider =
    AutoDisposeProvider<AnnouncementsRepository>.internal(
  announcementsRepository,
  name: r'announcementsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$announcementsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AnnouncementsRepositoryRef
    = AutoDisposeProviderRef<AnnouncementsRepository>;
String _$fetchAnnouncementsHash() =>
    r'50c5c54b864c2180fc1a68beb26deb917c2023c2';

/// See also [fetchAnnouncements].
@ProviderFor(fetchAnnouncements)
final fetchAnnouncementsProvider =
    AutoDisposeFutureProvider<List<Announcement>>.internal(
  fetchAnnouncements,
  name: r'fetchAnnouncementsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAnnouncementsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchAnnouncementsRef
    = AutoDisposeFutureProviderRef<List<Announcement>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
