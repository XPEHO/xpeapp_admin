// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_answer_repo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QvstAnswerRepoEntity {
  String get id;
  String get repoName;
  List<QvstAnswerEntity> get answers;

  /// Create a copy of QvstAnswerRepoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QvstAnswerRepoEntityCopyWith<QvstAnswerRepoEntity> get copyWith =>
      _$QvstAnswerRepoEntityCopyWithImpl<QvstAnswerRepoEntity>(
          this as QvstAnswerRepoEntity, _$identity);

  /// Serializes this QvstAnswerRepoEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QvstAnswerRepoEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repoName, repoName) ||
                other.repoName == repoName) &&
            const DeepCollectionEquality().equals(other.answers, answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, repoName, const DeepCollectionEquality().hash(answers));

  @override
  String toString() {
    return 'QvstAnswerRepoEntity(id: $id, repoName: $repoName, answers: $answers)';
  }
}

/// @nodoc
abstract mixin class $QvstAnswerRepoEntityCopyWith<$Res> {
  factory $QvstAnswerRepoEntityCopyWith(QvstAnswerRepoEntity value,
          $Res Function(QvstAnswerRepoEntity) _then) =
      _$QvstAnswerRepoEntityCopyWithImpl;
  @useResult
  $Res call({String id, String repoName, List<QvstAnswerEntity> answers});
}

/// @nodoc
class _$QvstAnswerRepoEntityCopyWithImpl<$Res>
    implements $QvstAnswerRepoEntityCopyWith<$Res> {
  _$QvstAnswerRepoEntityCopyWithImpl(this._self, this._then);

  final QvstAnswerRepoEntity _self;
  final $Res Function(QvstAnswerRepoEntity) _then;

  /// Create a copy of QvstAnswerRepoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repoName = null,
    Object? answers = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repoName: null == repoName
          ? _self.repoName
          : repoName // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _self.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QvstAnswerEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [QvstAnswerRepoEntity].
extension QvstAnswerRepoEntityPatterns on QvstAnswerRepoEntity {
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
    TResult Function(_QvstAnswerRepoEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerRepoEntity() when $default != null:
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
    TResult Function(_QvstAnswerRepoEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerRepoEntity():
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
    TResult? Function(_QvstAnswerRepoEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerRepoEntity() when $default != null:
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
            String id, String repoName, List<QvstAnswerEntity> answers)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerRepoEntity() when $default != null:
        return $default(_that.id, _that.repoName, _that.answers);
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
    TResult Function(String id, String repoName, List<QvstAnswerEntity> answers)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerRepoEntity():
        return $default(_that.id, _that.repoName, _that.answers);
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
            String id, String repoName, List<QvstAnswerEntity> answers)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerRepoEntity() when $default != null:
        return $default(_that.id, _that.repoName, _that.answers);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QvstAnswerRepoEntity implements QvstAnswerRepoEntity {
  _QvstAnswerRepoEntity(
      {required this.id,
      required this.repoName,
      required final List<QvstAnswerEntity> answers})
      : _answers = answers;
  factory _QvstAnswerRepoEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstAnswerRepoEntityFromJson(json);

  @override
  final String id;
  @override
  final String repoName;
  final List<QvstAnswerEntity> _answers;
  @override
  List<QvstAnswerEntity> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  /// Create a copy of QvstAnswerRepoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QvstAnswerRepoEntityCopyWith<_QvstAnswerRepoEntity> get copyWith =>
      __$QvstAnswerRepoEntityCopyWithImpl<_QvstAnswerRepoEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QvstAnswerRepoEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QvstAnswerRepoEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repoName, repoName) ||
                other.repoName == repoName) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, repoName, const DeepCollectionEquality().hash(_answers));

  @override
  String toString() {
    return 'QvstAnswerRepoEntity(id: $id, repoName: $repoName, answers: $answers)';
  }
}

/// @nodoc
abstract mixin class _$QvstAnswerRepoEntityCopyWith<$Res>
    implements $QvstAnswerRepoEntityCopyWith<$Res> {
  factory _$QvstAnswerRepoEntityCopyWith(_QvstAnswerRepoEntity value,
          $Res Function(_QvstAnswerRepoEntity) _then) =
      __$QvstAnswerRepoEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String repoName, List<QvstAnswerEntity> answers});
}

/// @nodoc
class __$QvstAnswerRepoEntityCopyWithImpl<$Res>
    implements _$QvstAnswerRepoEntityCopyWith<$Res> {
  __$QvstAnswerRepoEntityCopyWithImpl(this._self, this._then);

  final _QvstAnswerRepoEntity _self;
  final $Res Function(_QvstAnswerRepoEntity) _then;

  /// Create a copy of QvstAnswerRepoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? repoName = null,
    Object? answers = null,
  }) {
    return _then(_QvstAnswerRepoEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repoName: null == repoName
          ? _self.repoName
          : repoName // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QvstAnswerEntity>,
    ));
  }
}

// dart format on
