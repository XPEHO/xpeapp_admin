// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_answer_repo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QvstAnswerRepoEntity _$QvstAnswerRepoEntityFromJson(Map<String, dynamic> json) {
  return _QvstAnswerRepoEntity.fromJson(json);
}

/// @nodoc
mixin _$QvstAnswerRepoEntity {
  String get id => throw _privateConstructorUsedError;
  String get repoName => throw _privateConstructorUsedError;
  List<QvstAnswerEntity> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QvstAnswerRepoEntityCopyWith<QvstAnswerRepoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QvstAnswerRepoEntityCopyWith<$Res> {
  factory $QvstAnswerRepoEntityCopyWith(QvstAnswerRepoEntity value,
          $Res Function(QvstAnswerRepoEntity) then) =
      _$QvstAnswerRepoEntityCopyWithImpl<$Res, QvstAnswerRepoEntity>;
  @useResult
  $Res call({String id, String repoName, List<QvstAnswerEntity> answers});
}

/// @nodoc
class _$QvstAnswerRepoEntityCopyWithImpl<$Res,
        $Val extends QvstAnswerRepoEntity>
    implements $QvstAnswerRepoEntityCopyWith<$Res> {
  _$QvstAnswerRepoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repoName = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repoName: null == repoName
          ? _value.repoName
          : repoName // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QvstAnswerEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QvstAnswerRepoEntityImplCopyWith<$Res>
    implements $QvstAnswerRepoEntityCopyWith<$Res> {
  factory _$$QvstAnswerRepoEntityImplCopyWith(_$QvstAnswerRepoEntityImpl value,
          $Res Function(_$QvstAnswerRepoEntityImpl) then) =
      __$$QvstAnswerRepoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String repoName, List<QvstAnswerEntity> answers});
}

/// @nodoc
class __$$QvstAnswerRepoEntityImplCopyWithImpl<$Res>
    extends _$QvstAnswerRepoEntityCopyWithImpl<$Res, _$QvstAnswerRepoEntityImpl>
    implements _$$QvstAnswerRepoEntityImplCopyWith<$Res> {
  __$$QvstAnswerRepoEntityImplCopyWithImpl(_$QvstAnswerRepoEntityImpl _value,
      $Res Function(_$QvstAnswerRepoEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repoName = null,
    Object? answers = null,
  }) {
    return _then(_$QvstAnswerRepoEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repoName: null == repoName
          ? _value.repoName
          : repoName // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QvstAnswerEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QvstAnswerRepoEntityImpl implements _QvstAnswerRepoEntity {
  _$QvstAnswerRepoEntityImpl(
      {required this.id,
      required this.repoName,
      required final List<QvstAnswerEntity> answers})
      : _answers = answers;

  factory _$QvstAnswerRepoEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QvstAnswerRepoEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String repoName;
  final List<QvstAnswerEntity> _answers;
  @override
  List<QvstAnswerEntity> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'QvstAnswerRepoEntity(id: $id, repoName: $repoName, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QvstAnswerRepoEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repoName, repoName) ||
                other.repoName == repoName) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, repoName, const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QvstAnswerRepoEntityImplCopyWith<_$QvstAnswerRepoEntityImpl>
      get copyWith =>
          __$$QvstAnswerRepoEntityImplCopyWithImpl<_$QvstAnswerRepoEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QvstAnswerRepoEntityImplToJson(
      this,
    );
  }
}

abstract class _QvstAnswerRepoEntity implements QvstAnswerRepoEntity {
  factory _QvstAnswerRepoEntity(
          {required final String id,
          required final String repoName,
          required final List<QvstAnswerEntity> answers}) =
      _$QvstAnswerRepoEntityImpl;

  factory _QvstAnswerRepoEntity.fromJson(Map<String, dynamic> json) =
      _$QvstAnswerRepoEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get repoName;
  @override
  List<QvstAnswerEntity> get answers;
  @override
  @JsonKey(ignore: true)
  _$$QvstAnswerRepoEntityImplCopyWith<_$QvstAnswerRepoEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
