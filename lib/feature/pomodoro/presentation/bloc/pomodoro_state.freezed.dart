// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PomodoroState {
  String? get title;
  Cycle get cycle;
  Duration get timer;
  Map<Cycle, int> get cyclesData;
  bool get isResting;
  PomodoroStatus get status;

  /// Create a copy of PomodoroState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PomodoroStateCopyWith<PomodoroState> get copyWith =>
      _$PomodoroStateCopyWithImpl<PomodoroState>(
        this as PomodoroState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PomodoroState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            const DeepCollectionEquality().equals(
              other.cyclesData,
              cyclesData,
            ) &&
            (identical(other.isResting, isResting) ||
                other.isResting == isResting) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    cycle,
    timer,
    const DeepCollectionEquality().hash(cyclesData),
    isResting,
    status,
  );

  @override
  String toString() {
    return 'PomodoroState(title: $title, cycle: $cycle, timer: $timer, cyclesData: $cyclesData, isResting: $isResting, status: $status)';
  }
}

/// @nodoc
abstract mixin class $PomodoroStateCopyWith<$Res> {
  factory $PomodoroStateCopyWith(
    PomodoroState value,
    $Res Function(PomodoroState) _then,
  ) = _$PomodoroStateCopyWithImpl;
  @useResult
  $Res call({
    String? title,
    Cycle cycle,
    Duration timer,
    Map<Cycle, int> cyclesData,
    bool isResting,
    PomodoroStatus status,
  });
}

/// @nodoc
class _$PomodoroStateCopyWithImpl<$Res>
    implements $PomodoroStateCopyWith<$Res> {
  _$PomodoroStateCopyWithImpl(this._self, this._then);

  final PomodoroState _self;
  final $Res Function(PomodoroState) _then;

  /// Create a copy of PomodoroState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? cycle = null,
    Object? timer = null,
    Object? cyclesData = null,
    Object? isResting = null,
    Object? status = null,
  }) {
    return _then(
      _self.copyWith(
        title:
            freezed == title
                ? _self.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        cycle:
            null == cycle
                ? _self.cycle
                : cycle // ignore: cast_nullable_to_non_nullable
                    as Cycle,
        timer:
            null == timer
                ? _self.timer
                : timer // ignore: cast_nullable_to_non_nullable
                    as Duration,
        cyclesData:
            null == cyclesData
                ? _self.cyclesData
                : cyclesData // ignore: cast_nullable_to_non_nullable
                    as Map<Cycle, int>,
        isResting:
            null == isResting
                ? _self.isResting
                : isResting // ignore: cast_nullable_to_non_nullable
                    as bool,
        status:
            null == status
                ? _self.status
                : status // ignore: cast_nullable_to_non_nullable
                    as PomodoroStatus,
      ),
    );
  }
}

/// @nodoc

class _PomodoroState implements PomodoroState {
  const _PomodoroState({
    this.title,
    required this.cycle,
    required this.timer,
    required final Map<Cycle, int> cyclesData,
    this.isResting = false,
    required this.status,
  }) : _cyclesData = cyclesData;

  @override
  final String? title;
  @override
  final Cycle cycle;
  @override
  final Duration timer;
  final Map<Cycle, int> _cyclesData;
  @override
  Map<Cycle, int> get cyclesData {
    if (_cyclesData is EqualUnmodifiableMapView) return _cyclesData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cyclesData);
  }

  @override
  @JsonKey()
  final bool isResting;
  @override
  final PomodoroStatus status;

  /// Create a copy of PomodoroState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PomodoroStateCopyWith<_PomodoroState> get copyWith =>
      __$PomodoroStateCopyWithImpl<_PomodoroState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PomodoroState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            const DeepCollectionEquality().equals(
              other._cyclesData,
              _cyclesData,
            ) &&
            (identical(other.isResting, isResting) ||
                other.isResting == isResting) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    cycle,
    timer,
    const DeepCollectionEquality().hash(_cyclesData),
    isResting,
    status,
  );

  @override
  String toString() {
    return 'PomodoroState(title: $title, cycle: $cycle, timer: $timer, cyclesData: $cyclesData, isResting: $isResting, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$PomodoroStateCopyWith<$Res>
    implements $PomodoroStateCopyWith<$Res> {
  factory _$PomodoroStateCopyWith(
    _PomodoroState value,
    $Res Function(_PomodoroState) _then,
  ) = __$PomodoroStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String? title,
    Cycle cycle,
    Duration timer,
    Map<Cycle, int> cyclesData,
    bool isResting,
    PomodoroStatus status,
  });
}

/// @nodoc
class __$PomodoroStateCopyWithImpl<$Res>
    implements _$PomodoroStateCopyWith<$Res> {
  __$PomodoroStateCopyWithImpl(this._self, this._then);

  final _PomodoroState _self;
  final $Res Function(_PomodoroState) _then;

  /// Create a copy of PomodoroState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? cycle = null,
    Object? timer = null,
    Object? cyclesData = null,
    Object? isResting = null,
    Object? status = null,
  }) {
    return _then(
      _PomodoroState(
        title:
            freezed == title
                ? _self.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        cycle:
            null == cycle
                ? _self.cycle
                : cycle // ignore: cast_nullable_to_non_nullable
                    as Cycle,
        timer:
            null == timer
                ? _self.timer
                : timer // ignore: cast_nullable_to_non_nullable
                    as Duration,
        cyclesData:
            null == cyclesData
                ? _self._cyclesData
                : cyclesData // ignore: cast_nullable_to_non_nullable
                    as Map<Cycle, int>,
        isResting:
            null == isResting
                ? _self.isResting
                : isResting // ignore: cast_nullable_to_non_nullable
                    as bool,
        status:
            null == status
                ? _self.status
                : status // ignore: cast_nullable_to_non_nullable
                    as PomodoroStatus,
      ),
    );
  }
}
