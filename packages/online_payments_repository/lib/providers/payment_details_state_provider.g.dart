// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentDetailsStateHash() =>
    r'5d35d30a6c14522222116b507e8627c740a6d000';
/**
 * Since this provider is used on the initial screen, it does not require the keepAlive identifier, since it will be alive anyway.
 * This provider is never invalidated, so it remembers the input for a next payment.
 */
///
/// Copied from [PaymentDetailsState].
@ProviderFor(PaymentDetailsState)
final paymentDetailsStateProvider =
    AutoDisposeNotifierProvider<PaymentDetailsState, PaymentDetails>.internal(
  PaymentDetailsState.new,
  name: r'paymentDetailsStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentDetailsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaymentDetailsState = AutoDisposeNotifier<PaymentDetails>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
