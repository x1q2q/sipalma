// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billings_service.dart';

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
String _$billingsRepositoryHash() =>
    r'17d62f58747ca505dd56fa05c73fd9f49217180f';

/// See also [billingsRepository].
@ProviderFor(billingsRepository)
final billingsRepositoryProvider =
    AutoDisposeProvider<BillingsRepository>.internal(
  billingsRepository,
  name: r'billingsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$billingsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BillingsRepositoryRef = AutoDisposeProviderRef<BillingsRepository>;
String _$fetchBillingsHash() => r'b37d37dca6ffd69f195a1b538c3437353df461b0';

/// See also [fetchBillings].
@ProviderFor(fetchBillings)
final fetchBillingsProvider = AutoDisposeFutureProvider<List<Billing>>.internal(
  fetchBillings,
  name: r'fetchBillingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchBillingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchBillingsRef = AutoDisposeFutureProviderRef<List<Billing>>;
String _$searchBillingHash() => r'368dad765895f5cfef549cfd8e8a923b3d46927d';

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

/// See also [searchBilling].
@ProviderFor(searchBilling)
const searchBillingProvider = SearchBillingFamily();

/// See also [searchBilling].
class SearchBillingFamily extends Family<AsyncValue<List<Billing>>> {
  /// See also [searchBilling].
  const SearchBillingFamily();

  /// See also [searchBilling].
  SearchBillingProvider call({
    required String query,
  }) {
    return SearchBillingProvider(
      query: query,
    );
  }

  @override
  SearchBillingProvider getProviderOverride(
    covariant SearchBillingProvider provider,
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
  String? get name => r'searchBillingProvider';
}

/// See also [searchBilling].
class SearchBillingProvider extends AutoDisposeFutureProvider<List<Billing>> {
  /// See also [searchBilling].
  SearchBillingProvider({
    required String query,
  }) : this._internal(
          (ref) => searchBilling(
            ref as SearchBillingRef,
            query: query,
          ),
          from: searchBillingProvider,
          name: r'searchBillingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchBillingHash,
          dependencies: SearchBillingFamily._dependencies,
          allTransitiveDependencies:
              SearchBillingFamily._allTransitiveDependencies,
          query: query,
        );

  SearchBillingProvider._internal(
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
    FutureOr<List<Billing>> Function(SearchBillingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchBillingProvider._internal(
        (ref) => create(ref as SearchBillingRef),
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
  AutoDisposeFutureProviderElement<List<Billing>> createElement() {
    return _SearchBillingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchBillingProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchBillingRef on AutoDisposeFutureProviderRef<List<Billing>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchBillingProviderElement
    extends AutoDisposeFutureProviderElement<List<Billing>>
    with SearchBillingRef {
  _SearchBillingProviderElement(super.provider);

  @override
  String get query => (origin as SearchBillingProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
