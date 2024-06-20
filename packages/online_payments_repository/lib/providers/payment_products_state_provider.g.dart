// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_products_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentProductsStateHash() =>
    r'dd77502698f98f3cc8efe569bee6dca5e01c314e';
/**
 * Since this provider is used on the initial screen, it does not require the keepAlive identifier, since it will be alive anyway.
 * This provider is invalidated when a payment was created successfully, since then all its data should be cleared.
 */
///
/// Copied from [PaymentProductsState].
@ProviderFor(PaymentProductsState)
final paymentProductsStateProvider = AutoDisposeNotifierProvider<
    PaymentProductsState, Result<BasicPaymentProducts>>.internal(
  PaymentProductsState.new,
  name: r'paymentProductsStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentProductsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaymentProductsState
    = AutoDisposeNotifier<Result<BasicPaymentProducts>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
