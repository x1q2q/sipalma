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
String _$fetchPaymentsHash() => r'964bd2f0c05291daa1a44605989c3baadea1b729';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
