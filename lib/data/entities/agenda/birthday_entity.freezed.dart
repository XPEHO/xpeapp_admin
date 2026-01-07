// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'birthday_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BirthdayEntity {
  String get id;
  @JsonKey(name: 'first_name')
  String get firstName;
  DateTime get birthdate;
  String? get email;

  /// Create a copy of BirthdayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BirthdayEntityCopyWith<BirthdayEntity> get copyWith =>
      _$BirthdayEntityCopyWithImpl<BirthdayEntity>(
          this as BirthdayEntity, _$identity);

  /// Serializes this BirthdayEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BirthdayEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, birthdate, email);

  @override
  String toString() {
    return 'BirthdayEntity(id: $id, firstName: $firstName, birthdate: $birthdate, email: $email)';
  }
}

/// @nodoc
abstract mixin class $BirthdayEntityCopyWith<$Res> {
  factory $BirthdayEntityCopyWith(
          BirthdayEntity value, $Res Function(BirthdayEntity) _then) =
      _$BirthdayEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      DateTime birthdate,
      String? email});
}

/// @nodoc
class _$BirthdayEntityCopyWithImpl<$Res>
    implements $BirthdayEntityCopyWith<$Res> {
  _$BirthdayEntityCopyWithImpl(this._self, this._then);

  final BirthdayEntity _self;
  final $Res Function(BirthdayEntity) _then;

  /// Create a copy of BirthdayEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? birthdate = null,
    Object? email = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _self.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BirthdayEntity].
extension BirthdayEntityPatterns on BirthdayEntity {
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
    TResult Function(_BirthdayEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BirthdayEntity() when $default != null:
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
    TResult Function(_BirthdayEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BirthdayEntity():
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
    TResult? Function(_BirthdayEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BirthdayEntity() when $default != null:
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
    TResult Function(String id, @JsonKey(name: 'first_name') String firstName,
            DateTime birthdate, String? email)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BirthdayEntity() when $default != null:
        return $default(
            _that.id, _that.firstName, _that.birthdate, _that.email);
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
    TResult Function(String id, @JsonKey(name: 'first_name') String firstName,
            DateTime birthdate, String? email)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BirthdayEntity():
        return $default(
            _that.id, _that.firstName, _that.birthdate, _that.email);
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
    TResult? Function(String id, @JsonKey(name: 'first_name') String firstName,
            DateTime birthdate, String? email)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BirthdayEntity() when $default != null:
        return $default(
            _that.id, _that.firstName, _that.birthdate, _that.email);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BirthdayEntity implements BirthdayEntity {
  const _BirthdayEntity(
      {required this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      required this.birthdate,
      this.email});
  factory _BirthdayEntity.fromJson(Map<String, dynamic> json) =>
      _$BirthdayEntityFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  final DateTime birthdate;
  @override
  final String? email;

  /// Create a copy of BirthdayEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BirthdayEntityCopyWith<_BirthdayEntity> get copyWith =>
      __$BirthdayEntityCopyWithImpl<_BirthdayEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BirthdayEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BirthdayEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, birthdate, email);

  @override
  String toString() {
    return 'BirthdayEntity(id: $id, firstName: $firstName, birthdate: $birthdate, email: $email)';
  }
}

/// @nodoc
abstract mixin class _$BirthdayEntityCopyWith<$Res>
    implements $BirthdayEntityCopyWith<$Res> {
  factory _$BirthdayEntityCopyWith(
          _BirthdayEntity value, $Res Function(_BirthdayEntity) _then) =
      __$BirthdayEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      DateTime birthdate,
      String? email});
}

/// @nodoc
class __$BirthdayEntityCopyWithImpl<$Res>
    implements _$BirthdayEntityCopyWith<$Res> {
  __$BirthdayEntityCopyWithImpl(this._self, this._then);

  final _BirthdayEntity _self;
  final $Res Function(_BirthdayEntity) _then;

  /// Create a copy of BirthdayEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? birthdate = null,
    Object? email = freezed,
  }) {
    return _then(_BirthdayEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _self.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
