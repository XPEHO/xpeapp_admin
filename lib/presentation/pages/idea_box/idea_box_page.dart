import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/idea_box_menu.dart';
import 'package:xpeapp_admin/presentation/pages/idea_box/content/idea_box_content_ideas.dart';
import 'package:xpeapp_admin/presentation/pages/idea_box/idea_utils.dart';

class IdeaBoxPage extends ConsumerStatefulWidget {
  const IdeaBoxPage({
    super.key,
  });

  @override
  IdeaBoxPageState createState() => IdeaBoxPageState();
}

class IdeaBoxPageState extends ConsumerState<IdeaBoxPage> {
  IdeaBoxMenu selectedMenu = IdeaBoxMenu.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildMenuItem(context, IdeaBoxMenu.all),
                buildMenuItem(context, IdeaBoxMenu.pending),
                buildMenuItem(context, IdeaBoxMenu.approved),
                buildMenuItem(context, IdeaBoxMenu.implemented),
                buildMenuItem(context, IdeaBoxMenu.rejected),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IdeaBoxContentIdeas(filterStatus: selectedMenu),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, IdeaBoxMenu menu) {
    final isSelected = selectedMenu == menu;
    return InkWell(
      onTap: () {
        setState(() {
          selectedMenu = menu;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Text(
          IdeaUtils.getFilterTitle(menu),
          style: TextStyle(
            color: isSelected ? kDefaultXpehoColor : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget subtitleWidget(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
