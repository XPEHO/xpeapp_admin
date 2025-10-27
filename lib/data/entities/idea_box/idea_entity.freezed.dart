// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'idea_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IdeaEntity _$IdeaEntityFromJson(Map<String, dynamic> json) {
  return _IdeaEntity.fromJson(json);
}

/// @nodoc
mixin _$IdeaEntity {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this IdeaEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IdeaEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdeaEntityCopyWith<IdeaEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaEntityCopyWith<$Res> {
  factory $IdeaEntityCopyWith(
          IdeaEntity value, $Res Function(IdeaEntity) then) =
      _$IdeaEntityCopyWithImpl<$Res, IdeaEntity>;
  @useResult
  $Res call(
      {String id,
      String description,
      String context,
      @JsonKey(name: 'created_at') DateTime createdAt,
      String status});
}

/// @nodoc
class _$IdeaEntityCopyWithImpl<$Res, $Val extends IdeaEntity>
    implements $IdeaEntityCopyWith<$Res> {
  _$IdeaEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdeaEntityImplCopyWith<$Res>
    implements $IdeaEntityCopyWith<$Res> {
  factory _$$IdeaEntityImplCopyWith(
          _$IdeaEntityImpl value, $Res Function(_$IdeaEntityImpl) then) =
      __$$IdeaEntityImplCopyWithImpl<$Res>;
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
class __$$IdeaEntityImplCopyWithImpl<$Res>
    extends _$IdeaEntityCopyWithImpl<$Res, _$IdeaEntityImpl>
    implements _$$IdeaEntityImplCopyWith<$Res> {
  __$$IdeaEntityImplCopyWithImpl(
      _$IdeaEntityImpl _value, $Res Function(_$IdeaEntityImpl) _then)
      : super(_value, _then);

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
    return _then(_$IdeaEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$IdeaEntityImpl implements _IdeaEntity {
  const _$IdeaEntityImpl(
      {required this.id,
      required this.description,
      required this.context,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.status});

  factory _$IdeaEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdeaEntityImplFromJson(json);

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

  @override
  String toString() {
    return 'IdeaEntity(id: $id, description: $description, context: $context, createdAt: $createdAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaEntityImpl &&
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

  /// Create a copy of IdeaEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaEntityImplCopyWith<_$IdeaEntityImpl> get copyWith =>
      __$$IdeaEntityImplCopyWithImpl<_$IdeaEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdeaEntityImplToJson(
      this,
    );
  }
}

abstract class _IdeaEntity implements IdeaEntity {
  const factory _IdeaEntity(
      {required final String id,
      required final String description,
      required final String context,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      required final String status}) = _$IdeaEntityImpl;

  factory _IdeaEntity.fromJson(Map<String, dynamic> json) =
      _$IdeaEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get description;
  @override
  String get context;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  String get status;

  /// Create a copy of IdeaEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdeaEntityImplCopyWith<_$IdeaEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
