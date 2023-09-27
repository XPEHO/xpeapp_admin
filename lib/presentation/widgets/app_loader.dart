import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final Color? color;
  const AppLoader({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 25,
        height: 25,
        child: CircularProgressIndicator(
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}

OverlayEntry? loaderOverlay;

void showLoaderOverlay(
  BuildContext context, {
  Color? color,
}) {
  if (loaderOverlay == null) {
    loaderOverlay = createOverlayEntryLoader(
      context,
      color: color,
    );
    Overlay.of(context).insert(loaderOverlay!);
  }
}

void hideLoaderOverlay() {
  loaderOverlay?.remove();
  loaderOverlay = null;
}

OverlayEntry createOverlayEntryLoader(
  BuildContext context, {
  Color? color,
}) {
  return OverlayEntry(
    builder: (context) => Center(
      child: Material(
        color: Colors.transparent,
        child: AppLoader(
          color: color ?? Colors.white,
        ),
      ),
    ),
  );
}
