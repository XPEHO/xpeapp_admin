// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_question_sample.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QvstQuestionSample {
  @JsonKey(name: 'id')
  String get id;
  @JsonKey(name: 'id_theme')
  String get idTheme;
  @JsonKey(name: 'question')
  String get question;
  @JsonKey(name: 'response_repo')
  String get responseRepo;
  @JsonKey(name: 'reversed_question')
  bool get reversedQuestion;
  @JsonKey(name: 'no_longer_used')
  bool get noLongerUsed;

  /// Create a copy of QvstQuestionSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QvstQuestionSampleCopyWith<QvstQuestionSample> get copyWith =>
      _$QvstQuestionSampleCopyWithImpl<QvstQuestionSample>(
          this as QvstQuestionSample, _$identity);

  /// Serializes this QvstQuestionSample to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QvstQuestionSample &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idTheme, idTheme) || other.idTheme == idTheme) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.responseRepo, responseRepo) ||
                other.responseRepo == responseRepo) &&
            (identical(other.reversedQuestion, reversedQuestion) ||
                other.reversedQuestion == reversedQuestion) &&
            (identical(other.noLongerUsed, noLongerUsed) ||
                other.noLongerUsed == noLongerUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, idTheme, question,
      responseRepo, reversedQuestion, noLongerUsed);

  @override
  String toString() {
    return 'QvstQuestionSample(id: $id, idTheme: $idTheme, question: $question, responseRepo: $responseRepo, reversedQuestion: $reversedQuestion, noLongerUsed: $noLongerUsed)';
  }
}

/// @nodoc
abstract mixin class $QvstQuestionSampleCopyWith<$Res> {
  factory $QvstQuestionSampleCopyWith(
          QvstQuestionSample value, $Res Function(QvstQuestionSample) _then) =
      _$QvstQuestionSampleCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'id_theme') String idTheme,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'response_repo') String responseRepo,
      @JsonKey(name: 'reversed_question') bool reversedQuestion,
      @JsonKey(name: 'no_longer_used') bool noLongerUsed});
}

