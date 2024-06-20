// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encrypted_payment_request_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$encryptedPaymentRequestStateHash() =>
    r'f472c6a8582bd145b68a2b2d825acfc8c8a0b54e';
/**
 * This provider is invalidated automatically once you return to start after creating a payment and when navigating back from the Payment Products Overview.
 */
///
/// Copied from [EncryptedPaymentRequestState].
@ProviderFor(EncryptedPaymentRequestState)
final encryptedPaymentRequestStateProvider = AutoDisposeNotifierProvider<
    EncryptedPaymentRequestState, Result<PreparedPaymentRequest>>.internal(
  EncryptedPaymentRequestState.new,
  name: r'encryptedPaymentRequestStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$encryptedPaymentRequestStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EncryptedPaymentRequestState
    = AutoDisposeNotifier<Result<PreparedPaymentRequest>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
