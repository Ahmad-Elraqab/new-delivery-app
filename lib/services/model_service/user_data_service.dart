import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_app/models/user_class.dart';

class UserDataService {
  List<User> users = [];

  Future<List<User>> getList(String endpoint) async {
    final QuerySnapshot result =
        await FirebaseFirestore.instance.collection(endpoint).get();

    result.docs.forEach((doc) {
      users.add(User.fromJson(doc.data()));
      users[users.length - 1].id = doc.id;
    });

    return users;
  }

  List<User> getUserList() {
    return users;
  }
}

final user = UserDataService();
