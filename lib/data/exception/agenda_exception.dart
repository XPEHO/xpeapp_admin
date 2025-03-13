class AgendaException implements Exception {
  final String message;

  AgendaException(this.message);

  @override
  String toString() => 'Agenda Exception: $message';
}
