import 'package:flutter/cupertino.dart';
import 'package:work_app/models/user_class.dart';
import 'package:work_app/services/model_service/user_data_service.dart';

class MyProfileProvider with ChangeNotifier {
  final service = UserDataService();
  List<User> users = user.getUserList();

  List<User> getUsers() {
    return users;
  }
}
