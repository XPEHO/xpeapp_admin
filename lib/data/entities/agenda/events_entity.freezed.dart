// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventsEntity {
  String? get id;
  DateTime get date;
  @JsonKey(name: 'start_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
  TimeOfDay? get startTime;
  @JsonKey(name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
  TimeOfDay? get endTime;
  String get title;
  String? get location;
  @JsonKey(name: 'type_id')
  String get typeId;
  String? get topic;

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventsEntityCopyWith<EventsEntity> get copyWith =>
      _$EventsEntityCopyWithImpl<EventsEntity>(
          this as EventsEntity, _$identity);

  /// Serializes this EventsEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventsEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.topic, topic) || other.topic == topic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, startTime, endTime,
      title, location, typeId, topic);

  @override
  String toString() {
    return 'EventsEntity(id: $id, date: $date, startTime: $startTime, endTime: $endTime, title: $title, location: $location, typeId: $typeId, topic: $topic)';
  }
}

/// @nodoc
abstract mixin class $EventsEntityCopyWith<$Res> {
  factory $EventsEntityCopyWith(
          EventsEntity value, $Res Function(EventsEntity) _then) =
      _$EventsEntityCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      DateTime date,
      @JsonKey(name: 'start_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
      TimeOfDay? startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
      TimeOfDay? endTime,
      String title,
      String? location,
      @JsonKey(name: 'type_id') String typeId,
      String? topic});
}

/// @nodoc
class _$EventsEntityCopyWithImpl<$Res> implements $EventsEntityCopyWith<$Res> {
  _$EventsEntityCopyWithImpl(this._self, this._then);

  final EventsEntity _self;
  final $Res Function(EventsEntity) _then;

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? title = null,
    Object? location = freezed,
    Object? typeId = null,
    Object? topic = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      typeId: null == typeId
          ? _self.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String,
      topic: freezed == topic
          ? _self.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [EventsEntity].
extension EventsEntityPatterns on EventsEntity {
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
    TResult Function(_EventsEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EventsEntity() when $default != null:
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
    TResult Function(_EventsEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsEntity():
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
    TResult? Function(_EventsEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsEntity() when $default != null:
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
            String? id,
            DateTime date,
            @JsonKey(
                name: 'start_time',
                fromJson: _fromJsonTime,
                toJson: _toJsonTime)
            TimeOfDay? startTime,
            @JsonKey(
                name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
            TimeOfDay? endTime,
            String title,
            String? location,
            @JsonKey(name: 'type_id') String typeId,
            String? topic)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EventsEntity() when $default != null:
        return $default(_that.id, _that.date, _that.startTime, _that.endTime,
            _that.title, _that.location, _that.typeId, _that.topic);
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
            String? id,
            DateTime date,
            @JsonKey(
                name: 'start_time',
                fromJson: _fromJsonTime,
                toJson: _toJsonTime)
            TimeOfDay? startTime,
            @JsonKey(
                name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
            TimeOfDay? endTime,
            String title,
            String? location,
            @JsonKey(name: 'type_id') String typeId,
            String? topic)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsEntity():
        return $default(_that.id, _that.date, _that.startTime, _that.endTime,
            _that.title, _that.location, _that.typeId, _that.topic);
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
            String? id,
            DateTime date,
            @JsonKey(
                name: 'start_time',
                fromJson: _fromJsonTime,
                toJson: _toJsonTime)
            TimeOfDay? startTime,
            @JsonKey(
                name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
            TimeOfDay? endTime,
            String title,
            String? location,
            @JsonKey(name: 'type_id') String typeId,
            String? topic)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsEntity() when $default != null:
        return $default(_that.id, _that.date, _that.startTime, _that.endTime,
            _that.title, _that.location, _that.typeId, _that.topic);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _EventsEntity implements EventsEntity {
  const _EventsEntity(
      {this.id,
      required this.date,
      @JsonKey(name: 'start_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
      this.startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
      this.endTime,
      required this.title,
      this.location,
      @JsonKey(name: 'type_id') required this.typeId,
      this.topic});
  factory _EventsEntity.fromJson(Map<String, dynamic> json) =>
      _$EventsEntityFromJson(json);

  @override
  final String? id;
  @override
  final DateTime date;
  @override
  @JsonKey(name: 'start_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
  final TimeOfDay? startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
  final TimeOfDay? endTime;
  @override
  final String title;
  @override
  final String? location;
  @override
  @JsonKey(name: 'type_id')
  final String typeId;
  @override
  final String? topic;

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventsEntityCopyWith<_EventsEntity> get copyWith =>
      __$EventsEntityCopyWithImpl<_EventsEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EventsEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventsEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.topic, topic) || other.topic == topic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, startTime, endTime,
      title, location, typeId, topic);

  @override
  String toString() {
    return 'EventsEntity(id: $id, date: $date, startTime: $startTime, endTime: $endTime, title: $title, location: $location, typeId: $typeId, topic: $topic)';
  }
}

/// @nodoc
abstract mixin class _$EventsEntityCopyWith<$Res>
    implements $EventsEntityCopyWith<$Res> {
  factory _$EventsEntityCopyWith(
          _EventsEntity value, $Res Function(_EventsEntity) _then) =
      __$EventsEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      DateTime date,
      @JsonKey(name: 'start_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
      TimeOfDay? startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
      TimeOfDay? endTime,
      String title,
      String? location,
      @JsonKey(name: 'type_id') String typeId,
      String? topic});
}

/// @nodoc
class __$EventsEntityCopyWithImpl<$Res>
    implements _$EventsEntityCopyWith<$Res> {
  __$EventsEntityCopyWithImpl(this._self, this._then);

  final _EventsEntity _self;
  final $Res Function(_EventsEntity) _then;

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? title = null,
    Object? location = freezed,
    Object? typeId = null,
    Object? topic = freezed,
  }) {
    return _then(_EventsEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      typeId: null == typeId
          ? _self.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String,
      topic: freezed == topic
          ? _self.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
