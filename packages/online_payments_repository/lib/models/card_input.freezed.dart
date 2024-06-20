// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CardInput {
  Result<PaymentProduct> get paymentProductResult =>
      throw _privateConstructorUsedError;
  AccountOnFile? get accountOnFile => throw _privateConstructorUsedError;
  Map<String, String> get fieldsInput => throw _privateConstructorUsedError;
  Map<String, List<String>?> get validationErrorMessages =>
      throw _privateConstructorUsedError;
  bool get liveValidationEnabled => throw _privateConstructorUsedError;
  bool get rememberPaymentDetails => throw _privateConstructorUsedError;
  String? get lastRequestedIin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardInputCopyWith<CardInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardInputCopyWith<$Res> {
  factory $CardInputCopyWith(CardInput value, $Res Function(CardInput) then) =
      _$CardInputCopyWithImpl<$Res, CardInput>;
  @useResult
  $Res call(
      {Result<PaymentProduct> paymentProductResult,
      AccountOnFile? accountOnFile,
      Map<String, String> fieldsInput,
      Map<String, List<String>?> validationErrorMessages,
      bool liveValidationEnabled,
      bool rememberPaymentDetails,
      String? lastRequestedIin});

  $ResultCopyWith<PaymentProduct, $Res> get paymentProductResult;
}

