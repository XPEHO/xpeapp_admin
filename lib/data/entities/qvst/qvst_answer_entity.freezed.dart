// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_answer_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QvstAnswerEntity {
  String get id;
  String get answer;
  String get value;
  int? get numberAnswered;

  /// Create a copy of QvstAnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QvstAnswerEntityCopyWith<QvstAnswerEntity> get copyWith =>
      _$QvstAnswerEntityCopyWithImpl<QvstAnswerEntity>(
          this as QvstAnswerEntity, _$identity);

  /// Serializes this QvstAnswerEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QvstAnswerEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.numberAnswered, numberAnswered) ||
                other.numberAnswered == numberAnswered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, answer, value, numberAnswered);

  @override
  String toString() {
    return 'QvstAnswerEntity(id: $id, answer: $answer, value: $value, numberAnswered: $numberAnswered)';
  }
}

/// @nodoc
abstract mixin class $QvstAnswerEntityCopyWith<$Res> {
  factory $QvstAnswerEntityCopyWith(
          QvstAnswerEntity value, $Res Function(QvstAnswerEntity) _then) =
      _$QvstAnswerEntityCopyWithImpl;
  @useResult
  $Res call({String id, String answer, String value, int? numberAnswered});
}

/// @nodoc
class _$QvstAnswerEntityCopyWithImpl<$Res>
    implements $QvstAnswerEntityCopyWith<$Res> {
  _$QvstAnswerEntityCopyWithImpl(this._self, this._then);

  final QvstAnswerEntity _self;
  final $Res Function(QvstAnswerEntity) _then;

  /// Create a copy of QvstAnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? value = null,
    Object? numberAnswered = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      numberAnswered: freezed == numberAnswered
          ? _self.numberAnswered
          : numberAnswered // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QvstAnswerEntity].
extension QvstAnswerEntityPatterns on QvstAnswerEntity {
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
    TResult Function(_QvstAnswerEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerEntity() when $default != null:
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
    TResult Function(_QvstAnswerEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerEntity():
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
    TResult? Function(_QvstAnswerEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerEntity() when $default != null:
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
            String id, String answer, String value, int? numberAnswered)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerEntity() when $default != null:
        return $default(
            _that.id, _that.answer, _that.value, _that.numberAnswered);
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
            String id, String answer, String value, int? numberAnswered)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerEntity():
        return $default(
            _that.id, _that.answer, _that.value, _that.numberAnswered);
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
            String id, String answer, String value, int? numberAnswered)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnswerEntity() when $default != null:
        return $default(
            _that.id, _that.answer, _that.value, _that.numberAnswered);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QvstAnswerEntity implements QvstAnswerEntity {
  _QvstAnswerEntity(
      {required this.id,
      required this.answer,
      required this.value,
      this.numberAnswered});
  factory _QvstAnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstAnswerEntityFromJson(json);

  @override
  final String id;
  @override
  final String answer;
  @override
  final String value;
  @override
  final int? numberAnswered;

  /// Create a copy of QvstAnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QvstAnswerEntityCopyWith<_QvstAnswerEntity> get copyWith =>
      __$QvstAnswerEntityCopyWithImpl<_QvstAnswerEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QvstAnswerEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QvstAnswerEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.numberAnswered, numberAnswered) ||
                other.numberAnswered == numberAnswered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, answer, value, numberAnswered);

  @override
  String toString() {
    return 'QvstAnswerEntity(id: $id, answer: $answer, value: $value, numberAnswered: $numberAnswered)';
  }
}

/// @nodoc
abstract mixin class _$QvstAnswerEntityCopyWith<$Res>
    implements $QvstAnswerEntityCopyWith<$Res> {
  factory _$QvstAnswerEntityCopyWith(
          _QvstAnswerEntity value, $Res Function(_QvstAnswerEntity) _then) =
      __$QvstAnswerEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String answer, String value, int? numberAnswered});
}

/// @nodoc
class __$QvstAnswerEntityCopyWithImpl<$Res>
    implements _$QvstAnswerEntityCopyWith<$Res> {
  __$QvstAnswerEntityCopyWithImpl(this._self, this._then);

  final _QvstAnswerEntity _self;
  final $Res Function(_QvstAnswerEntity) _then;

  /// Create a copy of QvstAnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? value = null,
    Object? numberAnswered = freezed,
  }) {
    return _then(_QvstAnswerEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      numberAnswered: freezed == numberAnswered
          ? _self.numberAnswered
          : numberAnswered // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
