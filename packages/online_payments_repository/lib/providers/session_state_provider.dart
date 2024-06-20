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
import 'package:online_payments_repository/constants.dart' as constants;
import 'package:online_payments_repository/models/session_details.dart';
import 'package:online_payments_sdk/online_payments_sdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_state_provider.g.dart';

/// Needs to remain alive throughout the app, because its input is needed when making API calls.
/// This provider is invalidated when a payment was created successfully, since then all its data should be cleared.
@Riverpod(keepAlive: true)
class SessionState extends _$SessionState {
  @override
  Session? build() {
    return null;
  }

  void setSession(SessionDetails sessionDetails) {
    final session = Session(
      sessionDetails.clientSessionId ?? "",
      sessionDetails.customerId ?? "",
      sessionDetails.clientApiUrl ?? "",
      sessionDetails.assetUrl ?? "",
      isEnvironmentProduction: constants.environmentIsProduction,
      appIdentifier: constants.appIdentifier,
      loggingEnabled: sessionDetails.enableLogging,
    );

    state = session;
  }
}
