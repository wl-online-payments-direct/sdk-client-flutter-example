// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_tracker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoadingTracker {
  bool get isLoadingPaymentProducts => throw _privateConstructorUsedError;
  bool get isLoadingPaymentProduct => throw _privateConstructorUsedError;
  bool get isLoadingEncryptPayment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadingTrackerCopyWith<LoadingTracker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingTrackerCopyWith<$Res> {
  factory $LoadingTrackerCopyWith(
          LoadingTracker value, $Res Function(LoadingTracker) then) =
      _$LoadingTrackerCopyWithImpl<$Res, LoadingTracker>;
  @useResult
  $Res call(
      {bool isLoadingPaymentProducts,
      bool isLoadingPaymentProduct,
      bool isLoadingEncryptPayment});
}

/// @nodoc
class _$LoadingTrackerCopyWithImpl<$Res, $Val extends LoadingTracker>
    implements $LoadingTrackerCopyWith<$Res> {
  _$LoadingTrackerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingPaymentProducts = null,
    Object? isLoadingPaymentProduct = null,
    Object? isLoadingEncryptPayment = null,
  }) {
    return _then(_value.copyWith(
      isLoadingPaymentProducts: null == isLoadingPaymentProducts
          ? _value.isLoadingPaymentProducts
          : isLoadingPaymentProducts // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingPaymentProduct: null == isLoadingPaymentProduct
          ? _value.isLoadingPaymentProduct
          : isLoadingPaymentProduct // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingEncryptPayment: null == isLoadingEncryptPayment
          ? _value.isLoadingEncryptPayment
          : isLoadingEncryptPayment // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadingTrackerImplCopyWith<$Res>
    implements $LoadingTrackerCopyWith<$Res> {
  factory _$$LoadingTrackerImplCopyWith(_$LoadingTrackerImpl value,
          $Res Function(_$LoadingTrackerImpl) then) =
      __$$LoadingTrackerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingPaymentProducts,
      bool isLoadingPaymentProduct,
      bool isLoadingEncryptPayment});
}

/// @nodoc
class __$$LoadingTrackerImplCopyWithImpl<$Res>
    extends _$LoadingTrackerCopyWithImpl<$Res, _$LoadingTrackerImpl>
    implements _$$LoadingTrackerImplCopyWith<$Res> {
  __$$LoadingTrackerImplCopyWithImpl(
      _$LoadingTrackerImpl _value, $Res Function(_$LoadingTrackerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingPaymentProducts = null,
    Object? isLoadingPaymentProduct = null,
    Object? isLoadingEncryptPayment = null,
  }) {
    return _then(_$LoadingTrackerImpl(
      isLoadingPaymentProducts: null == isLoadingPaymentProducts
          ? _value.isLoadingPaymentProducts
          : isLoadingPaymentProducts // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingPaymentProduct: null == isLoadingPaymentProduct
          ? _value.isLoadingPaymentProduct
          : isLoadingPaymentProduct // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingEncryptPayment: null == isLoadingEncryptPayment
          ? _value.isLoadingEncryptPayment
          : isLoadingEncryptPayment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingTrackerImpl implements _LoadingTracker {
  _$LoadingTrackerImpl(
      {this.isLoadingPaymentProducts = false,
      this.isLoadingPaymentProduct = false,
      this.isLoadingEncryptPayment = false});

  @override
  @JsonKey()
  final bool isLoadingPaymentProducts;
  @override
  @JsonKey()
  final bool isLoadingPaymentProduct;
  @override
  @JsonKey()
  final bool isLoadingEncryptPayment;

  @override
  String toString() {
    return 'LoadingTracker(isLoadingPaymentProducts: $isLoadingPaymentProducts, isLoadingPaymentProduct: $isLoadingPaymentProduct, isLoadingEncryptPayment: $isLoadingEncryptPayment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingTrackerImpl &&
            (identical(
                    other.isLoadingPaymentProducts, isLoadingPaymentProducts) ||
                other.isLoadingPaymentProducts == isLoadingPaymentProducts) &&
            (identical(
                    other.isLoadingPaymentProduct, isLoadingPaymentProduct) ||
                other.isLoadingPaymentProduct == isLoadingPaymentProduct) &&
            (identical(
                    other.isLoadingEncryptPayment, isLoadingEncryptPayment) ||
                other.isLoadingEncryptPayment == isLoadingEncryptPayment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoadingPaymentProducts,
      isLoadingPaymentProduct, isLoadingEncryptPayment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingTrackerImplCopyWith<_$LoadingTrackerImpl> get copyWith =>
      __$$LoadingTrackerImplCopyWithImpl<_$LoadingTrackerImpl>(
          this, _$identity);
}

abstract class _LoadingTracker implements LoadingTracker {
  factory _LoadingTracker(
      {final bool isLoadingPaymentProducts,
      final bool isLoadingPaymentProduct,
      final bool isLoadingEncryptPayment}) = _$LoadingTrackerImpl;

  @override
  bool get isLoadingPaymentProducts;
  @override
  bool get isLoadingPaymentProduct;
  @override
  bool get isLoadingEncryptPayment;
  @override
  @JsonKey(ignore: true)
  _$$LoadingTrackerImplCopyWith<_$LoadingTrackerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
