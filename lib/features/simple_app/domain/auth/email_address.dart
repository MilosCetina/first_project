class EmailAddress{
  final String value;

  const EmailAddress(this.value);

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