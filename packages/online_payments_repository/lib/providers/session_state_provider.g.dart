// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sessionStateHash() => r'1157ae26417b3ff5bb39937d1f1b6da70251e98c';
/**
 * Needs to remain alive throughout the app, because its input is needed when making API calls.
 * This provider is invalidated when a payment was created successfully, since then all its data should be cleared.
 */
///
/// Copied from [SessionState].
@ProviderFor(SessionState)
final sessionStateProvider = NotifierProvider<SessionState, Session?>.internal(
  SessionState.new,
  name: r'sessionStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sessionStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SessionState = Notifier<Session?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
