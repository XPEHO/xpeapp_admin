// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventsEntity _$EventsEntityFromJson(Map<String, dynamic> json) {
  return _EventsEntity.fromJson(json);
}

/// @nodoc
mixin _$EventsEntity {
  String? get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String? get start_time => throw _privateConstructorUsedError;
  String? get end_time => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  EventsTypeEntity get type => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;

  /// Serializes this EventsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventsEntityCopyWith<EventsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsEntityCopyWith<$Res> {
  factory $EventsEntityCopyWith(
          EventsEntity value, $Res Function(EventsEntity) then) =
      _$EventsEntityCopyWithImpl<$Res, EventsEntity>;
  @useResult
  $Res call(
      {String? id,
      String date,
      String? start_time,
      String? end_time,
      String title,
      String? location,
      EventsTypeEntity type,
      String? topic});

  $EventsTypeEntityCopyWith<$Res> get type;
}

/// @nodoc
class _$EventsEntityCopyWithImpl<$Res, $Val extends EventsEntity>
    implements $EventsEntityCopyWith<$Res> {
  _$EventsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? start_time = freezed,
    Object? end_time = freezed,
    Object? title = null,
    Object? location = freezed,
    Object? type = null,
    Object? topic = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      start_time: freezed == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as String?,
      end_time: freezed == end_time
          ? _value.end_time
          : end_time // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventsTypeEntity,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventsTypeEntityCopyWith<$Res> get type {
    return $EventsTypeEntityCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventsEntityImplCopyWith<$Res>
    implements $EventsEntityCopyWith<$Res> {
  factory _$$EventsEntityImplCopyWith(
          _$EventsEntityImpl value, $Res Function(_$EventsEntityImpl) then) =
      __$$EventsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String date,
      String? start_time,
      String? end_time,
      String title,
      String? location,
      EventsTypeEntity type,
      String? topic});

  @override
  $EventsTypeEntityCopyWith<$Res> get type;
}

/// @nodoc
class __$$EventsEntityImplCopyWithImpl<$Res>
    extends _$EventsEntityCopyWithImpl<$Res, _$EventsEntityImpl>
    implements _$$EventsEntityImplCopyWith<$Res> {
  __$$EventsEntityImplCopyWithImpl(
      _$EventsEntityImpl _value, $Res Function(_$EventsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? start_time = freezed,
    Object? end_time = freezed,
    Object? title = null,
    Object? location = freezed,
    Object? type = null,
    Object? topic = freezed,
  }) {
    return _then(_$EventsEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      start_time: freezed == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as String?,
      end_time: freezed == end_time
          ? _value.end_time
          : end_time // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventsTypeEntity,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EventsEntityImpl implements _EventsEntity {
  const _$EventsEntityImpl(
      {this.id,
      required this.date,
      this.start_time,
      this.end_time,
      required this.title,
      this.location,
      required this.type,
      this.topic});

  factory _$EventsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventsEntityImplFromJson(json);

  @override
  final String? id;
  @override
  final String date;
  @override
  final String? start_time;
  @override
  final String? end_time;
  @override
  final String title;
  @override
  final String? location;
  @override
  final EventsTypeEntity type;
  @override
  final String? topic;

  @override
  String toString() {
    return 'EventsEntity(id: $id, date: $date, start_time: $start_time, end_time: $end_time, title: $title, location: $location, type: $type, topic: $topic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.start_time, start_time) ||
                other.start_time == start_time) &&
            (identical(other.end_time, end_time) ||
                other.end_time == end_time) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.topic, topic) || other.topic == topic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, start_time, end_time,
      title, location, type, topic);

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventsEntityImplCopyWith<_$EventsEntityImpl> get copyWith =>
      __$$EventsEntityImplCopyWithImpl<_$EventsEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventsEntityImplToJson(
      this,
    );
  }
}

abstract class _EventsEntity implements EventsEntity {
  const factory _EventsEntity(
      {final String? id,
      required final String date,
      final String? start_time,
      final String? end_time,
      required final String title,
      final String? location,
      required final EventsTypeEntity type,
      final String? topic}) = _$EventsEntityImpl;

  factory _EventsEntity.fromJson(Map<String, dynamic> json) =
      _$EventsEntityImpl.fromJson;

  @override
  String? get id;
  @override
  String get date;
  @override
  String? get start_time;
  @override
  String? get end_time;
  @override
  String get title;
  @override
  String? get location;
  @override
  EventsTypeEntity get type;
  @override
  String? get topic;

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventsEntityImplCopyWith<_$EventsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