/// @nodoc
class _$QvstQuestionSampleCopyWithImpl<$Res>
    implements $QvstQuestionSampleCopyWith<$Res> {
  _$QvstQuestionSampleCopyWithImpl(this._self, this._then);

  final QvstQuestionSample _self;
  final $Res Function(QvstQuestionSample) _then;

  /// Create a copy of QvstQuestionSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idTheme = null,
    Object? question = null,
    Object? responseRepo = null,
    Object? reversedQuestion = null,
    Object? noLongerUsed = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idTheme: null == idTheme
          ? _self.idTheme
          : idTheme // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      responseRepo: null == responseRepo
          ? _self.responseRepo
          : responseRepo // ignore: cast_nullable_to_non_nullable
              as String,
      reversedQuestion: null == reversedQuestion
          ? _self.reversedQuestion
          : reversedQuestion // ignore: cast_nullable_to_non_nullable
              as bool,
      noLongerUsed: null == noLongerUsed
          ? _self.noLongerUsed
          : noLongerUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [QvstQuestionSample].
extension QvstQuestionSamplePatterns on QvstQuestionSample {
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
    TResult Function(_QvstQuestionSample value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionSample() when $default != null:
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
    TResult Function(_QvstQuestionSample value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionSample():
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
    TResult? Function(_QvstQuestionSample value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionSample() when $default != null:
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'id_theme') String idTheme,
            @JsonKey(name: 'question') String question,
            @JsonKey(name: 'response_repo') String responseRepo,
            @JsonKey(name: 'reversed_question') bool reversedQuestion,
            @JsonKey(name: 'no_longer_used') bool noLongerUsed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionSample() when $default != null:
        return $default(_that.id, _that.idTheme, _that.question,
            _that.responseRepo, _that.reversedQuestion, _that.noLongerUsed);
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'id_theme') String idTheme,
            @JsonKey(name: 'question') String question,
            @JsonKey(name: 'response_repo') String responseRepo,
            @JsonKey(name: 'reversed_question') bool reversedQuestion,
            @JsonKey(name: 'no_longer_used') bool noLongerUsed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionSample():
        return $default(_that.id, _that.idTheme, _that.question,
            _that.responseRepo, _that.reversedQuestion, _that.noLongerUsed);
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'id_theme') String idTheme,
            @JsonKey(name: 'question') String question,
            @JsonKey(name: 'response_repo') String responseRepo,
            @JsonKey(name: 'reversed_question') bool reversedQuestion,
            @JsonKey(name: 'no_longer_used') bool noLongerUsed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstQuestionSample() when $default != null:
        return $default(_that.id, _that.idTheme, _that.question,
            _that.responseRepo, _that.reversedQuestion, _that.noLongerUsed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QvstQuestionSample implements QvstQuestionSample {
  _QvstQuestionSample(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'id_theme') required this.idTheme,
      @JsonKey(name: 'question') required this.question,
      @JsonKey(name: 'response_repo') required this.responseRepo,
      @JsonKey(name: 'reversed_question') required this.reversedQuestion,
      @JsonKey(name: 'no_longer_used') required this.noLongerUsed});
  factory _QvstQuestionSample.fromJson(Map<String, dynamic> json) =>
      _$QvstQuestionSampleFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'id_theme')
  final String idTheme;
  @override
  @JsonKey(name: 'question')
  final String question;
  @override
  @JsonKey(name: 'response_repo')
  final String responseRepo;
  @override
  @JsonKey(name: 'reversed_question')
  final bool reversedQuestion;
  @override
  @JsonKey(name: 'no_longer_used')
  final bool noLongerUsed;

  /// Create a copy of QvstQuestionSample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QvstQuestionSampleCopyWith<_QvstQuestionSample> get copyWith =>
      __$QvstQuestionSampleCopyWithImpl<_QvstQuestionSample>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QvstQuestionSampleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QvstQuestionSample &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idTheme, idTheme) || other.idTheme == idTheme) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.responseRepo, responseRepo) ||
                other.responseRepo == responseRepo) &&
            (identical(other.reversedQuestion, reversedQuestion) ||
                other.reversedQuestion == reversedQuestion) &&
            (identical(other.noLongerUsed, noLongerUsed) ||
                other.noLongerUsed == noLongerUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, idTheme, question,
      responseRepo, reversedQuestion, noLongerUsed);

  @override
  String toString() {
    return 'QvstQuestionSample(id: $id, idTheme: $idTheme, question: $question, responseRepo: $responseRepo, reversedQuestion: $reversedQuestion, noLongerUsed: $noLongerUsed)';
  }
}

/// @nodoc
abstract mixin class _$QvstQuestionSampleCopyWith<$Res>
    implements $QvstQuestionSampleCopyWith<$Res> {
  factory _$QvstQuestionSampleCopyWith(
          _QvstQuestionSample value, $Res Function(_QvstQuestionSample) _then) =
      __$QvstQuestionSampleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'id_theme') String idTheme,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'response_repo') String responseRepo,
      @JsonKey(name: 'reversed_question') bool reversedQuestion,
      @JsonKey(name: 'no_longer_used') bool noLongerUsed});
}

/// @nodoc
class __$QvstQuestionSampleCopyWithImpl<$Res>
    implements _$QvstQuestionSampleCopyWith<$Res> {
  __$QvstQuestionSampleCopyWithImpl(this._self, this._then);

  final _QvstQuestionSample _self;
  final $Res Function(_QvstQuestionSample) _then;

  /// Create a copy of QvstQuestionSample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? idTheme = null,
    Object? question = null,
    Object? responseRepo = null,
    Object? reversedQuestion = null,
    Object? noLongerUsed = null,
  }) {
    return _then(_QvstQuestionSample(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idTheme: null == idTheme
          ? _self.idTheme
          : idTheme // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      responseRepo: null == responseRepo
          ? _self.responseRepo
          : responseRepo // ignore: cast_nullable_to_non_nullable
              as String,
      reversedQuestion: null == reversedQuestion
          ? _self.reversedQuestion
          : reversedQuestion // ignore: cast_nullable_to_non_nullable
              as bool,
      noLongerUsed: null == noLongerUsed
          ? _self.noLongerUsed
          : noLongerUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
