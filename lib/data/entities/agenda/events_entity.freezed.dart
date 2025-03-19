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
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
  TimeOfDay? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
  TimeOfDay? get endTime => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_id')
  String get typeId => throw _privateConstructorUsedError;
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
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? title = null,
    Object? location = freezed,
    Object? typeId = null,
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
              as DateTime,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      typeId: null == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? title = null,
    Object? location = freezed,
    Object? typeId = null,
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
              as DateTime,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      typeId: null == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String,
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
      @JsonKey(name: 'start_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
      this.startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
      this.endTime,
      required this.title,
      this.location,
      @JsonKey(name: 'type_id') required this.typeId,
      this.topic});

  factory _$EventsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventsEntityImplFromJson(json);

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

  @override
  String toString() {
    return 'EventsEntity(id: $id, date: $date, startTime: $startTime, endTime: $endTime, title: $title, location: $location, typeId: $typeId, topic: $topic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsEntityImpl &&
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
      required final DateTime date,
      @JsonKey(name: 'start_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
      final TimeOfDay? startTime,
      @JsonKey(name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
      final TimeOfDay? endTime,
      required final String title,
      final String? location,
      @JsonKey(name: 'type_id') required final String typeId,
      final String? topic}) = _$EventsEntityImpl;

  factory _EventsEntity.fromJson(Map<String, dynamic> json) =
      _$EventsEntityImpl.fromJson;

  @override
  String? get id;
  @override
  DateTime get date;
  @override
  @JsonKey(name: 'start_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
  TimeOfDay? get startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
  TimeOfDay? get endTime;
  @override
  String get title;
  @override
  String? get location;
  @override
  @JsonKey(name: 'type_id')
  String get typeId;
  @override
  String? get topic;

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventsEntityImplCopyWith<_$EventsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
