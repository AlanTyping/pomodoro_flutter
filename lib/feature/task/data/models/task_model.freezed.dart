// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskModel {
  int? get id;
  String get title;
  String get date;
  int get completed;
  String get cycle;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<TaskModel> get copyWith =>
      _$TaskModelCopyWithImpl<TaskModel>(this as TaskModel, _$identity);

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.cycle, cycle) || other.cycle == cycle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, date, completed, cycle);

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, date: $date, completed: $completed, cycle: $cycle)';
  }
}

/// @nodoc
abstract mixin class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) _then) =
      _$TaskModelCopyWithImpl;
  @useResult
  $Res call({int? id, String title, String date, int completed, String cycle});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res> implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._self, this._then);

  final TaskModel _self;
  final $Res Function(TaskModel) _then;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? date = null,
    Object? completed = null,
    Object? cycle = null,
  }) {
    return _then(
      _self.copyWith(
        id:
            freezed == id
                ? _self.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        title:
            null == title
                ? _self.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        date:
            null == date
                ? _self.date
                : date // ignore: cast_nullable_to_non_nullable
                    as String,
        completed:
            null == completed
                ? _self.completed
                : completed // ignore: cast_nullable_to_non_nullable
                    as int,
        cycle:
            null == cycle
                ? _self.cycle
                : cycle // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _TaskModel implements TaskModel {
  const _TaskModel({
    this.id,
    required this.title,
    required this.date,
    required this.completed,
    required this.cycle,
  });
  factory _TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String date;
  @override
  final int completed;
  @override
  final String cycle;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskModelCopyWith<_TaskModel> get copyWith =>
      __$TaskModelCopyWithImpl<_TaskModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskModelToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.cycle, cycle) || other.cycle == cycle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, date, completed, cycle);

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, date: $date, completed: $completed, cycle: $cycle)';
  }
}

/// @nodoc
abstract mixin class _$TaskModelCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$TaskModelCopyWith(
    _TaskModel value,
    $Res Function(_TaskModel) _then,
  ) = __$TaskModelCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String title, String date, int completed, String cycle});
}

/// @nodoc
class __$TaskModelCopyWithImpl<$Res> implements _$TaskModelCopyWith<$Res> {
  __$TaskModelCopyWithImpl(this._self, this._then);

  final _TaskModel _self;
  final $Res Function(_TaskModel) _then;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? date = null,
    Object? completed = null,
    Object? cycle = null,
  }) {
    return _then(
      _TaskModel(
        id:
            freezed == id
                ? _self.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        title:
            null == title
                ? _self.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        date:
            null == date
                ? _self.date
                : date // ignore: cast_nullable_to_non_nullable
                    as String,
        completed:
            null == completed
                ? _self.completed
                : completed // ignore: cast_nullable_to_non_nullable
                    as int,
        cycle:
            null == cycle
                ? _self.cycle
                : cycle // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}
