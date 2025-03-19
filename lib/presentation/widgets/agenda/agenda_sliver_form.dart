import 'package:flutter/material.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';

class AgendaSliverForm extends StatelessWidget {
  final String subtitleText;
  final List<Widget> formFields;

  const AgendaSliverForm({
    super.key,
    required this.subtitleText,
    required this.formFields,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: subtitleWidget(subtitleText),
        ),
        const SliverToBoxAdapter(
          child: Divider(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(formFields),
          ),
        ),
      ],
    );
  }
}
