// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_service.dart';

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
String _$paymentsRepositoryHash() =>
    r'620c093e685dc44edc832f301813e11a089fc029';

/// See also [paymentsRepository].
@ProviderFor(paymentsRepository)
final paymentsRepositoryProvider =
    AutoDisposeProvider<PaymentsRepository>.internal(
  paymentsRepository,
  name: r'paymentsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PaymentsRepositoryRef = AutoDisposeProviderRef<PaymentsRepository>;
String _$fetchPaymentsHash() => r'04bcadd1cba78003a99aee2e8e0220cdc76326ad';

/// See also [fetchPayments].
@ProviderFor(fetchPayments)
final fetchPaymentsProvider = AutoDisposeFutureProvider<List<Payment>>.internal(
  fetchPayments,
  name: r'fetchPaymentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchPaymentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchPaymentsRef = AutoDisposeFutureProviderRef<List<Payment>>;
String _$searchPaymentHash() => r'f207797cbb94fac6d22392d5065866dbbd6c25bb';

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

/// See also [searchPayment].
@ProviderFor(searchPayment)
const searchPaymentProvider = SearchPaymentFamily();

/// See also [searchPayment].
class SearchPaymentFamily extends Family<AsyncValue<List<Payment>>> {
  /// See also [searchPayment].
  const SearchPaymentFamily();

  /// See also [searchPayment].
  SearchPaymentProvider call({
    required String query,
  }) {
    return SearchPaymentProvider(
      query: query,
    );
  }

  @override
  SearchPaymentProvider getProviderOverride(
    covariant SearchPaymentProvider provider,
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
  String? get name => r'searchPaymentProvider';
}

/// See also [searchPayment].
class SearchPaymentProvider extends AutoDisposeFutureProvider<List<Payment>> {
  /// See also [searchPayment].
  SearchPaymentProvider({
    required String query,
  }) : this._internal(
          (ref) => searchPayment(
            ref as SearchPaymentRef,
            query: query,
          ),
          from: searchPaymentProvider,
          name: r'searchPaymentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchPaymentHash,
          dependencies: SearchPaymentFamily._dependencies,
          allTransitiveDependencies:
              SearchPaymentFamily._allTransitiveDependencies,
          query: query,
        );

  SearchPaymentProvider._internal(
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
    FutureOr<List<Payment>> Function(SearchPaymentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchPaymentProvider._internal(
        (ref) => create(ref as SearchPaymentRef),
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
  AutoDisposeFutureProviderElement<List<Payment>> createElement() {
    return _SearchPaymentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchPaymentProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchPaymentRef on AutoDisposeFutureProviderRef<List<Payment>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchPaymentProviderElement
    extends AutoDisposeFutureProviderElement<List<Payment>>
    with SearchPaymentRef {
  _SearchPaymentProviderElement(super.provider);

  @override
  String get query => (origin as SearchPaymentProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
