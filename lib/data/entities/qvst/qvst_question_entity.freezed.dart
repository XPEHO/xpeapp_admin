// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_question_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QvstQuestionEntity {
  @JsonKey(name: 'question_id')
  String? get id;
  String get question;
  String? get theme;
  @JsonKey(name: 'theme_id')
  String? get idTheme;
  @JsonKey(name: 'answer_repo_id')
  String? get answerRepoId;
  int? get numberAsked;
  @JsonSerializable(explicitToJson: true)
  List<QvstAnswerEntity> get answers;
  @JsonKey(name: 'is_reversed')
  bool get isReversed;

  /// Create a copy of QvstQuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QvstQuestionEntityCopyWith<QvstQuestionEntity> get copyWith =>
      _$QvstQuestionEntityCopyWithImpl<QvstQuestionEntity>(
          this as QvstQuestionEntity, _$identity);

  /// Serializes this QvstQuestionEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QvstQuestionEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.idTheme, idTheme) || other.idTheme == idTheme) &&
            (identical(other.answerRepoId, answerRepoId) ||
                other.answerRepoId == answerRepoId) &&
            (identical(other.numberAsked, numberAsked) ||
                other.numberAsked == numberAsked) &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            (identical(other.isReversed, isReversed) ||
                other.isReversed == isReversed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      theme,
      idTheme,
      answerRepoId,
      numberAsked,
      const DeepCollectionEquality().hash(answers),
      isReversed);

  @override
  String toString() {
    return 'QvstQuestionEntity(id: $id, question: $question, theme: $theme, idTheme: $idTheme, answerRepoId: $answerRepoId, numberAsked: $numberAsked, answers: $answers, isReversed: $isReversed)';
  }
}

/// @nodoc
abstract mixin class $QvstQuestionEntityCopyWith<$Res> {
  factory $QvstQuestionEntityCopyWith(
          QvstQuestionEntity value, $Res Function(QvstQuestionEntity) _then) =
      _$QvstQuestionEntityCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') String? id,
      String question,
      String? theme,
      @JsonKey(name: 'theme_id') String? idTheme,
      @JsonKey(name: 'answer_repo_id') String? answerRepoId,
      int? numberAsked,
      @JsonSerializable(explicitToJson: true) List<QvstAnswerEntity> answers,
      @JsonKey(name: 'is_reversed') bool isReversed});
}

