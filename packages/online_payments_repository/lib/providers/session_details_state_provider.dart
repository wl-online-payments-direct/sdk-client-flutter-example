/*
 * Do not remove or alter the notices in this preamble.
 *
 * This software is owned by Worldline and may not be be altered, copied, reproduced, republished, uploaded, posted, transmitted or distributed in any way, without the prior written consent of Worldline.
 *
 * Copyright © 2024 Worldline and/or its affiliates.
 *
 * All rights reserved. License grant and user rights and obligations according to the applicable license agreement.
 *
 * Please contact Worldline for questions regarding license and user rights.
 */
import 'package:online_payments_repository/models/session_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_details_state_provider.g.dart';

/// Since this provider is used on the initial screen, it does not require the keepAlive identifier, since it will be alive anyway.
/// This provider is never invalidated, so it remembers the input for a next payment.
@Riverpod()
class SessionDetailsState extends _$SessionDetailsState {
  @override
  SessionDetails build() {
    return const SessionDetails();
  }

  void setSessionDetails(SessionDetails sessionDetails) {
    state = sessionDetails;
  }

  void updateAssetUrl(String assetUrl) {
    state = state.copyWith(assetUrl: assetUrl);
  }

  void updateClientApiUrl(String clientApiUrl) {
    state = state.copyWith(clientApiUrl: clientApiUrl);
  }

  void updateClientSessionId(String clientSessionId) {
    state = state.copyWith(clientSessionId: clientSessionId);
  }

  void updateCustomerId(String customerId) {
    state = state.copyWith(customerId: customerId);
  }

  void enableLogging(bool enableLogging) {
    state = state.copyWith(enableLogging: enableLogging);
  }
}
