// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_type_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventsTypeEntity {
  String get id;
  String get label;
  @JsonKey(name: 'color_code')
  String get colorCode;

  /// Create a copy of EventsTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventsTypeEntityCopyWith<EventsTypeEntity> get copyWith =>
      _$EventsTypeEntityCopyWithImpl<EventsTypeEntity>(
          this as EventsTypeEntity, _$identity);

  /// Serializes this EventsTypeEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventsTypeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, colorCode);

  @override
  String toString() {
    return 'EventsTypeEntity(id: $id, label: $label, colorCode: $colorCode)';
  }
}

/// @nodoc
abstract mixin class $EventsTypeEntityCopyWith<$Res> {
  factory $EventsTypeEntityCopyWith(
          EventsTypeEntity value, $Res Function(EventsTypeEntity) _then) =
      _$EventsTypeEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id, String label, @JsonKey(name: 'color_code') String colorCode});
}

/// @nodoc
class _$EventsTypeEntityCopyWithImpl<$Res>
    implements $EventsTypeEntityCopyWith<$Res> {
  _$EventsTypeEntityCopyWithImpl(this._self, this._then);

  final EventsTypeEntity _self;
  final $Res Function(EventsTypeEntity) _then;

  /// Create a copy of EventsTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? colorCode = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [EventsTypeEntity].
extension EventsTypeEntityPatterns on EventsTypeEntity {
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
    TResult Function(_EventsTypeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EventsTypeEntity() when $default != null:
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
    TResult Function(_EventsTypeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsTypeEntity():
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
    TResult? Function(_EventsTypeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsTypeEntity() when $default != null:
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
    TResult Function(String id, String label,
            @JsonKey(name: 'color_code') String colorCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EventsTypeEntity() when $default != null:
        return $default(_that.id, _that.label, _that.colorCode);
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
    TResult Function(String id, String label,
            @JsonKey(name: 'color_code') String colorCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsTypeEntity():
        return $default(_that.id, _that.label, _that.colorCode);
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
    TResult? Function(String id, String label,
            @JsonKey(name: 'color_code') String colorCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsTypeEntity() when $default != null:
        return $default(_that.id, _that.label, _that.colorCode);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _EventsTypeEntity implements EventsTypeEntity {
  const _EventsTypeEntity(
      {required this.id,
      required this.label,
      @JsonKey(name: 'color_code') required this.colorCode});
  factory _EventsTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$EventsTypeEntityFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  @JsonKey(name: 'color_code')
  final String colorCode;

  /// Create a copy of EventsTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventsTypeEntityCopyWith<_EventsTypeEntity> get copyWith =>
      __$EventsTypeEntityCopyWithImpl<_EventsTypeEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EventsTypeEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventsTypeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, colorCode);

  @override
  String toString() {
    return 'EventsTypeEntity(id: $id, label: $label, colorCode: $colorCode)';
  }
}

/// @nodoc
abstract mixin class _$EventsTypeEntityCopyWith<$Res>
    implements $EventsTypeEntityCopyWith<$Res> {
  factory _$EventsTypeEntityCopyWith(
          _EventsTypeEntity value, $Res Function(_EventsTypeEntity) _then) =
      __$EventsTypeEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id, String label, @JsonKey(name: 'color_code') String colorCode});
}

/// @nodoc
class __$EventsTypeEntityCopyWithImpl<$Res>
    implements _$EventsTypeEntityCopyWith<$Res> {
  __$EventsTypeEntityCopyWithImpl(this._self, this._then);

  final _EventsTypeEntity _self;
  final $Res Function(_EventsTypeEntity) _then;

  /// Create a copy of EventsTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? colorCode = null,
  }) {
    return _then(_EventsTypeEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
