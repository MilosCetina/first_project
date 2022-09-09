import '../error/exceptions.dart';

class Helper {
  String validEmailAddress(String input) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

    if (RegExp(emailRegex).hasMatch(input)) {
      return input;
    } else {
      throw InvalidEmailException(
        failedValue: input,
      );
    }
  }
}
