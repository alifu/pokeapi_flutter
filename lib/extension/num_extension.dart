extension NumExtensions on num {
  String get toKg => "${_formatTrailingZero(this / 10)} kg";
  String get toMeters => "${_formatTrailingZero(this / 10)} m";

  String _formatTrailingZero(num value) {
    // Removes trailing zeros (e.g. 1.0 -> 1, 1.5 -> 1.5)
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toString();
  }
}
