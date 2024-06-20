// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionDetailsImpl _$$SessionDetailsImplFromJson(Map<String, dynamic> json) =>
    _$SessionDetailsImpl(
      assetUrl: json['assetUrl'] as String?,
      clientApiUrl: json['clientApiUrl'] as String?,
      clientSessionId: json['clientSessionId'] as String?,
      customerId: json['customerId'] as String?,
      enableLogging: json['enableLogging'] as bool? ?? false,
    );

Map<String, dynamic> _$$SessionDetailsImplToJson(
        _$SessionDetailsImpl instance) =>
    <String, dynamic>{
      'assetUrl': instance.assetUrl,
      'clientApiUrl': instance.clientApiUrl,
      'clientSessionId': instance.clientSessionId,
      'customerId': instance.customerId,
      'enableLogging': instance.enableLogging,
    };
