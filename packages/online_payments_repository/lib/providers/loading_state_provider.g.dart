// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadingStateHash() => r'1ac1399df2fd5bd9a991ae74104ab9dc4beff18c';
/**
 * Needs to remain alive throughout the whole app, because its input is used on multiple screens.
 * This provider is invalidated when a payment was created successfully, since then all its data should be cleared.
 */
///
/// Copied from [LoadingState].
@ProviderFor(LoadingState)
final loadingStateProvider =
    NotifierProvider<LoadingState, LoadingTracker>.internal(
  LoadingState.new,
  name: r'loadingStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loadingStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoadingState = Notifier<LoadingTracker>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
