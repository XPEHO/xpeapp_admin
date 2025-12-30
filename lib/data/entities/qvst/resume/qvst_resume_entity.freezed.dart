// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_resume_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QvstResumeEntity {
  String get id;
  String get theme;
  String get question;
  String get numberOfAnswers;
  String get averageAnswer;
  String get maxValueAnswer;

  /// Create a copy of QvstResumeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QvstResumeEntityCopyWith<QvstResumeEntity> get copyWith =>
      _$QvstResumeEntityCopyWithImpl<QvstResumeEntity>(
          this as QvstResumeEntity, _$identity);

  /// Serializes this QvstResumeEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QvstResumeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.numberOfAnswers, numberOfAnswers) ||
                other.numberOfAnswers == numberOfAnswers) &&
            (identical(other.averageAnswer, averageAnswer) ||
                other.averageAnswer == averageAnswer) &&
            (identical(other.maxValueAnswer, maxValueAnswer) ||
                other.maxValueAnswer == maxValueAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, theme, question,
      numberOfAnswers, averageAnswer, maxValueAnswer);

  @override
  String toString() {
    return 'QvstResumeEntity(id: $id, theme: $theme, question: $question, numberOfAnswers: $numberOfAnswers, averageAnswer: $averageAnswer, maxValueAnswer: $maxValueAnswer)';
  }
}

/// @nodoc
abstract mixin class $QvstResumeEntityCopyWith<$Res> {
  factory $QvstResumeEntityCopyWith(
          QvstResumeEntity value, $Res Function(QvstResumeEntity) _then) =
      _$QvstResumeEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String theme,
      String question,
      String numberOfAnswers,
      String averageAnswer,
      String maxValueAnswer});
}

/// @nodoc
class _$QvstResumeEntityCopyWithImpl<$Res>
    implements $QvstResumeEntityCopyWith<$Res> {
  _$QvstResumeEntityCopyWithImpl(this._self, this._then);

  final QvstResumeEntity _self;
  final $Res Function(QvstResumeEntity) _then;

  /// Create a copy of QvstResumeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? theme = null,
    Object? question = null,
    Object? numberOfAnswers = null,
    Object? averageAnswer = null,
    Object? maxValueAnswer = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfAnswers: null == numberOfAnswers
          ? _self.numberOfAnswers
          : numberOfAnswers // ignore: cast_nullable_to_non_nullable
              as String,
      averageAnswer: null == averageAnswer
          ? _self.averageAnswer
          : averageAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      maxValueAnswer: null == maxValueAnswer
          ? _self.maxValueAnswer
          : maxValueAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [QvstResumeEntity].
extension QvstResumeEntityPatterns on QvstResumeEntity {
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
    TResult Function(_QvstResumeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstResumeEntity() when $default != null:
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
    TResult Function(_QvstResumeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstResumeEntity():
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
    TResult? Function(_QvstResumeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstResumeEntity() when $default != null:
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
            String id,
            String theme,
            String question,
            String numberOfAnswers,
            String averageAnswer,
            String maxValueAnswer)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstResumeEntity() when $default != null:
        return $default(_that.id, _that.theme, _that.question,
            _that.numberOfAnswers, _that.averageAnswer, _that.maxValueAnswer);
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
    TResult Function(String id, String theme, String question,
            String numberOfAnswers, String averageAnswer, String maxValueAnswer)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstResumeEntity():
        return $default(_that.id, _that.theme, _that.question,
            _that.numberOfAnswers, _that.averageAnswer, _that.maxValueAnswer);
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
            String id,
            String theme,
            String question,
            String numberOfAnswers,
            String averageAnswer,
            String maxValueAnswer)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstResumeEntity() when $default != null:
        return $default(_that.id, _that.theme, _that.question,
            _that.numberOfAnswers, _that.averageAnswer, _that.maxValueAnswer);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QvstResumeEntity implements QvstResumeEntity {
  const _QvstResumeEntity(
      {required this.id,
      required this.theme,
      required this.question,
      required this.numberOfAnswers,
      required this.averageAnswer,
      required this.maxValueAnswer});
  factory _QvstResumeEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstResumeEntityFromJson(json);

  @override
  final String id;
  @override
  final String theme;
  @override
  final String question;
  @override
  final String numberOfAnswers;
  @override
  final String averageAnswer;
  @override
  final String maxValueAnswer;

  /// Create a copy of QvstResumeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QvstResumeEntityCopyWith<_QvstResumeEntity> get copyWith =>
      __$QvstResumeEntityCopyWithImpl<_QvstResumeEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QvstResumeEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QvstResumeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.numberOfAnswers, numberOfAnswers) ||
                other.numberOfAnswers == numberOfAnswers) &&
            (identical(other.averageAnswer, averageAnswer) ||
                other.averageAnswer == averageAnswer) &&
            (identical(other.maxValueAnswer, maxValueAnswer) ||
                other.maxValueAnswer == maxValueAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, theme, question,
      numberOfAnswers, averageAnswer, maxValueAnswer);

  @override
  String toString() {
    return 'QvstResumeEntity(id: $id, theme: $theme, question: $question, numberOfAnswers: $numberOfAnswers, averageAnswer: $averageAnswer, maxValueAnswer: $maxValueAnswer)';
  }
}

/// @nodoc
abstract mixin class _$QvstResumeEntityCopyWith<$Res>
    implements $QvstResumeEntityCopyWith<$Res> {
  factory _$QvstResumeEntityCopyWith(
          _QvstResumeEntity value, $Res Function(_QvstResumeEntity) _then) =
      __$QvstResumeEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String theme,
      String question,
      String numberOfAnswers,
      String averageAnswer,
      String maxValueAnswer});
}

/// @nodoc
class __$QvstResumeEntityCopyWithImpl<$Res>
    implements _$QvstResumeEntityCopyWith<$Res> {
  __$QvstResumeEntityCopyWithImpl(this._self, this._then);

  final _QvstResumeEntity _self;
  final $Res Function(_QvstResumeEntity) _then;

  /// Create a copy of QvstResumeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? theme = null,
    Object? question = null,
    Object? numberOfAnswers = null,
    Object? averageAnswer = null,
    Object? maxValueAnswer = null,
  }) {
    return _then(_QvstResumeEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfAnswers: null == numberOfAnswers
          ? _self.numberOfAnswers
          : numberOfAnswers // ignore: cast_nullable_to_non_nullable
              as String,
      averageAnswer: null == averageAnswer
          ? _self.averageAnswer
          : averageAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      maxValueAnswer: null == maxValueAnswer
          ? _self.maxValueAnswer
          : maxValueAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
