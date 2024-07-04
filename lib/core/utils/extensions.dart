extension StringExtension on String {
  String get capitalized {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension DateTimeExtension on DateTime {
  DateTime get onlyDate => DateTime(this.year, this.month, this.day);
}
