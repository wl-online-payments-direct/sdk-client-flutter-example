// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionDetails _$SessionDetailsFromJson(Map<String, dynamic> json) {
  return _SessionDetails.fromJson(json);
}

/// @nodoc
mixin _$SessionDetails {
  String? get assetUrl => throw _privateConstructorUsedError;
  String? get clientApiUrl => throw _privateConstructorUsedError;
  String? get clientSessionId => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  bool get enableLogging => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionDetailsCopyWith<SessionDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDetailsCopyWith<$Res> {
  factory $SessionDetailsCopyWith(
          SessionDetails value, $Res Function(SessionDetails) then) =
      _$SessionDetailsCopyWithImpl<$Res, SessionDetails>;
  @useResult
  $Res call(
      {String? assetUrl,
      String? clientApiUrl,
      String? clientSessionId,
      String? customerId,
      bool enableLogging});
}

/// @nodoc
class _$SessionDetailsCopyWithImpl<$Res, $Val extends SessionDetails>
    implements $SessionDetailsCopyWith<$Res> {
  _$SessionDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetUrl = freezed,
    Object? clientApiUrl = freezed,
    Object? clientSessionId = freezed,
    Object? customerId = freezed,
    Object? enableLogging = null,
  }) {
    return _then(_value.copyWith(
      assetUrl: freezed == assetUrl
          ? _value.assetUrl
          : assetUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      clientApiUrl: freezed == clientApiUrl
          ? _value.clientApiUrl
          : clientApiUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      clientSessionId: freezed == clientSessionId
          ? _value.clientSessionId
          : clientSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      enableLogging: null == enableLogging
          ? _value.enableLogging
          : enableLogging // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionDetailsImplCopyWith<$Res>
    implements $SessionDetailsCopyWith<$Res> {
  factory _$$SessionDetailsImplCopyWith(_$SessionDetailsImpl value,
          $Res Function(_$SessionDetailsImpl) then) =
      __$$SessionDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? assetUrl,
      String? clientApiUrl,
      String? clientSessionId,
      String? customerId,
      bool enableLogging});
}

/// @nodoc
class __$$SessionDetailsImplCopyWithImpl<$Res>
    extends _$SessionDetailsCopyWithImpl<$Res, _$SessionDetailsImpl>
    implements _$$SessionDetailsImplCopyWith<$Res> {
  __$$SessionDetailsImplCopyWithImpl(
      _$SessionDetailsImpl _value, $Res Function(_$SessionDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetUrl = freezed,
    Object? clientApiUrl = freezed,
    Object? clientSessionId = freezed,
    Object? customerId = freezed,
    Object? enableLogging = null,
  }) {
    return _then(_$SessionDetailsImpl(
      assetUrl: freezed == assetUrl
          ? _value.assetUrl
          : assetUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      clientApiUrl: freezed == clientApiUrl
          ? _value.clientApiUrl
          : clientApiUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      clientSessionId: freezed == clientSessionId
          ? _value.clientSessionId
          : clientSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      enableLogging: null == enableLogging
          ? _value.enableLogging
          : enableLogging // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionDetailsImpl implements _SessionDetails {
  const _$SessionDetailsImpl(
      {this.assetUrl,
      this.clientApiUrl,
      this.clientSessionId,
      this.customerId,
      this.enableLogging = false});

  factory _$SessionDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionDetailsImplFromJson(json);

  @override
  final String? assetUrl;
  @override
  final String? clientApiUrl;
  @override
  final String? clientSessionId;
  @override
  final String? customerId;
  @override
  @JsonKey()
  final bool enableLogging;

  @override
  String toString() {
    return 'SessionDetails(assetUrl: $assetUrl, clientApiUrl: $clientApiUrl, clientSessionId: $clientSessionId, customerId: $customerId, enableLogging: $enableLogging)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDetailsImpl &&
            (identical(other.assetUrl, assetUrl) ||
                other.assetUrl == assetUrl) &&
            (identical(other.clientApiUrl, clientApiUrl) ||
                other.clientApiUrl == clientApiUrl) &&
            (identical(other.clientSessionId, clientSessionId) ||
                other.clientSessionId == clientSessionId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.enableLogging, enableLogging) ||
                other.enableLogging == enableLogging));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, assetUrl, clientApiUrl,
      clientSessionId, customerId, enableLogging);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionDetailsImplCopyWith<_$SessionDetailsImpl> get copyWith =>
      __$$SessionDetailsImplCopyWithImpl<_$SessionDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionDetailsImplToJson(
      this,
    );
  }
}

abstract class _SessionDetails implements SessionDetails {
  const factory _SessionDetails(
      {final String? assetUrl,
      final String? clientApiUrl,
      final String? clientSessionId,
      final String? customerId,
      final bool enableLogging}) = _$SessionDetailsImpl;

  factory _SessionDetails.fromJson(Map<String, dynamic> json) =
      _$SessionDetailsImpl.fromJson;

  @override
  String? get assetUrl;
  @override
  String? get clientApiUrl;
  @override
  String? get clientSessionId;
  @override
  String? get customerId;
  @override
  bool get enableLogging;
  @override
  @JsonKey(ignore: true)
  _$$SessionDetailsImplCopyWith<_$SessionDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
