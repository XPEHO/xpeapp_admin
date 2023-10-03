import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/colors.dart';

class ScaffoldTemplate extends StatelessWidget {
  final String? appBarTitle;
  final Widget? appBarLeading;
  final Widget child;
  final Widget? floatingActionButton;

  const ScaffoldTemplate({
    super.key,
    this.appBarTitle,
    this.appBarLeading,
    required this.child,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBackgroudColor,
      appBar: AppBar(
        backgroundColor: kDefaultBackgroudColor,
        title: appBarTitle != null ? Text(appBarTitle!) : null,
        centerTitle: true,
        leading: appBarLeading,
      ),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
