// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_type_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventsTypeEntity _$EventsTypeEntityFromJson(Map<String, dynamic> json) {
  return _EventsTypeEntity.fromJson(json);
}

/// @nodoc
mixin _$EventsTypeEntity {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_code')
  String get colorCode => throw _privateConstructorUsedError;

  /// Serializes this EventsTypeEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventsTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventsTypeEntityCopyWith<EventsTypeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsTypeEntityCopyWith<$Res> {
  factory $EventsTypeEntityCopyWith(
          EventsTypeEntity value, $Res Function(EventsTypeEntity) then) =
      _$EventsTypeEntityCopyWithImpl<$Res, EventsTypeEntity>;
  @useResult
  $Res call(
      {String id, String label, @JsonKey(name: 'color_code') String colorCode});
}

/// @nodoc
class _$EventsTypeEntityCopyWithImpl<$Res, $Val extends EventsTypeEntity>
    implements $EventsTypeEntityCopyWith<$Res> {
  _$EventsTypeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventsTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? colorCode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventsTypeEntityImplCopyWith<$Res>
    implements $EventsTypeEntityCopyWith<$Res> {
  factory _$$EventsTypeEntityImplCopyWith(_$EventsTypeEntityImpl value,
          $Res Function(_$EventsTypeEntityImpl) then) =
      __$$EventsTypeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String label, @JsonKey(name: 'color_code') String colorCode});
}

/// @nodoc
class __$$EventsTypeEntityImplCopyWithImpl<$Res>
    extends _$EventsTypeEntityCopyWithImpl<$Res, _$EventsTypeEntityImpl>
    implements _$$EventsTypeEntityImplCopyWith<$Res> {
  __$$EventsTypeEntityImplCopyWithImpl(_$EventsTypeEntityImpl _value,
      $Res Function(_$EventsTypeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventsTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? colorCode = null,
  }) {
    return _then(_$EventsTypeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EventsTypeEntityImpl implements _EventsTypeEntity {
  const _$EventsTypeEntityImpl(
      {required this.id,
      required this.label,
      @JsonKey(name: 'color_code') required this.colorCode});

  factory _$EventsTypeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventsTypeEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  @JsonKey(name: 'color_code')
  final String colorCode;

  @override
  String toString() {
    return 'EventsTypeEntity(id: $id, label: $label, colorCode: $colorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsTypeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, colorCode);

  /// Create a copy of EventsTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventsTypeEntityImplCopyWith<_$EventsTypeEntityImpl> get copyWith =>
      __$$EventsTypeEntityImplCopyWithImpl<_$EventsTypeEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventsTypeEntityImplToJson(
      this,
    );
  }
}

abstract class _EventsTypeEntity implements EventsTypeEntity {
  const factory _EventsTypeEntity(
          {required final String id,
          required final String label,
          @JsonKey(name: 'color_code') required final String colorCode}) =
      _$EventsTypeEntityImpl;

  factory _EventsTypeEntity.fromJson(Map<String, dynamic> json) =
      _$EventsTypeEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  @JsonKey(name: 'color_code')
  String get colorCode;

  /// Create a copy of EventsTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventsTypeEntityImplCopyWith<_$EventsTypeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
