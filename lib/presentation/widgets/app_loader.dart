import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final Color? color;
  final double? size;
  const AppLoader({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 25,
        height: size ?? 25,
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