/// @nodoc
class _$CardInputCopyWithImpl<$Res, $Val extends CardInput>
    implements $CardInputCopyWith<$Res> {
  _$CardInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentProductResult = null,
    Object? accountOnFile = freezed,
    Object? fieldsInput = null,
    Object? validationErrorMessages = null,
    Object? liveValidationEnabled = null,
    Object? rememberPaymentDetails = null,
    Object? lastRequestedIin = freezed,
  }) {
    return _then(_value.copyWith(
      paymentProductResult: null == paymentProductResult
          ? _value.paymentProductResult
          : paymentProductResult // ignore: cast_nullable_to_non_nullable
              as Result<PaymentProduct>,
      accountOnFile: freezed == accountOnFile
          ? _value.accountOnFile
          : accountOnFile // ignore: cast_nullable_to_non_nullable
              as AccountOnFile?,
      fieldsInput: null == fieldsInput
          ? _value.fieldsInput
          : fieldsInput // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      validationErrorMessages: null == validationErrorMessages
          ? _value.validationErrorMessages
          : validationErrorMessages // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>?>,
      liveValidationEnabled: null == liveValidationEnabled
          ? _value.liveValidationEnabled
          : liveValidationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      rememberPaymentDetails: null == rememberPaymentDetails
          ? _value.rememberPaymentDetails
          : rememberPaymentDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      lastRequestedIin: freezed == lastRequestedIin
          ? _value.lastRequestedIin
          : lastRequestedIin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<PaymentProduct, $Res> get paymentProductResult {
    return $ResultCopyWith<PaymentProduct, $Res>(_value.paymentProductResult,
        (value) {
      return _then(_value.copyWith(paymentProductResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardInputImplCopyWith<$Res>
    implements $CardInputCopyWith<$Res> {
  factory _$$CardInputImplCopyWith(
          _$CardInputImpl value, $Res Function(_$CardInputImpl) then) =
      __$$CardInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Result<PaymentProduct> paymentProductResult,
      AccountOnFile? accountOnFile,
      Map<String, String> fieldsInput,
      Map<String, List<String>?> validationErrorMessages,
      bool liveValidationEnabled,
      bool rememberPaymentDetails,
      String? lastRequestedIin});

  @override
  $ResultCopyWith<PaymentProduct, $Res> get paymentProductResult;
}

/// @nodoc
class __$$CardInputImplCopyWithImpl<$Res>
    extends _$CardInputCopyWithImpl<$Res, _$CardInputImpl>
    implements _$$CardInputImplCopyWith<$Res> {
  __$$CardInputImplCopyWithImpl(
      _$CardInputImpl _value, $Res Function(_$CardInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentProductResult = null,
    Object? accountOnFile = freezed,
    Object? fieldsInput = null,
    Object? validationErrorMessages = null,
    Object? liveValidationEnabled = null,
    Object? rememberPaymentDetails = null,
    Object? lastRequestedIin = freezed,
  }) {
    return _then(_$CardInputImpl(
      paymentProductResult: null == paymentProductResult
          ? _value.paymentProductResult
          : paymentProductResult // ignore: cast_nullable_to_non_nullable
              as Result<PaymentProduct>,
      accountOnFile: freezed == accountOnFile
          ? _value.accountOnFile
          : accountOnFile // ignore: cast_nullable_to_non_nullable
              as AccountOnFile?,
      fieldsInput: null == fieldsInput
          ? _value.fieldsInput
          : fieldsInput // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      validationErrorMessages: null == validationErrorMessages
          ? _value.validationErrorMessages
          : validationErrorMessages // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>?>,
      liveValidationEnabled: null == liveValidationEnabled
          ? _value.liveValidationEnabled
          : liveValidationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      rememberPaymentDetails: null == rememberPaymentDetails
          ? _value.rememberPaymentDetails
          : rememberPaymentDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      lastRequestedIin: freezed == lastRequestedIin
          ? _value.lastRequestedIin
          : lastRequestedIin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CardInputImpl implements _CardInput {
  _$CardInputImpl(
      {required this.paymentProductResult,
      this.accountOnFile,
      required this.fieldsInput,
      required this.validationErrorMessages,
      this.liveValidationEnabled = false,
      this.rememberPaymentDetails = false,
      this.lastRequestedIin});

  @override
  final Result<PaymentProduct> paymentProductResult;
  @override
  final AccountOnFile? accountOnFile;
  @override
  final Map<String, String> fieldsInput;
  @override
  final Map<String, List<String>?> validationErrorMessages;
  @override
  @JsonKey()
  final bool liveValidationEnabled;
  @override
  @JsonKey()
  final bool rememberPaymentDetails;
  @override
  final String? lastRequestedIin;

  @override
  String toString() {
    return 'CardInput(paymentProductResult: $paymentProductResult, accountOnFile: $accountOnFile, fieldsInput: $fieldsInput, validationErrorMessages: $validationErrorMessages, liveValidationEnabled: $liveValidationEnabled, rememberPaymentDetails: $rememberPaymentDetails, lastRequestedIin: $lastRequestedIin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardInputImpl &&
            (identical(other.paymentProductResult, paymentProductResult) ||
                other.paymentProductResult == paymentProductResult) &&
            (identical(other.accountOnFile, accountOnFile) ||
                other.accountOnFile == accountOnFile) &&
            const DeepCollectionEquality()
                .equals(other.fieldsInput, fieldsInput) &&
            const DeepCollectionEquality().equals(
                other.validationErrorMessages, validationErrorMessages) &&
            (identical(other.liveValidationEnabled, liveValidationEnabled) ||
                other.liveValidationEnabled == liveValidationEnabled) &&
            (identical(other.rememberPaymentDetails, rememberPaymentDetails) ||
                other.rememberPaymentDetails == rememberPaymentDetails) &&
            (identical(other.lastRequestedIin, lastRequestedIin) ||
                other.lastRequestedIin == lastRequestedIin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentProductResult,
      accountOnFile,
      const DeepCollectionEquality().hash(fieldsInput),
      const DeepCollectionEquality().hash(validationErrorMessages),
      liveValidationEnabled,
      rememberPaymentDetails,
      lastRequestedIin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardInputImplCopyWith<_$CardInputImpl> get copyWith =>
      __$$CardInputImplCopyWithImpl<_$CardInputImpl>(this, _$identity);
}

abstract class _CardInput implements CardInput {
  factory _CardInput(
      {required final Result<PaymentProduct> paymentProductResult,
      final AccountOnFile? accountOnFile,
      required final Map<String, String> fieldsInput,
      required final Map<String, List<String>?> validationErrorMessages,
      final bool liveValidationEnabled,
      final bool rememberPaymentDetails,
      final String? lastRequestedIin}) = _$CardInputImpl;

  @override
  Result<PaymentProduct> get paymentProductResult;
  @override
  AccountOnFile? get accountOnFile;
  @override
  Map<String, String> get fieldsInput;
  @override
  Map<String, List<String>?> get validationErrorMessages;
  @override
  bool get liveValidationEnabled;
  @override
  bool get rememberPaymentDetails;
  @override
  String? get lastRequestedIin;
  @override
  @JsonKey(ignore: true)
  _$$CardInputImplCopyWith<_$CardInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
