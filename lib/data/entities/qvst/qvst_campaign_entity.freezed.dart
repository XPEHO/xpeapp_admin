// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_campaign_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QvstCampaignEntity {
  String get id;
  String get name;
  List<QvstThemeEntity> get themes;
  String get status;
  @JsonKey(name: 'start_date')
  String get startDate;
  @JsonKey(name: 'end_date')
  String get endDate;
  @JsonKey(name: 'participation_rate')
  String get participationRate;

  /// Create a copy of QvstCampaignEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QvstCampaignEntityCopyWith<QvstCampaignEntity> get copyWith =>
      _$QvstCampaignEntityCopyWithImpl<QvstCampaignEntity>(
          this as QvstCampaignEntity, _$identity);

  /// Serializes this QvstCampaignEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QvstCampaignEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.themes, themes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.participationRate, participationRate) ||
                other.participationRate == participationRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(themes),
      status,
      startDate,
      endDate,
      participationRate);

  @override
  String toString() {
    return 'QvstCampaignEntity(id: $id, name: $name, themes: $themes, status: $status, startDate: $startDate, endDate: $endDate, participationRate: $participationRate)';
  }
}

/// @nodoc
abstract mixin class $QvstCampaignEntityCopyWith<$Res> {
  factory $QvstCampaignEntityCopyWith(
          QvstCampaignEntity value, $Res Function(QvstCampaignEntity) _then) =
      _$QvstCampaignEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      List<QvstThemeEntity> themes,
      String status,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      @JsonKey(name: 'participation_rate') String participationRate});
}

/// @nodoc
class _$QvstCampaignEntityCopyWithImpl<$Res>
    implements $QvstCampaignEntityCopyWith<$Res> {
  _$QvstCampaignEntityCopyWithImpl(this._self, this._then);

  final QvstCampaignEntity _self;
  final $Res Function(QvstCampaignEntity) _then;

  /// Create a copy of QvstCampaignEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? themes = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? participationRate = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      themes: null == themes
          ? _self.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<QvstThemeEntity>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      participationRate: null == participationRate
          ? _self.participationRate
          : participationRate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [QvstCampaignEntity].
extension QvstCampaignEntityPatterns on QvstCampaignEntity {
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
    TResult Function(_QvstCampaignEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstCampaignEntity() when $default != null:
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
    TResult Function(_QvstCampaignEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstCampaignEntity():
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
    TResult? Function(_QvstCampaignEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstCampaignEntity() when $default != null:
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
            String id,
            String name,
            List<QvstThemeEntity> themes,
            String status,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            @JsonKey(name: 'participation_rate') String participationRate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstCampaignEntity() when $default != null:
        return $default(_that.id, _that.name, _that.themes, _that.status,
            _that.startDate, _that.endDate, _that.participationRate);
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
            String id,
            String name,
            List<QvstThemeEntity> themes,
            String status,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            @JsonKey(name: 'participation_rate') String participationRate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstCampaignEntity():
        return $default(_that.id, _that.name, _that.themes, _that.status,
            _that.startDate, _that.endDate, _that.participationRate);
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
            String id,
            String name,
            List<QvstThemeEntity> themes,
            String status,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            @JsonKey(name: 'participation_rate') String participationRate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstCampaignEntity() when $default != null:
        return $default(_that.id, _that.name, _that.themes, _that.status,
            _that.startDate, _that.endDate, _that.participationRate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QvstCampaignEntity implements QvstCampaignEntity {
  const _QvstCampaignEntity(
      {required this.id,
      required this.name,
      required final List<QvstThemeEntity> themes,
      required this.status,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      @JsonKey(name: 'participation_rate') required this.participationRate})
      : _themes = themes;
  factory _QvstCampaignEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstCampaignEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<QvstThemeEntity> _themes;
  @override
  List<QvstThemeEntity> get themes {
    if (_themes is EqualUnmodifiableListView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_themes);
  }

  @override
  final String status;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;
  @override
  @JsonKey(name: 'participation_rate')
  final String participationRate;

  /// Create a copy of QvstCampaignEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QvstCampaignEntityCopyWith<_QvstCampaignEntity> get copyWith =>
      __$QvstCampaignEntityCopyWithImpl<_QvstCampaignEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QvstCampaignEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QvstCampaignEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._themes, _themes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.participationRate, participationRate) ||
                other.participationRate == participationRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_themes),
      status,
      startDate,
      endDate,
      participationRate);

  @override
  String toString() {
    return 'QvstCampaignEntity(id: $id, name: $name, themes: $themes, status: $status, startDate: $startDate, endDate: $endDate, participationRate: $participationRate)';
  }
}

/// @nodoc
abstract mixin class _$QvstCampaignEntityCopyWith<$Res>
    implements $QvstCampaignEntityCopyWith<$Res> {
  factory _$QvstCampaignEntityCopyWith(
          _QvstCampaignEntity value, $Res Function(_QvstCampaignEntity) _then) =
      __$QvstCampaignEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<QvstThemeEntity> themes,
      String status,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      @JsonKey(name: 'participation_rate') String participationRate});
}

/// @nodoc
class __$QvstCampaignEntityCopyWithImpl<$Res>
    implements _$QvstCampaignEntityCopyWith<$Res> {
  __$QvstCampaignEntityCopyWithImpl(this._self, this._then);

  final _QvstCampaignEntity _self;
  final $Res Function(_QvstCampaignEntity) _then;

  /// Create a copy of QvstCampaignEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? themes = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? participationRate = null,
  }) {
    return _then(_QvstCampaignEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      themes: null == themes
          ? _self._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<QvstThemeEntity>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      participationRate: null == participationRate
          ? _self.participationRate
          : participationRate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
