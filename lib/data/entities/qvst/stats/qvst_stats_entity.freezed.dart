// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_stats_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QvstStatsEntity {
  @JsonKey(defaultValue: '')
  String get campaignId;
  @JsonKey(defaultValue: '')
  String get campaignName;
  @JsonKey(defaultValue: '')
  String get campaignStatus;
  DateTime? get startDate;
  DateTime? get endDate;
  List<QvstThemeEntity> get themes;
  List<QvstQuestionEntity> get questions;
  String? get action;

  /// Create a copy of QvstStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QvstStatsEntityCopyWith<QvstStatsEntity> get copyWith =>
      _$QvstStatsEntityCopyWithImpl<QvstStatsEntity>(
          this as QvstStatsEntity, _$identity);

  /// Serializes this QvstStatsEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QvstStatsEntity &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.campaignName, campaignName) ||
                other.campaignName == campaignName) &&
            (identical(other.campaignStatus, campaignStatus) ||
                other.campaignStatus == campaignStatus) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other.themes, themes) &&
            const DeepCollectionEquality().equals(other.questions, questions) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      campaignId,
      campaignName,
      campaignStatus,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(themes),
      const DeepCollectionEquality().hash(questions),
      action);

  @override
  String toString() {
    return 'QvstStatsEntity(campaignId: $campaignId, campaignName: $campaignName, campaignStatus: $campaignStatus, startDate: $startDate, endDate: $endDate, themes: $themes, questions: $questions, action: $action)';
  }
}

/// @nodoc
abstract mixin class $QvstStatsEntityCopyWith<$Res> {
  factory $QvstStatsEntityCopyWith(
          QvstStatsEntity value, $Res Function(QvstStatsEntity) _then) =
      _$QvstStatsEntityCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String campaignId,
      @JsonKey(defaultValue: '') String campaignName,
      @JsonKey(defaultValue: '') String campaignStatus,
      DateTime? startDate,
      DateTime? endDate,
      List<QvstThemeEntity> themes,
      List<QvstQuestionEntity> questions,
      String? action});
}

