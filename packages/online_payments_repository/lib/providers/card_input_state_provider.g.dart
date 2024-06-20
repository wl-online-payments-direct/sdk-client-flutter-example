// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_input_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cardInputStateHash() => r'15ce219ce3492fa6f75e0e9aa1e0a205db42747d';
/**
 * Needs to remain alive throughout the whole app, because its input is used on multiple screens.
 * This provider is invalidated when a payment was created successfully, since then all its data should be cleared.
 */
///
/// Copied from [CardInputState].
@ProviderFor(CardInputState)
final cardInputStateProvider =
    NotifierProvider<CardInputState, CardInput>.internal(
  CardInputState.new,
  name: r'cardInputStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cardInputStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CardInputState = Notifier<CardInput>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
