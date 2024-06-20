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
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_details.freezed.dart';
part 'session_details.g.dart';

@freezed
class SessionDetails with _$SessionDetails {
  const factory SessionDetails({
    String? assetUrl,
    String? clientApiUrl,
    String? clientSessionId,
    String? customerId,
    @Default(false) bool enableLogging,
  }) = _SessionDetails;

  factory SessionDetails.fromJson(Map<String, dynamic> json) =>
      _$SessionDetailsFromJson(json);
}
