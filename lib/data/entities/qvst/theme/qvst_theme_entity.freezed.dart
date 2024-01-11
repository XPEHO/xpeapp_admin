// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_theme_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QvstThemeEntity _$QvstThemeEntityFromJson(Map<String, dynamic> json) {
  return _QvstThemeEntity.fromJson(json);
}

/// @nodoc
mixin _$QvstThemeEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QvstThemeEntityCopyWith<QvstThemeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QvstThemeEntityCopyWith<$Res> {
  factory $QvstThemeEntityCopyWith(
          QvstThemeEntity value, $Res Function(QvstThemeEntity) then) =
      _$QvstThemeEntityCopyWithImpl<$Res, QvstThemeEntity>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$QvstThemeEntityCopyWithImpl<$Res, $Val extends QvstThemeEntity>
    implements $QvstThemeEntityCopyWith<$Res> {
  _$QvstThemeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QvstThemeEntityImplCopyWith<$Res>
    implements $QvstThemeEntityCopyWith<$Res> {
  factory _$$QvstThemeEntityImplCopyWith(_$QvstThemeEntityImpl value,
          $Res Function(_$QvstThemeEntityImpl) then) =
      __$$QvstThemeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$QvstThemeEntityImplCopyWithImpl<$Res>
    extends _$QvstThemeEntityCopyWithImpl<$Res, _$QvstThemeEntityImpl>
    implements _$$QvstThemeEntityImplCopyWith<$Res> {
  __$$QvstThemeEntityImplCopyWithImpl(
      _$QvstThemeEntityImpl _value, $Res Function(_$QvstThemeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$QvstThemeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QvstThemeEntityImpl implements _QvstThemeEntity {
  _$QvstThemeEntityImpl({required this.id, required this.name});

  factory _$QvstThemeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QvstThemeEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'QvstThemeEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QvstThemeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QvstThemeEntityImplCopyWith<_$QvstThemeEntityImpl> get copyWith =>
      __$$QvstThemeEntityImplCopyWithImpl<_$QvstThemeEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QvstThemeEntityImplToJson(
      this,
    );
  }
}

abstract class _QvstThemeEntity implements QvstThemeEntity {
  factory _QvstThemeEntity(
      {required final String id,
      required final String name}) = _$QvstThemeEntityImpl;

  factory _QvstThemeEntity.fromJson(Map<String, dynamic> json) =
      _$QvstThemeEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$QvstThemeEntityImplCopyWith<_$QvstThemeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