/// @nodoc
class _$QvstQuestionEntityCopyWithImpl<$Res>
    implements $QvstQuestionEntityCopyWith<$Res> {
  _$QvstQuestionEntityCopyWithImpl(this._self, this._then);

  final QvstQuestionEntity _self;
  final $Res Function(QvstQuestionEntity) _then;

  /// Create a copy of QvstQuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = null,
    Object? theme = freezed,
    Object? idTheme = freezed,
    Object? answerRepoId = freezed,
    Object? numberAsked = freezed,
    Object? answers = null,
    Object? isReversed = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      theme: freezed == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      idTheme: freezed == idTheme
          ? _self.idTheme
          : idTheme // ignore: cast_nullable_to_non_nullable
              as String?,
      answerRepoId: freezed == answerRepoId
          ? _self.answerRepoId
          : answerRepoId // ignore: cast_nullable_to_non_nullable
              as String?,
      numberAsked: freezed == numberAsked
          ? _self.numberAsked
          : numberAsked // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: null == answers
          ? _self.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QvstAnswerEntity>,
      isReversed: null == isReversed
          ? _self.isReversed
          : isReversed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [QvstQuestionEntity].
extension QvstQuestionEntityPatterns on QvstQuestionEntity {
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
    TResult Function(_QvstQuestionEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionEntity() when $default != null:
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
    TResult Function(_QvstQuestionEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionEntity():
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
    TResult? Function(_QvstQuestionEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionEntity() when $default != null:
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
            @JsonKey(name: 'question_id') String? id,
            String question,
            String? theme,
            @JsonKey(name: 'theme_id') String? idTheme,
            @JsonKey(name: 'answer_repo_id') String? answerRepoId,
            int? numberAsked,
            @JsonSerializable(explicitToJson: true)
            List<QvstAnswerEntity> answers,
            @JsonKey(name: 'is_reversed') bool isReversed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionEntity() when $default != null:
        return $default(
            _that.id,
            _that.question,
            _that.theme,
            _that.idTheme,
            _that.answerRepoId,
            _that.numberAsked,
            _that.answers,
            _that.isReversed);
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
            @JsonKey(name: 'question_id') String? id,
            String question,
            String? theme,
            @JsonKey(name: 'theme_id') String? idTheme,
            @JsonKey(name: 'answer_repo_id') String? answerRepoId,
            int? numberAsked,
            @JsonSerializable(explicitToJson: true)
            List<QvstAnswerEntity> answers,
            @JsonKey(name: 'is_reversed') bool isReversed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionEntity():
        return $default(
            _that.id,
            _that.question,
            _that.theme,
            _that.idTheme,
            _that.answerRepoId,
            _that.numberAsked,
            _that.answers,
            _that.isReversed);
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
            @JsonKey(name: 'question_id') String? id,
            String question,
            String? theme,
            @JsonKey(name: 'theme_id') String? idTheme,
            @JsonKey(name: 'answer_repo_id') String? answerRepoId,
            int? numberAsked,
            @JsonSerializable(explicitToJson: true)
            List<QvstAnswerEntity> answers,
            @JsonKey(name: 'is_reversed') bool isReversed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionEntity() when $default != null:
        return $default(
            _that.id,
            _that.question,
            _that.theme,
            _that.idTheme,
            _that.answerRepoId,
            _that.numberAsked,
            _that.answers,
            _that.isReversed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QvstQuestionEntity implements QvstQuestionEntity {
  _QvstQuestionEntity(
      {@JsonKey(name: 'question_id') this.id,
      required this.question,
      this.theme,
      @JsonKey(name: 'theme_id') this.idTheme,
      @JsonKey(name: 'answer_repo_id') this.answerRepoId,
      this.numberAsked,
      @JsonSerializable(explicitToJson: true)
      final List<QvstAnswerEntity> answers = const [],
      @JsonKey(name: 'is_reversed') this.isReversed = false})
      : _answers = answers;
  factory _QvstQuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstQuestionEntityFromJson(json);

  @override
  @JsonKey(name: 'question_id')
  final String? id;
  @override
  final String question;
  @override
  final String? theme;
  @override
  @JsonKey(name: 'theme_id')
  final String? idTheme;
  @override
  @JsonKey(name: 'answer_repo_id')
  final String? answerRepoId;
  @override
  final int? numberAsked;
  final List<QvstAnswerEntity> _answers;
  @override
  @JsonKey()
  @JsonSerializable(explicitToJson: true)
  List<QvstAnswerEntity> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  @JsonKey(name: 'is_reversed')
  final bool isReversed;

  /// Create a copy of QvstQuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QvstQuestionEntityCopyWith<_QvstQuestionEntity> get copyWith =>
      __$QvstQuestionEntityCopyWithImpl<_QvstQuestionEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QvstQuestionEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QvstQuestionEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.idTheme, idTheme) || other.idTheme == idTheme) &&
            (identical(other.answerRepoId, answerRepoId) ||
                other.answerRepoId == answerRepoId) &&
            (identical(other.numberAsked, numberAsked) ||
                other.numberAsked == numberAsked) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.isReversed, isReversed) ||
                other.isReversed == isReversed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      theme,
      idTheme,
      answerRepoId,
      numberAsked,
      const DeepCollectionEquality().hash(_answers),
      isReversed);

  @override
  String toString() {
    return 'QvstQuestionEntity(id: $id, question: $question, theme: $theme, idTheme: $idTheme, answerRepoId: $answerRepoId, numberAsked: $numberAsked, answers: $answers, isReversed: $isReversed)';
  }
}

/// @nodoc
abstract mixin class _$QvstQuestionEntityCopyWith<$Res>
    implements $QvstQuestionEntityCopyWith<$Res> {
  factory _$QvstQuestionEntityCopyWith(
          _QvstQuestionEntity value, $Res Function(_QvstQuestionEntity) _then) =
      __$QvstQuestionEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') String? id,
      String question,
      String? theme,
      @JsonKey(name: 'theme_id') String? idTheme,
      @JsonKey(name: 'answer_repo_id') String? answerRepoId,
      int? numberAsked,
      @JsonSerializable(explicitToJson: true) List<QvstAnswerEntity> answers,
      @JsonKey(name: 'is_reversed') bool isReversed});
}

/// @nodoc
class __$QvstQuestionEntityCopyWithImpl<$Res>
    implements _$QvstQuestionEntityCopyWith<$Res> {
  __$QvstQuestionEntityCopyWithImpl(this._self, this._then);

  final _QvstQuestionEntity _self;
  final $Res Function(_QvstQuestionEntity) _then;

  /// Create a copy of QvstQuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? question = null,
    Object? theme = freezed,
    Object? idTheme = freezed,
    Object? answerRepoId = freezed,
    Object? numberAsked = freezed,
    Object? answers = null,
    Object? isReversed = null,
  }) {
    return _then(_QvstQuestionEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      theme: freezed == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      idTheme: freezed == idTheme
          ? _self.idTheme
          : idTheme // ignore: cast_nullable_to_non_nullable
              as String?,
      answerRepoId: freezed == answerRepoId
          ? _self.answerRepoId
          : answerRepoId // ignore: cast_nullable_to_non_nullable
              as String?,
      numberAsked: freezed == numberAsked
          ? _self.numberAsked
          : numberAsked // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: null == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QvstAnswerEntity>,
      isReversed: null == isReversed
          ? _self.isReversed
          : isReversed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
