import 'package:flutter_riverpod/legacy.dart';

class CommentForCampaignNotifier extends StateNotifier<String?> {
  CommentForCampaignNotifier() : super(null);

  void setComment(String comment) {
    state = comment;
  }
}
