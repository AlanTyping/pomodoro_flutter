// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PomodoroEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PomodoroEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PomodoroEvent()';
  }
}

/// @nodoc
class $PomodoroEventCopyWith<$Res> {
  $PomodoroEventCopyWith(PomodoroEvent _, $Res Function(PomodoroEvent) __);
}

/// @nodoc

class StartPomodoro implements PomodoroEvent {
  const StartPomodoro();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StartPomodoro);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PomodoroEvent.start()';
  }
}

/// @nodoc

class PausePomodoro implements PomodoroEvent {
  const PausePomodoro();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PausePomodoro);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PomodoroEvent.pause()';
  }
}

/// @nodoc

class ResumePomodoro implements PomodoroEvent {
  const ResumePomodoro();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ResumePomodoro);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PomodoroEvent.resume()';
  }
}

/// @nodoc

class StopPomodoro implements PomodoroEvent {
  const StopPomodoro();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StopPomodoro);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PomodoroEvent.stop()';
  }
}

/// @nodoc

class SkipCyclePomodoro implements PomodoroEvent {
  const SkipCyclePomodoro();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SkipCyclePomodoro);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PomodoroEvent.skipCycle()';
  }
}

/// @nodoc

class UpdateTitlePomodoro implements PomodoroEvent {
  const UpdateTitlePomodoro(this.title);

  final String title;

  /// Create a copy of PomodoroEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateTitlePomodoroCopyWith<UpdateTitlePomodoro> get copyWith =>
      _$UpdateTitlePomodoroCopyWithImpl<UpdateTitlePomodoro>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateTitlePomodoro &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @override
  String toString() {
    return 'PomodoroEvent.updateTitle(title: $title)';
  }
}

/// @nodoc
abstract mixin class $UpdateTitlePomodoroCopyWith<$Res>
    implements $PomodoroEventCopyWith<$Res> {
  factory $UpdateTitlePomodoroCopyWith(
    UpdateTitlePomodoro value,
    $Res Function(UpdateTitlePomodoro) _then,
  ) = _$UpdateTitlePomodoroCopyWithImpl;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$UpdateTitlePomodoroCopyWithImpl<$Res>
    implements $UpdateTitlePomodoroCopyWith<$Res> {
  _$UpdateTitlePomodoroCopyWithImpl(this._self, this._then);

  final UpdateTitlePomodoro _self;
  final $Res Function(UpdateTitlePomodoro) _then;

  /// Create a copy of PomodoroEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? title = null}) {
    return _then(
      UpdateTitlePomodoro(
        null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class TickPomodoro implements PomodoroEvent {
  const TickPomodoro(this.currentSeconds);

  final int currentSeconds;

  /// Create a copy of PomodoroEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TickPomodoroCopyWith<TickPomodoro> get copyWith =>
      _$TickPomodoroCopyWithImpl<TickPomodoro>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TickPomodoro &&
            (identical(other.currentSeconds, currentSeconds) ||
                other.currentSeconds == currentSeconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentSeconds);

  @override
  String toString() {
    return 'PomodoroEvent.tick(currentSeconds: $currentSeconds)';
  }
}

/// @nodoc
abstract mixin class $TickPomodoroCopyWith<$Res>
    implements $PomodoroEventCopyWith<$Res> {
  factory $TickPomodoroCopyWith(
    TickPomodoro value,
    $Res Function(TickPomodoro) _then,
  ) = _$TickPomodoroCopyWithImpl;
  @useResult
  $Res call({int currentSeconds});
}

/// @nodoc
class _$TickPomodoroCopyWithImpl<$Res> implements $TickPomodoroCopyWith<$Res> {
  _$TickPomodoroCopyWithImpl(this._self, this._then);

  final TickPomodoro _self;
  final $Res Function(TickPomodoro) _then;

  /// Create a copy of PomodoroEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? currentSeconds = null}) {
    return _then(
      TickPomodoro(
        null == currentSeconds
            ? _self.currentSeconds
            : currentSeconds // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class FinishPomodoro implements PomodoroEvent {
  const FinishPomodoro();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FinishPomodoro);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PomodoroEvent.finish()';
  }
}
