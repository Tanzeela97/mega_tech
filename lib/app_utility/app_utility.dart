class AppUtility {
  static String? dateFormat(DateTime? dateTime) => dateTime == null
      ? null
      : '${dateTime.year}-${dateTime.month}-${dateTime.day}';
}
