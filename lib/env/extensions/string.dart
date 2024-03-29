extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String cleanText() {
    return replaceAll(
      '\n',
      '',
    );
  }

  bool get isArchived => toLowerCase() == 'archived';
}
