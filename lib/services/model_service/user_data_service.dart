import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_app/models/user_class.dart';

class UserDataService {
  List<User> users = [];

  Future<List<User>> getList(String endpoint) async {
    final QuerySnapshot result =
        await Firestore.instance.collection(endpoint).getDocuments();

    result.documents.forEach((doc) {
      users.add(User.fromJson(doc.data));
      users[users.length - 1].id = doc.documentID;
    });

    return users;
  }

  List<User> getUserList() {
    return users;
  }
}

final user = UserDataService();
