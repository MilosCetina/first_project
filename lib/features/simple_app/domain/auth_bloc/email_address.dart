import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/helpers/helper.dart';


class EmailAddress{
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      Helper.validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);

  @override
  String toString() => "EmailAddress($value)";

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is EmailAddress && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

}