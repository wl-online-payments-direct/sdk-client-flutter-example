/*
 * Do not remove or alter the notices in this preamble.
 *
 * This software is owned by Worldline and may not be be altered, copied, reproduced, republished, uploaded, posted, transmitted or distributed in any way, without the prior written consent of Worldline.
 *
 * Copyright © 2026 Worldline and/or its affiliates.
 *
 * All rights reserved. License grant and user rights and obligations according to the applicable license agreement.
 *
 * Please contact Worldline for questions regarding license and user rights.
 */
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
