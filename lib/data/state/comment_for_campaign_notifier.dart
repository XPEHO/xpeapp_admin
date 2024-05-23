import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentForCampaignNotifier extends StateNotifier<String?> {
  CommentForCampaignNotifier() : super(null);

  void setComment(String comment) {
    state = comment;
  }
}
