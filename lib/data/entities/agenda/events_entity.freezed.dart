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
  String? get heure_debut => throw _privateConstructorUsedError;
  String? get heure_fin => throw _privateConstructorUsedError;
  String get titre => throw _privateConstructorUsedError;
  String? get lieu => throw _privateConstructorUsedError;
  String get type_label => throw _privateConstructorUsedError;
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
      String? heure_debut,
      String? heure_fin,
      String titre,
      String? lieu,
      String type_label,
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
    Object? heure_debut = freezed,
    Object? heure_fin = freezed,
    Object? titre = null,
    Object? lieu = freezed,
    Object? type_label = null,
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
      heure_debut: freezed == heure_debut
          ? _value.heure_debut
          : heure_debut // ignore: cast_nullable_to_non_nullable
              as String?,
      heure_fin: freezed == heure_fin
          ? _value.heure_fin
          : heure_fin // ignore: cast_nullable_to_non_nullable
              as String?,
      titre: null == titre
          ? _value.titre
          : titre // ignore: cast_nullable_to_non_nullable
              as String,
      lieu: freezed == lieu
          ? _value.lieu
          : lieu // ignore: cast_nullable_to_non_nullable
              as String?,
      type_label: null == type_label
          ? _value.type_label
          : type_label // ignore: cast_nullable_to_non_nullable
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
      String date,
      String? heure_debut,
      String? heure_fin,
      String titre,
      String? lieu,
      String type_label,
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
    Object? heure_debut = freezed,
    Object? heure_fin = freezed,
    Object? titre = null,
    Object? lieu = freezed,
    Object? type_label = null,
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
      heure_debut: freezed == heure_debut
          ? _value.heure_debut
          : heure_debut // ignore: cast_nullable_to_non_nullable
              as String?,
      heure_fin: freezed == heure_fin
          ? _value.heure_fin
          : heure_fin // ignore: cast_nullable_to_non_nullable
              as String?,
      titre: null == titre
          ? _value.titre
          : titre // ignore: cast_nullable_to_non_nullable
              as String,
      lieu: freezed == lieu
          ? _value.lieu
          : lieu // ignore: cast_nullable_to_non_nullable
              as String?,
      type_label: null == type_label
          ? _value.type_label
          : type_label // ignore: cast_nullable_to_non_nullable
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
      required this.heure_debut,
      required this.heure_fin,
      required this.titre,
      required this.lieu,
      required this.type_label,
      required this.topic});

  factory _$EventsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventsEntityImplFromJson(json);

  @override
  final String? id;
  @override
  final String date;
  @override
  final String? heure_debut;
  @override
  final String? heure_fin;
  @override
  final String titre;
  @override
  final String? lieu;
  @override
  final String type_label;
  @override
  final String? topic;

  @override
  String toString() {
    return 'EventsEntity(id: $id, date: $date, heure_debut: $heure_debut, heure_fin: $heure_fin, titre: $titre, lieu: $lieu, type_label: $type_label, topic: $topic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.heure_debut, heure_debut) ||
                other.heure_debut == heure_debut) &&
            (identical(other.heure_fin, heure_fin) ||
                other.heure_fin == heure_fin) &&
            (identical(other.titre, titre) || other.titre == titre) &&
            (identical(other.lieu, lieu) || other.lieu == lieu) &&
            (identical(other.type_label, type_label) ||
                other.type_label == type_label) &&
            (identical(other.topic, topic) || other.topic == topic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, heure_debut, heure_fin,
      titre, lieu, type_label, topic);

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
      required final String? heure_debut,
      required final String? heure_fin,
      required final String titre,
      required final String? lieu,
      required final String type_label,
      required final String? topic}) = _$EventsEntityImpl;

  factory _EventsEntity.fromJson(Map<String, dynamic> json) =
      _$EventsEntityImpl.fromJson;

  @override
  String? get id;
  @override
  String get date;
  @override
  String? get heure_debut;
  @override
  String? get heure_fin;
  @override
  String get titre;
  @override
  String? get lieu;
  @override
  String get type_label;
  @override
  String? get topic;

  /// Create a copy of EventsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventsEntityImplCopyWith<_$EventsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
