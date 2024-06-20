import 'package:online_payments_repository/models/loading_tracker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_state_provider.g.dart';

/// Needs to remain alive throughout the whole app, because its input is used on multiple screens.
/// This provider is invalidated when a payment was created successfully, since then all its data should be cleared.
@Riverpod(keepAlive: true)
class LoadingState extends _$LoadingState {
  @override
  LoadingTracker build() {
    return LoadingTracker();
  }

  void updatePaymentProductsLoadingStatus(bool isLoading) {
    state = state.copyWith(isLoadingPaymentProducts: isLoading);
  }

  void updatePaymentProductLoadingStatus(bool isLoading) {
    state = state.copyWith(isLoadingPaymentProduct: isLoading);
  }

  void updateEncryptPaymentLoadingStatus(bool isLoading) {
    state = state.copyWith(isLoadingEncryptPayment: isLoading);
  }
}
