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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
