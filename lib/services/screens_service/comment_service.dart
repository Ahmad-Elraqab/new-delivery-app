import 'package:work_app/models/feedback_class.dart';
import '../../dependency.dart';
import '../data_service.dart';

class FeedbackService {
  final dataService = service<DataService>();
  Future add(FeedbackData data) async {
    return data;
  }

  Future getComments(String id) async {
    final data = await dataService.getFeedback(id);
    return (data as List).map((e) => FeedbackData.fromJson(e.data())).toList();
  }

  Future addComment(String restaurantId, FeedbackData data) async {
    final result = data.toJson();
    await dataService.addToSubCollection(
        restaurantId, result, 'restaurant', 'feedback');
  }
}
