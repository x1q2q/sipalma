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
String _$searchAnnouncementHash() =>
    r'7a2b253b312621545a53b8daca1b566e0b770c8b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [searchAnnouncement].
@ProviderFor(searchAnnouncement)
const searchAnnouncementProvider = SearchAnnouncementFamily();

/// See also [searchAnnouncement].
class SearchAnnouncementFamily extends Family<AsyncValue<List<Announcement>>> {
  /// See also [searchAnnouncement].
  const SearchAnnouncementFamily();

  /// See also [searchAnnouncement].
  SearchAnnouncementProvider call({
    required String query,
  }) {
    return SearchAnnouncementProvider(
      query: query,
    );
  }

  @override
  SearchAnnouncementProvider getProviderOverride(
    covariant SearchAnnouncementProvider provider,
  ) {
    return call(
      query: provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchAnnouncementProvider';
}

/// See also [searchAnnouncement].
class SearchAnnouncementProvider
    extends AutoDisposeFutureProvider<List<Announcement>> {
  /// See also [searchAnnouncement].
  SearchAnnouncementProvider({
    required String query,
  }) : this._internal(
          (ref) => searchAnnouncement(
            ref as SearchAnnouncementRef,
            query: query,
          ),
          from: searchAnnouncementProvider,
          name: r'searchAnnouncementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchAnnouncementHash,
          dependencies: SearchAnnouncementFamily._dependencies,
          allTransitiveDependencies:
              SearchAnnouncementFamily._allTransitiveDependencies,
          query: query,
        );

  SearchAnnouncementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<Announcement>> Function(SearchAnnouncementRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchAnnouncementProvider._internal(
        (ref) => create(ref as SearchAnnouncementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Announcement>> createElement() {
    return _SearchAnnouncementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchAnnouncementProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchAnnouncementRef
    on AutoDisposeFutureProviderRef<List<Announcement>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchAnnouncementProviderElement
    extends AutoDisposeFutureProviderElement<List<Announcement>>
    with SearchAnnouncementRef {
  _SearchAnnouncementProviderElement(super.provider);

  @override
  String get query => (origin as SearchAnnouncementProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
