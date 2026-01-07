// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'newsletter_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsletterEntity {
  String? get id;
  String get summary;
  String? get picture;
  @TimestampConverter()
  Timestamp get date;
  @TimestampConverter()
  Timestamp get publicationDate;
  String get pdfUrl;

  /// Create a copy of NewsletterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsletterEntityCopyWith<NewsletterEntity> get copyWith =>
      _$NewsletterEntityCopyWithImpl<NewsletterEntity>(
          this as NewsletterEntity, _$identity);

  /// Serializes this NewsletterEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsletterEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.publicationDate, publicationDate) ||
                other.publicationDate == publicationDate) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, summary, picture, date, publicationDate, pdfUrl);

  @override
  String toString() {
    return 'NewsletterEntity(id: $id, summary: $summary, picture: $picture, date: $date, publicationDate: $publicationDate, pdfUrl: $pdfUrl)';
  }
}

/// @nodoc
abstract mixin class $NewsletterEntityCopyWith<$Res> {
  factory $NewsletterEntityCopyWith(
          NewsletterEntity value, $Res Function(NewsletterEntity) _then) =
      _$NewsletterEntityCopyWithImpl;
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
class _$NewsletterEntityCopyWithImpl<$Res>
    implements $NewsletterEntityCopyWith<$Res> {
  _$NewsletterEntityCopyWithImpl(this._self, this._then);

  final NewsletterEntity _self;
  final $Res Function(NewsletterEntity) _then;

  /// Create a copy of NewsletterEntity
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      picture: freezed == picture
          ? _self.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      publicationDate: null == publicationDate
          ? _self.publicationDate
          : publicationDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      pdfUrl: null == pdfUrl
          ? _self.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [NewsletterEntity].
extension NewsletterEntityPatterns on NewsletterEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewsletterEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsletterEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewsletterEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsletterEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NewsletterEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsletterEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? id,
            String summary,
            String? picture,
            @TimestampConverter() Timestamp date,
            @TimestampConverter() Timestamp publicationDate,
            String pdfUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsletterEntity() when $default != null:
        return $default(_that.id, _that.summary, _that.picture, _that.date,
            _that.publicationDate, _that.pdfUrl);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? id,
            String summary,
            String? picture,
            @TimestampConverter() Timestamp date,
            @TimestampConverter() Timestamp publicationDate,
            String pdfUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsletterEntity():
        return $default(_that.id, _that.summary, _that.picture, _that.date,
            _that.publicationDate, _that.pdfUrl);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? id,
            String summary,
            String? picture,
            @TimestampConverter() Timestamp date,
            @TimestampConverter() Timestamp publicationDate,
            String pdfUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsletterEntity() when $default != null:
        return $default(_that.id, _that.summary, _that.picture, _that.date,
            _that.publicationDate, _that.pdfUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _NewsletterEntity implements NewsletterEntity {
  const _NewsletterEntity(
      {this.id,
      required this.summary,
      this.picture,
      @TimestampConverter() required this.date,
      @TimestampConverter() required this.publicationDate,
      required this.pdfUrl});
  factory _NewsletterEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsletterEntityFromJson(json);

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

  /// Create a copy of NewsletterEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsletterEntityCopyWith<_NewsletterEntity> get copyWith =>
      __$NewsletterEntityCopyWithImpl<_NewsletterEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NewsletterEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsletterEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.publicationDate, publicationDate) ||
                other.publicationDate == publicationDate) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, summary, picture, date, publicationDate, pdfUrl);

  @override
  String toString() {
    return 'NewsletterEntity(id: $id, summary: $summary, picture: $picture, date: $date, publicationDate: $publicationDate, pdfUrl: $pdfUrl)';
  }
}

/// @nodoc
abstract mixin class _$NewsletterEntityCopyWith<$Res>
    implements $NewsletterEntityCopyWith<$Res> {
  factory _$NewsletterEntityCopyWith(
          _NewsletterEntity value, $Res Function(_NewsletterEntity) _then) =
      __$NewsletterEntityCopyWithImpl;
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
class __$NewsletterEntityCopyWithImpl<$Res>
    implements _$NewsletterEntityCopyWith<$Res> {
  __$NewsletterEntityCopyWithImpl(this._self, this._then);

  final _NewsletterEntity _self;
  final $Res Function(_NewsletterEntity) _then;

  /// Create a copy of NewsletterEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? summary = null,
    Object? picture = freezed,
    Object? date = null,
    Object? publicationDate = null,
    Object? pdfUrl = null,
  }) {
    return _then(_NewsletterEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      picture: freezed == picture
          ? _self.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      publicationDate: null == publicationDate
          ? _self.publicationDate
          : publicationDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      pdfUrl: null == pdfUrl
          ? _self.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
