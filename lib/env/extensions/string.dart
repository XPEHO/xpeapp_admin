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

  bool get isDraft => toLowerCase() == 'draft';

  bool get isOpen => toLowerCase() == 'open';

  bool get isClosed => toLowerCase() == 'closed';
}