/// @nodoc
class _$QvstStatsEntityCopyWithImpl<$Res>
    implements $QvstStatsEntityCopyWith<$Res> {
  _$QvstStatsEntityCopyWithImpl(this._self, this._then);

  final QvstStatsEntity _self;
  final $Res Function(QvstStatsEntity) _then;

  /// Create a copy of QvstStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = null,
    Object? campaignName = null,
    Object? campaignStatus = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? themes = null,
    Object? questions = null,
    Object? action = freezed,
  }) {
    return _then(_self.copyWith(
      campaignId: null == campaignId
          ? _self.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      campaignName: null == campaignName
          ? _self.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String,
      campaignStatus: null == campaignStatus
          ? _self.campaignStatus
          : campaignStatus // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      themes: null == themes
          ? _self.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<QvstThemeEntity>,
      questions: null == questions
          ? _self.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QvstQuestionEntity>,
      action: freezed == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QvstStatsEntity].
extension QvstStatsEntityPatterns on QvstStatsEntity {
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
    TResult Function(_QvstStatsEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstStatsEntity() when $default != null:
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
    TResult Function(_QvstStatsEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstStatsEntity():
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
    TResult? Function(_QvstStatsEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstStatsEntity() when $default != null:
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
            @JsonKey(defaultValue: '') String campaignId,
            @JsonKey(defaultValue: '') String campaignName,
            @JsonKey(defaultValue: '') String campaignStatus,
            DateTime? startDate,
            DateTime? endDate,
            List<QvstThemeEntity> themes,
            List<QvstQuestionEntity> questions,
            String? action)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstStatsEntity() when $default != null:
        return $default(
            _that.campaignId,
            _that.campaignName,
            _that.campaignStatus,
            _that.startDate,
            _that.endDate,
            _that.themes,
            _that.questions,
            _that.action);
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
            @JsonKey(defaultValue: '') String campaignId,
            @JsonKey(defaultValue: '') String campaignName,
            @JsonKey(defaultValue: '') String campaignStatus,
            DateTime? startDate,
            DateTime? endDate,
            List<QvstThemeEntity> themes,
            List<QvstQuestionEntity> questions,
            String? action)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstStatsEntity():
        return $default(
            _that.campaignId,
            _that.campaignName,
            _that.campaignStatus,
            _that.startDate,
            _that.endDate,
            _that.themes,
            _that.questions,
            _that.action);
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
            @JsonKey(defaultValue: '') String campaignId,
            @JsonKey(defaultValue: '') String campaignName,
            @JsonKey(defaultValue: '') String campaignStatus,
            DateTime? startDate,
            DateTime? endDate,
            List<QvstThemeEntity> themes,
            List<QvstQuestionEntity> questions,
            String? action)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstStatsEntity() when $default != null:
        return $default(
            _that.campaignId,
            _that.campaignName,
            _that.campaignStatus,
            _that.startDate,
            _that.endDate,
            _that.themes,
            _that.questions,
            _that.action);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QvstStatsEntity implements QvstStatsEntity {
  const _QvstStatsEntity(
      {@JsonKey(defaultValue: '') required this.campaignId,
      @JsonKey(defaultValue: '') required this.campaignName,
      @JsonKey(defaultValue: '') required this.campaignStatus,
      this.startDate,
      this.endDate,
      required final List<QvstThemeEntity> themes,
      required final List<QvstQuestionEntity> questions,
      this.action})
      : _themes = themes,
        _questions = questions;
  factory _QvstStatsEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstStatsEntityFromJson(json);

  @override
  @JsonKey(defaultValue: '')
  final String campaignId;
  @override
  @JsonKey(defaultValue: '')
  final String campaignName;
  @override
  @JsonKey(defaultValue: '')
  final String campaignStatus;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  final List<QvstThemeEntity> _themes;
  @override
  List<QvstThemeEntity> get themes {
    if (_themes is EqualUnmodifiableListView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_themes);
  }

  final List<QvstQuestionEntity> _questions;
  @override
  List<QvstQuestionEntity> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final String? action;

  /// Create a copy of QvstStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QvstStatsEntityCopyWith<_QvstStatsEntity> get copyWith =>
      __$QvstStatsEntityCopyWithImpl<_QvstStatsEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QvstStatsEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QvstStatsEntity &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.campaignName, campaignName) ||
                other.campaignName == campaignName) &&
            (identical(other.campaignStatus, campaignStatus) ||
                other.campaignStatus == campaignStatus) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._themes, _themes) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      campaignId,
      campaignName,
      campaignStatus,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_themes),
      const DeepCollectionEquality().hash(_questions),
      action);

  @override
  String toString() {
    return 'QvstStatsEntity(campaignId: $campaignId, campaignName: $campaignName, campaignStatus: $campaignStatus, startDate: $startDate, endDate: $endDate, themes: $themes, questions: $questions, action: $action)';
  }
}

/// @nodoc
abstract mixin class _$QvstStatsEntityCopyWith<$Res>
    implements $QvstStatsEntityCopyWith<$Res> {
  factory _$QvstStatsEntityCopyWith(
          _QvstStatsEntity value, $Res Function(_QvstStatsEntity) _then) =
      __$QvstStatsEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String campaignId,
      @JsonKey(defaultValue: '') String campaignName,
      @JsonKey(defaultValue: '') String campaignStatus,
      DateTime? startDate,
      DateTime? endDate,
      List<QvstThemeEntity> themes,
      List<QvstQuestionEntity> questions,
      String? action});
}

/// @nodoc
class __$QvstStatsEntityCopyWithImpl<$Res>
    implements _$QvstStatsEntityCopyWith<$Res> {
  __$QvstStatsEntityCopyWithImpl(this._self, this._then);

  final _QvstStatsEntity _self;
  final $Res Function(_QvstStatsEntity) _then;

  /// Create a copy of QvstStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? campaignId = null,
    Object? campaignName = null,
    Object? campaignStatus = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? themes = null,
    Object? questions = null,
    Object? action = freezed,
  }) {
    return _then(_QvstStatsEntity(
      campaignId: null == campaignId
          ? _self.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      campaignName: null == campaignName
          ? _self.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String,
      campaignStatus: null == campaignStatus
          ? _self.campaignStatus
          : campaignStatus // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      themes: null == themes
          ? _self._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<QvstThemeEntity>,
      questions: null == questions
          ? _self._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QvstQuestionEntity>,
      action: freezed == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
