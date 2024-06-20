// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentDetails {
  PaymentContext get paymentContext => throw _privateConstructorUsedError;
  bool get applePayEnabled => throw _privateConstructorUsedError;
  bool get googlePayEnabled => throw _privateConstructorUsedError;
  String? get merchantId => throw _privateConstructorUsedError;
  String? get merchantName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentDetailsCopyWith<PaymentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailsCopyWith<$Res> {
  factory $PaymentDetailsCopyWith(
          PaymentDetails value, $Res Function(PaymentDetails) then) =
      _$PaymentDetailsCopyWithImpl<$Res, PaymentDetails>;
  @useResult
  $Res call(
      {PaymentContext paymentContext,
      bool applePayEnabled,
      bool googlePayEnabled,
      String? merchantId,
      String? merchantName});
}

/// @nodoc
class _$PaymentDetailsCopyWithImpl<$Res, $Val extends PaymentDetails>
    implements $PaymentDetailsCopyWith<$Res> {
  _$PaymentDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentContext = null,
    Object? applePayEnabled = null,
    Object? googlePayEnabled = null,
    Object? merchantId = freezed,
    Object? merchantName = freezed,
  }) {
    return _then(_value.copyWith(
      paymentContext: null == paymentContext
          ? _value.paymentContext
          : paymentContext // ignore: cast_nullable_to_non_nullable
              as PaymentContext,
      applePayEnabled: null == applePayEnabled
          ? _value.applePayEnabled
          : applePayEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      googlePayEnabled: null == googlePayEnabled
          ? _value.googlePayEnabled
          : googlePayEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      merchantId: freezed == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantName: freezed == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentDetailsImplCopyWith<$Res>
    implements $PaymentDetailsCopyWith<$Res> {
  factory _$$PaymentDetailsImplCopyWith(_$PaymentDetailsImpl value,
          $Res Function(_$PaymentDetailsImpl) then) =
      __$$PaymentDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentContext paymentContext,
      bool applePayEnabled,
      bool googlePayEnabled,
      String? merchantId,
      String? merchantName});
}

/// @nodoc
class __$$PaymentDetailsImplCopyWithImpl<$Res>
    extends _$PaymentDetailsCopyWithImpl<$Res, _$PaymentDetailsImpl>
    implements _$$PaymentDetailsImplCopyWith<$Res> {
  __$$PaymentDetailsImplCopyWithImpl(
      _$PaymentDetailsImpl _value, $Res Function(_$PaymentDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentContext = null,
    Object? applePayEnabled = null,
    Object? googlePayEnabled = null,
    Object? merchantId = freezed,
    Object? merchantName = freezed,
  }) {
    return _then(_$PaymentDetailsImpl(
      paymentContext: null == paymentContext
          ? _value.paymentContext
          : paymentContext // ignore: cast_nullable_to_non_nullable
              as PaymentContext,
      applePayEnabled: null == applePayEnabled
          ? _value.applePayEnabled
          : applePayEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      googlePayEnabled: null == googlePayEnabled
          ? _value.googlePayEnabled
          : googlePayEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      merchantId: freezed == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantName: freezed == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PaymentDetailsImpl implements _PaymentDetails {
  _$PaymentDetailsImpl(
      {required this.paymentContext,
      this.applePayEnabled = false,
      this.googlePayEnabled = false,
      this.merchantId,
      this.merchantName});

  @override
  final PaymentContext paymentContext;
  @override
  @JsonKey()
  final bool applePayEnabled;
  @override
  @JsonKey()
  final bool googlePayEnabled;
  @override
  final String? merchantId;
  @override
  final String? merchantName;

  @override
  String toString() {
    return 'PaymentDetails(paymentContext: $paymentContext, applePayEnabled: $applePayEnabled, googlePayEnabled: $googlePayEnabled, merchantId: $merchantId, merchantName: $merchantName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDetailsImpl &&
            (identical(other.paymentContext, paymentContext) ||
                other.paymentContext == paymentContext) &&
            (identical(other.applePayEnabled, applePayEnabled) ||
                other.applePayEnabled == applePayEnabled) &&
            (identical(other.googlePayEnabled, googlePayEnabled) ||
                other.googlePayEnabled == googlePayEnabled) &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentContext, applePayEnabled,
      googlePayEnabled, merchantId, merchantName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDetailsImplCopyWith<_$PaymentDetailsImpl> get copyWith =>
      __$$PaymentDetailsImplCopyWithImpl<_$PaymentDetailsImpl>(
          this, _$identity);
}

abstract class _PaymentDetails implements PaymentDetails {
  factory _PaymentDetails(
      {required final PaymentContext paymentContext,
      final bool applePayEnabled,
      final bool googlePayEnabled,
      final String? merchantId,
      final String? merchantName}) = _$PaymentDetailsImpl;

  @override
  PaymentContext get paymentContext;
  @override
  bool get applePayEnabled;
  @override
  bool get googlePayEnabled;
  @override
  String? get merchantId;
  @override
  String? get merchantName;
  @override
  @JsonKey(ignore: true)
  _$$PaymentDetailsImplCopyWith<_$PaymentDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
