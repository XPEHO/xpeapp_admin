// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'idea_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IdeaEntity {
  String get id;
  String get description;
  String get context;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  String get status;

  /// Create a copy of IdeaEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IdeaEntityCopyWith<IdeaEntity> get copyWith =>
      _$IdeaEntityCopyWithImpl<IdeaEntity>(this as IdeaEntity, _$identity);

  /// Serializes this IdeaEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IdeaEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, context, createdAt, status);

  @override
  String toString() {
    return 'IdeaEntity(id: $id, description: $description, context: $context, createdAt: $createdAt, status: $status)';
  }
}

/// @nodoc
abstract mixin class $IdeaEntityCopyWith<$Res> {
  factory $IdeaEntityCopyWith(
          IdeaEntity value, $Res Function(IdeaEntity) _then) =
      _$IdeaEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String description,
      String context,
      @JsonKey(name: 'created_at') DateTime createdAt,
      String status});
}

/// @nodoc
class _$IdeaEntityCopyWithImpl<$Res> implements $IdeaEntityCopyWith<$Res> {
  _$IdeaEntityCopyWithImpl(this._self, this._then);

  final IdeaEntity _self;
  final $Res Function(IdeaEntity) _then;

  /// Create a copy of IdeaEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? context = null,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [IdeaEntity].
extension IdeaEntityPatterns on IdeaEntity {
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
    TResult Function(_IdeaEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IdeaEntity() when $default != null:
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
    TResult Function(_IdeaEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdeaEntity():
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
    TResult? Function(_IdeaEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdeaEntity() when $default != null:
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
    TResult Function(String id, String description, String context,
            @JsonKey(name: 'created_at') DateTime createdAt, String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IdeaEntity() when $default != null:
        return $default(_that.id, _that.description, _that.context,
            _that.createdAt, _that.status);
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
    TResult Function(String id, String description, String context,
            @JsonKey(name: 'created_at') DateTime createdAt, String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdeaEntity():
        return $default(_that.id, _that.description, _that.context,
            _that.createdAt, _that.status);
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
    TResult? Function(String id, String description, String context,
            @JsonKey(name: 'created_at') DateTime createdAt, String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdeaEntity() when $default != null:
        return $default(_that.id, _that.description, _that.context,
            _that.createdAt, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _IdeaEntity implements IdeaEntity {
  const _IdeaEntity(
      {required this.id,
      required this.description,
      required this.context,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.status});
  factory _IdeaEntity.fromJson(Map<String, dynamic> json) =>
      _$IdeaEntityFromJson(json);

  @override
  final String id;
  @override
  final String description;
  @override
  final String context;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  final String status;

  /// Create a copy of IdeaEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IdeaEntityCopyWith<_IdeaEntity> get copyWith =>
      __$IdeaEntityCopyWithImpl<_IdeaEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IdeaEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IdeaEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, context, createdAt, status);

  @override
  String toString() {
    return 'IdeaEntity(id: $id, description: $description, context: $context, createdAt: $createdAt, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$IdeaEntityCopyWith<$Res>
    implements $IdeaEntityCopyWith<$Res> {
  factory _$IdeaEntityCopyWith(
          _IdeaEntity value, $Res Function(_IdeaEntity) _then) =
      __$IdeaEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String description,
      String context,
      @JsonKey(name: 'created_at') DateTime createdAt,
      String status});
}

/// @nodoc
class __$IdeaEntityCopyWithImpl<$Res> implements _$IdeaEntityCopyWith<$Res> {
  __$IdeaEntityCopyWithImpl(this._self, this._then);

  final _IdeaEntity _self;
  final $Res Function(_IdeaEntity) _then;

  /// Create a copy of IdeaEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? context = null,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(_IdeaEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
