// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_connexion_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LastConnexionUser {
  @JsonKey(name: 'last_connection')
  DateTime get lastConnexion;
  @JsonKey(name: 'first_name')
  String get firstname;
  @JsonKey(name: 'last_name')
  String get lastname;

  /// Create a copy of LastConnexionUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LastConnexionUserCopyWith<LastConnexionUser> get copyWith =>
      _$LastConnexionUserCopyWithImpl<LastConnexionUser>(
          this as LastConnexionUser, _$identity);

  /// Serializes this LastConnexionUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LastConnexionUser &&
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
    return 'LastConnexionUser(lastConnexion: $lastConnexion, firstname: $firstname, lastname: $lastname)';
  }
}

/// @nodoc
abstract mixin class $LastConnexionUserCopyWith<$Res> {
  factory $LastConnexionUserCopyWith(
          LastConnexionUser value, $Res Function(LastConnexionUser) _then) =
      _$LastConnexionUserCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'last_connection') DateTime lastConnexion,
      @JsonKey(name: 'first_name') String firstname,
      @JsonKey(name: 'last_name') String lastname});
}

/// @nodoc
class _$LastConnexionUserCopyWithImpl<$Res>
    implements $LastConnexionUserCopyWith<$Res> {
  _$LastConnexionUserCopyWithImpl(this._self, this._then);

  final LastConnexionUser _self;
  final $Res Function(LastConnexionUser) _then;

  /// Create a copy of LastConnexionUser
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

/// Adds pattern-matching-related methods to [LastConnexionUser].
extension LastConnexionUserPatterns on LastConnexionUser {
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
    TResult Function(_LastConnexionUser value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LastConnexionUser() when $default != null:
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
    TResult Function(_LastConnexionUser value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastConnexionUser():
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
    TResult? Function(_LastConnexionUser value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastConnexionUser() when $default != null:
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
      case _LastConnexionUser() when $default != null:
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
      case _LastConnexionUser():
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
      case _LastConnexionUser() when $default != null:
        return $default(_that.lastConnexion, _that.firstname, _that.lastname);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _LastConnexionUser implements LastConnexionUser {
  const _LastConnexionUser(
      {@JsonKey(name: 'last_connection') required this.lastConnexion,
      @JsonKey(name: 'first_name') required this.firstname,
      @JsonKey(name: 'last_name') required this.lastname});
  factory _LastConnexionUser.fromJson(Map<String, dynamic> json) =>
      _$LastConnexionUserFromJson(json);

  @override
  @JsonKey(name: 'last_connection')
  final DateTime lastConnexion;
  @override
  @JsonKey(name: 'first_name')
  final String firstname;
  @override
  @JsonKey(name: 'last_name')
  final String lastname;

  /// Create a copy of LastConnexionUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LastConnexionUserCopyWith<_LastConnexionUser> get copyWith =>
      __$LastConnexionUserCopyWithImpl<_LastConnexionUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LastConnexionUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LastConnexionUser &&
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
    return 'LastConnexionUser(lastConnexion: $lastConnexion, firstname: $firstname, lastname: $lastname)';
  }
}

/// @nodoc
abstract mixin class _$LastConnexionUserCopyWith<$Res>
    implements $LastConnexionUserCopyWith<$Res> {
  factory _$LastConnexionUserCopyWith(
          _LastConnexionUser value, $Res Function(_LastConnexionUser) _then) =
      __$LastConnexionUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'last_connection') DateTime lastConnexion,
      @JsonKey(name: 'first_name') String firstname,
      @JsonKey(name: 'last_name') String lastname});
}

/// @nodoc
class __$LastConnexionUserCopyWithImpl<$Res>
    implements _$LastConnexionUserCopyWith<$Res> {
  __$LastConnexionUserCopyWithImpl(this._self, this._then);

  final _LastConnexionUser _self;
  final $Res Function(_LastConnexionUser) _then;

  /// Create a copy of LastConnexionUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lastConnexion = null,
    Object? firstname = null,
    Object? lastname = null,
  }) {
    return _then(_LastConnexionUser(
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
