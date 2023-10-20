// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'newsletter_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsletterEntity _$NewsletterEntityFromJson(Map<String, dynamic> json) {
  return _NewsletterEntity.fromJson(json);
}

/// @nodoc
mixin _$NewsletterEntity {
  String? get id => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get date => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get publicationDate => throw _privateConstructorUsedError;
  String get pdfUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsletterEntityCopyWith<NewsletterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsletterEntityCopyWith<$Res> {
  factory $NewsletterEntityCopyWith(
          NewsletterEntity value, $Res Function(NewsletterEntity) then) =
      _$NewsletterEntityCopyWithImpl<$Res, NewsletterEntity>;
  @useResult
  $Res call(
      {String? id,
      String summary,
      String? picture,
      @TimestampConverter() Timestamp date,
      @TimestampConverter() Timestamp publicationDate,
      String pdfUrl});
}

/// @nodoc
class _$NewsletterEntityCopyWithImpl<$Res, $Val extends NewsletterEntity>
    implements $NewsletterEntityCopyWith<$Res> {
  _$NewsletterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? summary = null,
    Object? picture = freezed,
    Object? date = null,
    Object? publicationDate = null,
    Object? pdfUrl = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      publicationDate: null == publicationDate
          ? _value.publicationDate
          : publicationDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      pdfUrl: null == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsletterEntityCopyWith<$Res>
    implements $NewsletterEntityCopyWith<$Res> {
  factory _$$_NewsletterEntityCopyWith(
          _$_NewsletterEntity value, $Res Function(_$_NewsletterEntity) then) =
      __$$_NewsletterEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String summary,
      String? picture,
      @TimestampConverter() Timestamp date,
      @TimestampConverter() Timestamp publicationDate,
      String pdfUrl});
}

/// @nodoc
class __$$_NewsletterEntityCopyWithImpl<$Res>
    extends _$NewsletterEntityCopyWithImpl<$Res, _$_NewsletterEntity>
    implements _$$_NewsletterEntityCopyWith<$Res> {
  __$$_NewsletterEntityCopyWithImpl(
      _$_NewsletterEntity _value, $Res Function(_$_NewsletterEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? summary = null,
    Object? picture = freezed,
    Object? date = null,
    Object? publicationDate = null,
    Object? pdfUrl = null,
  }) {
    return _then(_$_NewsletterEntity(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      publicationDate: null == publicationDate
          ? _value.publicationDate
          : publicationDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      pdfUrl: null == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_NewsletterEntity implements _NewsletterEntity {
  const _$_NewsletterEntity(
      {this.id,
      required this.summary,
      this.picture,
      @TimestampConverter() required this.date,
      @TimestampConverter() required this.publicationDate,
      required this.pdfUrl});

  factory _$_NewsletterEntity.fromJson(Map<String, dynamic> json) =>
      _$$_NewsletterEntityFromJson(json);

  @override
  final String? id;
  @override
  final String summary;
  @override
  final String? picture;
  @override
  @TimestampConverter()
  final Timestamp date;
  @override
  @TimestampConverter()
  final Timestamp publicationDate;
  @override
  final String pdfUrl;

  @override
  String toString() {
    return 'NewsletterEntity(id: $id, summary: $summary, picture: $picture, date: $date, publicationDate: $publicationDate, pdfUrl: $pdfUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsletterEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.publicationDate, publicationDate) ||
                other.publicationDate == publicationDate) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, summary, picture, date, publicationDate, pdfUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsletterEntityCopyWith<_$_NewsletterEntity> get copyWith =>
      __$$_NewsletterEntityCopyWithImpl<_$_NewsletterEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsletterEntityToJson(
      this,
    );
  }
}

abstract class _NewsletterEntity implements NewsletterEntity {
  const factory _NewsletterEntity(
      {final String? id,
      required final String summary,
      final String? picture,
      @TimestampConverter() required final Timestamp date,
      @TimestampConverter() required final Timestamp publicationDate,
      required final String pdfUrl}) = _$_NewsletterEntity;

  factory _NewsletterEntity.fromJson(Map<String, dynamic> json) =
      _$_NewsletterEntity.fromJson;

  @override
  String? get id;
  @override
  String get summary;
  @override
  String? get picture;
  @override
  @TimestampConverter()
  Timestamp get date;
  @override
  @TimestampConverter()
  Timestamp get publicationDate;
  @override
  String get pdfUrl;
  @override
  @JsonKey(ignore: true)
  _$$_NewsletterEntityCopyWith<_$_NewsletterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
