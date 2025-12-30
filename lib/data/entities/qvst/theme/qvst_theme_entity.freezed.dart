// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_theme_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QvstThemeEntity {
  @JsonKey(defaultValue: '')
  String get id;
  @JsonKey(defaultValue: '')
  String get name;

  /// Create a copy of QvstThemeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QvstThemeEntityCopyWith<QvstThemeEntity> get copyWith =>
      _$QvstThemeEntityCopyWithImpl<QvstThemeEntity>(
          this as QvstThemeEntity, _$identity);

  /// Serializes this QvstThemeEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QvstThemeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'QvstThemeEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $QvstThemeEntityCopyWith<$Res> {
  factory $QvstThemeEntityCopyWith(
          QvstThemeEntity value, $Res Function(QvstThemeEntity) _then) =
      _$QvstThemeEntityCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String id,
      @JsonKey(defaultValue: '') String name});
}

/// @nodoc
class _$QvstThemeEntityCopyWithImpl<$Res>
    implements $QvstThemeEntityCopyWith<$Res> {
  _$QvstThemeEntityCopyWithImpl(this._self, this._then);

  final QvstThemeEntity _self;
  final $Res Function(QvstThemeEntity) _then;

  /// Create a copy of QvstThemeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [QvstThemeEntity].
extension QvstThemeEntityPatterns on QvstThemeEntity {
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
    TResult Function(_QvstThemeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstThemeEntity() when $default != null:
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
    TResult Function(_QvstThemeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstThemeEntity():
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
    TResult? Function(_QvstThemeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstThemeEntity() when $default != null:
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
    TResult Function(@JsonKey(defaultValue: '') String id,
            @JsonKey(defaultValue: '') String name)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstThemeEntity() when $default != null:
        return $default(_that.id, _that.name);
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
    TResult Function(@JsonKey(defaultValue: '') String id,
            @JsonKey(defaultValue: '') String name)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstThemeEntity():
        return $default(_that.id, _that.name);
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
    TResult? Function(@JsonKey(defaultValue: '') String id,
            @JsonKey(defaultValue: '') String name)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstThemeEntity() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QvstThemeEntity implements QvstThemeEntity {
  _QvstThemeEntity(
      {@JsonKey(defaultValue: '') required this.id,
      @JsonKey(defaultValue: '') required this.name});
  factory _QvstThemeEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstThemeEntityFromJson(json);

  @override
  @JsonKey(defaultValue: '')
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String name;

  /// Create a copy of QvstThemeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QvstThemeEntityCopyWith<_QvstThemeEntity> get copyWith =>
      __$QvstThemeEntityCopyWithImpl<_QvstThemeEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QvstThemeEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QvstThemeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'QvstThemeEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$QvstThemeEntityCopyWith<$Res>
    implements $QvstThemeEntityCopyWith<$Res> {
  factory _$QvstThemeEntityCopyWith(
          _QvstThemeEntity value, $Res Function(_QvstThemeEntity) _then) =
      __$QvstThemeEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String id,
      @JsonKey(defaultValue: '') String name});
}

/// @nodoc
class __$QvstThemeEntityCopyWithImpl<$Res>
    implements _$QvstThemeEntityCopyWith<$Res> {
  __$QvstThemeEntityCopyWithImpl(this._self, this._then);

  final _QvstThemeEntity _self;
  final $Res Function(_QvstThemeEntity) _then;

  /// Create a copy of QvstThemeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_QvstThemeEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
