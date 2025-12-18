import 'package:flutter_riverpod/legacy.dart';

class LoaderState extends StateNotifier<bool> {
  LoaderState() : super(false);

  void showLoader() {
    state = true;
  }

  void hideLoader() {
    state = false;
  }
}
