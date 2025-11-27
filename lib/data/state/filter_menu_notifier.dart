import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterMenuNotifier extends StateNotifier<bool> {
  FilterMenuNotifier() : super(false);

  void toggle() {
    state = !state;
  }

  void close() {
    state = false;
  }

  void open() {
    state = true;
  }
}
