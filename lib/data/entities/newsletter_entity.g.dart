// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsletter_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsletterEntityImpl _$$NewsletterEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsletterEntityImpl(
      id: json['id'] as String?,
      summary: json['summary'] as String,
      picture: json['picture'] as String?,
      date: const TimestampConverter().fromJson(json['date']),
      publicationDate:
          const TimestampConverter().fromJson(json['publicationDate']),
      pdfUrl: json['pdfUrl'] as String,
    );

Map<String, dynamic> _$$NewsletterEntityImplToJson(
        _$NewsletterEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'summary': instance.summary,
      'picture': instance.picture,
      'date': const TimestampConverter().toJson(instance.date),
      'publicationDate':
          const TimestampConverter().toJson(instance.publicationDate),
      'pdfUrl': instance.pdfUrl,
    };
