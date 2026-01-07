import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpeapp_admin/env/serializer/timestamp_serializer.dart';

part 'newsletter_entity.freezed.dart';
part 'newsletter_entity.g.dart';

@Freezed()
abstract class NewsletterEntity with _$NewsletterEntity {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory NewsletterEntity({
    String? id,
    required String summary,
    String? picture,
    @TimestampConverter() required Timestamp date,
    @TimestampConverter() required Timestamp publicationDate,
    required String pdfUrl,
  }) = _NewsletterEntity;

  factory NewsletterEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsletterEntityFromJson(json);
}
