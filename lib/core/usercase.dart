import 'package:fpdart/fpdart.dart';
import 'package:pomodoro_flutter/core/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Either<DatabaseFailure, SuccessType> call(Params params);
}

abstract interface class AsyncUsecase<SuccessType, Params> {
  Future<Either<DatabaseFailure, SuccessType>> call(Params params);
}

class NoParams {}
