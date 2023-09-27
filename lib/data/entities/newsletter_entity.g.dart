// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsletter_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsletterEntity _$$_NewsletterEntityFromJson(Map<String, dynamic> json) =>
    _$_NewsletterEntity(
      id: json['id'] as String?,
      summary: json['summary'] as String,
      picture: json['picture'] as String?,
      date: const TimestampConverter().fromJson(json['date']),
      pdfUrl: json['pdfUrl'] as String,
    );

Map<String, dynamic> _$$_NewsletterEntityToJson(_$_NewsletterEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'summary': instance.summary,
      'picture': instance.picture,
      'date': const TimestampConverter().toJson(instance.date),
      'pdfUrl': instance.pdfUrl,
    };
