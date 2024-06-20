// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_product_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentProductWrapper {
  Result<PaymentProduct> get paymentProductResult =>
      throw _privateConstructorUsedError;
  AccountOnFile? get accountOnFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentProductWrapperCopyWith<PaymentProductWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentProductWrapperCopyWith<$Res> {
  factory $PaymentProductWrapperCopyWith(PaymentProductWrapper value,
          $Res Function(PaymentProductWrapper) then) =
      _$PaymentProductWrapperCopyWithImpl<$Res, PaymentProductWrapper>;
  @useResult
  $Res call(
      {Result<PaymentProduct> paymentProductResult,
      AccountOnFile? accountOnFile});

  $ResultCopyWith<PaymentProduct, $Res> get paymentProductResult;
}

/// @nodoc
class _$PaymentProductWrapperCopyWithImpl<$Res,
        $Val extends PaymentProductWrapper>
    implements $PaymentProductWrapperCopyWith<$Res> {
  _$PaymentProductWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentProductResult = null,
    Object? accountOnFile = freezed,
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
abstract class _$$PaymentProductWrapperImplCopyWith<$Res>
    implements $PaymentProductWrapperCopyWith<$Res> {
  factory _$$PaymentProductWrapperImplCopyWith(
          _$PaymentProductWrapperImpl value,
          $Res Function(_$PaymentProductWrapperImpl) then) =
      __$$PaymentProductWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Result<PaymentProduct> paymentProductResult,
      AccountOnFile? accountOnFile});

  @override
  $ResultCopyWith<PaymentProduct, $Res> get paymentProductResult;
}

/// @nodoc
class __$$PaymentProductWrapperImplCopyWithImpl<$Res>
    extends _$PaymentProductWrapperCopyWithImpl<$Res,
        _$PaymentProductWrapperImpl>
    implements _$$PaymentProductWrapperImplCopyWith<$Res> {
  __$$PaymentProductWrapperImplCopyWithImpl(_$PaymentProductWrapperImpl _value,
      $Res Function(_$PaymentProductWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentProductResult = null,
    Object? accountOnFile = freezed,
  }) {
    return _then(_$PaymentProductWrapperImpl(
      paymentProductResult: null == paymentProductResult
          ? _value.paymentProductResult
          : paymentProductResult // ignore: cast_nullable_to_non_nullable
              as Result<PaymentProduct>,
      accountOnFile: freezed == accountOnFile
          ? _value.accountOnFile
          : accountOnFile // ignore: cast_nullable_to_non_nullable
              as AccountOnFile?,
    ));
  }
}

/// @nodoc

class _$PaymentProductWrapperImpl implements _PaymentProductWrapper {
  _$PaymentProductWrapperImpl(
      {required this.paymentProductResult, this.accountOnFile});

  @override
  final Result<PaymentProduct> paymentProductResult;
  @override
  final AccountOnFile? accountOnFile;

  @override
  String toString() {
    return 'PaymentProductWrapper(paymentProductResult: $paymentProductResult, accountOnFile: $accountOnFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentProductWrapperImpl &&
            (identical(other.paymentProductResult, paymentProductResult) ||
                other.paymentProductResult == paymentProductResult) &&
            (identical(other.accountOnFile, accountOnFile) ||
                other.accountOnFile == accountOnFile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentProductResult, accountOnFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentProductWrapperImplCopyWith<_$PaymentProductWrapperImpl>
      get copyWith => __$$PaymentProductWrapperImplCopyWithImpl<
          _$PaymentProductWrapperImpl>(this, _$identity);
}

abstract class _PaymentProductWrapper implements PaymentProductWrapper {
  factory _PaymentProductWrapper(
      {required final Result<PaymentProduct> paymentProductResult,
      final AccountOnFile? accountOnFile}) = _$PaymentProductWrapperImpl;

  @override
  Result<PaymentProduct> get paymentProductResult;
  @override
  AccountOnFile? get accountOnFile;
  @override
  @JsonKey(ignore: true)
  _$$PaymentProductWrapperImplCopyWith<_$PaymentProductWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
}
