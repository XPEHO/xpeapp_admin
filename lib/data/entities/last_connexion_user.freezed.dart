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
  @JsonKey(name: 'user_nicename')
  String get userNicename;
  @JsonKey(name: 'last_connection')
  DateTime get lastConnexion;

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
            (identical(other.userNicename, userNicename) ||
                other.userNicename == userNicename) &&
            (identical(other.lastConnexion, lastConnexion) ||
                other.lastConnexion == lastConnexion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userNicename, lastConnexion);

  @override
  String toString() {
    return 'LastConnexionUser(userNicename: $userNicename, lastConnexion: $lastConnexion)';
  }
}

/// @nodoc
abstract mixin class $LastConnexionUserCopyWith<$Res> {
  factory $LastConnexionUserCopyWith(
          LastConnexionUser value, $Res Function(LastConnexionUser) _then) =
      _$LastConnexionUserCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_nicename') String userNicename,
      @JsonKey(name: 'last_connection') DateTime lastConnexion});
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
    Object? userNicename = null,
    Object? lastConnexion = null,
  }) {
    return _then(_self.copyWith(
      userNicename: null == userNicename
          ? _self.userNicename
          : userNicename // ignore: cast_nullable_to_non_nullable
              as String,
      lastConnexion: null == lastConnexion
          ? _self.lastConnexion
          : lastConnexion // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
    TResult Function(@JsonKey(name: 'user_nicename') String userNicename,
            @JsonKey(name: 'last_connection') DateTime lastConnexion)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LastConnexionUser() when $default != null:
        return $default(_that.userNicename, _that.lastConnexion);
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
    TResult Function(@JsonKey(name: 'user_nicename') String userNicename,
            @JsonKey(name: 'last_connection') DateTime lastConnexion)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastConnexionUser():
        return $default(_that.userNicename, _that.lastConnexion);
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
    TResult? Function(@JsonKey(name: 'user_nicename') String userNicename,
            @JsonKey(name: 'last_connection') DateTime lastConnexion)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastConnexionUser() when $default != null:
        return $default(_that.userNicename, _that.lastConnexion);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _LastConnexionUser implements LastConnexionUser {
  const _LastConnexionUser(
      {@JsonKey(name: 'user_nicename') required this.userNicename,
      @JsonKey(name: 'last_connection') required this.lastConnexion});
  factory _LastConnexionUser.fromJson(Map<String, dynamic> json) =>
      _$LastConnexionUserFromJson(json);

  @override
  @JsonKey(name: 'user_nicename')
  final String userNicename;
  @override
  @JsonKey(name: 'last_connection')
  final DateTime lastConnexion;

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
            (identical(other.userNicename, userNicename) ||
                other.userNicename == userNicename) &&
            (identical(other.lastConnexion, lastConnexion) ||
                other.lastConnexion == lastConnexion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userNicename, lastConnexion);

  @override
  String toString() {
    return 'LastConnexionUser(userNicename: $userNicename, lastConnexion: $lastConnexion)';
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
      {@JsonKey(name: 'user_nicename') String userNicename,
      @JsonKey(name: 'last_connection') DateTime lastConnexion});
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
    Object? userNicename = null,
    Object? lastConnexion = null,
  }) {
    return _then(_LastConnexionUser(
      userNicename: null == userNicename
          ? _self.userNicename
          : userNicename // ignore: cast_nullable_to_non_nullable
              as String,
      lastConnexion: null == lastConnexion
          ? _self.lastConnexion
          : lastConnexion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
