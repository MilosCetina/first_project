import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



@freezed
abstract class ValueFailure<T>{
  const factory ValueFailure.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;
}