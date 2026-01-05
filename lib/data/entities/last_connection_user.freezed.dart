// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_connection_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LastConnectionUser {
  @JsonKey(name: 'last_connection')
  DateTime get lastConnexion;
  @JsonKey(name: 'first_name')
  String get firstname;
  @JsonKey(name: 'last_name')
  String get lastname;

  /// Create a copy of LastConnectionUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LastConnectionUserCopyWith<LastConnectionUser> get copyWith =>
      _$LastConnectionUserCopyWithImpl<LastConnectionUser>(
          this as LastConnectionUser, _$identity);

  /// Serializes this LastConnectionUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LastConnectionUser &&
            (identical(other.lastConnexion, lastConnexion) ||
                other.lastConnexion == lastConnexion) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lastConnexion, firstname, lastname);

  @override
  String toString() {
    return 'LastConnectionUser(lastConnexion: $lastConnexion, firstname: $firstname, lastname: $lastname)';
  }
}

/// @nodoc
abstract mixin class $LastConnectionUserCopyWith<$Res> {
  factory $LastConnectionUserCopyWith(
          LastConnectionUser value, $Res Function(LastConnectionUser) _then) =
      _$LastConnectionUserCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'last_connection') DateTime lastConnexion,
      @JsonKey(name: 'first_name') String firstname,
      @JsonKey(name: 'last_name') String lastname});
}

/// @nodoc
class _$LastConnectionUserCopyWithImpl<$Res>
    implements $LastConnectionUserCopyWith<$Res> {
  _$LastConnectionUserCopyWithImpl(this._self, this._then);

  final LastConnectionUser _self;
  final $Res Function(LastConnectionUser) _then;

  /// Create a copy of LastConnectionUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastConnexion = null,
    Object? firstname = null,
    Object? lastname = null,
  }) {
    return _then(_self.copyWith(
      lastConnexion: null == lastConnexion
          ? _self.lastConnexion
          : lastConnexion // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firstname: null == firstname
          ? _self.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _self.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [LastConnectionUser].
extension LastConnectionUserPatterns on LastConnectionUser {
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
    TResult Function(_LastConnectionUser value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LastConnectionUser() when $default != null:
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
    TResult Function(_LastConnectionUser value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastConnectionUser():
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
    TResult? Function(_LastConnectionUser value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastConnectionUser() when $default != null:
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
            @JsonKey(name: 'last_connection') DateTime lastConnexion,
            @JsonKey(name: 'first_name') String firstname,
            @JsonKey(name: 'last_name') String lastname)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LastConnectionUser() when $default != null:
        return $default(_that.lastConnexion, _that.firstname, _that.lastname);
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
            @JsonKey(name: 'last_connection') DateTime lastConnexion,
            @JsonKey(name: 'first_name') String firstname,
            @JsonKey(name: 'last_name') String lastname)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastConnectionUser():
        return $default(_that.lastConnexion, _that.firstname, _that.lastname);
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
            @JsonKey(name: 'last_connection') DateTime lastConnexion,
            @JsonKey(name: 'first_name') String firstname,
            @JsonKey(name: 'last_name') String lastname)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastConnectionUser() when $default != null:
        return $default(_that.lastConnexion, _that.firstname, _that.lastname);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _LastConnectionUser implements LastConnectionUser {
  const _LastConnectionUser(
      {@JsonKey(name: 'last_connection') required this.lastConnexion,
      @JsonKey(name: 'first_name') required this.firstname,
      @JsonKey(name: 'last_name') required this.lastname});
  factory _LastConnectionUser.fromJson(Map<String, dynamic> json) =>
      _$LastConnectionUserFromJson(json);

  @override
  @JsonKey(name: 'last_connection')
  final DateTime lastConnexion;
  @override
  @JsonKey(name: 'first_name')
  final String firstname;
  @override
  @JsonKey(name: 'last_name')
  final String lastname;

  /// Create a copy of LastConnectionUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LastConnectionUserCopyWith<_LastConnectionUser> get copyWith =>
      __$LastConnectionUserCopyWithImpl<_LastConnectionUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LastConnectionUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LastConnectionUser &&
            (identical(other.lastConnexion, lastConnexion) ||
                other.lastConnexion == lastConnexion) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lastConnexion, firstname, lastname);

  @override
  String toString() {
    return 'LastConnectionUser(lastConnexion: $lastConnexion, firstname: $firstname, lastname: $lastname)';
  }
}

/// @nodoc
abstract mixin class _$LastConnectionUserCopyWith<$Res>
    implements $LastConnectionUserCopyWith<$Res> {
  factory _$LastConnectionUserCopyWith(
          _LastConnectionUser value, $Res Function(_LastConnectionUser) _then) =
      __$LastConnectionUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'last_connection') DateTime lastConnexion,
      @JsonKey(name: 'first_name') String firstname,
      @JsonKey(name: 'last_name') String lastname});
}

/// @nodoc
class __$LastConnectionUserCopyWithImpl<$Res>
    implements _$LastConnectionUserCopyWith<$Res> {
  __$LastConnectionUserCopyWithImpl(this._self, this._then);

  final _LastConnectionUser _self;
  final $Res Function(_LastConnectionUser) _then;

  /// Create a copy of LastConnectionUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lastConnexion = null,
    Object? firstname = null,
    Object? lastname = null,
  }) {
    return _then(_LastConnectionUser(
      lastConnexion: null == lastConnexion
          ? _self.lastConnexion
          : lastConnexion // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firstname: null == firstname
          ? _self.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _self.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
