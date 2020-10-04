import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/models/feedback_class.dart';
import 'package:work_app/services/data_service.dart';
import 'package:work_app/services/screens_service/comment_service.dart';

import '../dependency.dart';

class FeedbackProvider with ChangeNotifier {
  final dataService = service<DataService>();
  final feedbackService = FeedbackService();
  List<FeedbackData> feedback = [];

  getFeedbackList(String id) async {
    feedback.clear();
    final data = await feedbackService.getComments(id);
    feedback = data;
    return feedback;
  }

  addComment(FeedbackData data) async {
    feedback.clear();
    await feedbackService.addComment(data.restaurantId, data);
  }

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;
  }
}
