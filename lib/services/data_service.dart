import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  Stream getListByStream(String collection) {
    final result =
        FirebaseFirestore.instance.collection(collection).snapshots();
    print(result);

    return result;
  }

  Future getListByFuture(String collection) async {
    final result =
        (await FirebaseFirestore.instance.collection(collection).get()).docs;
    print(result);

    return result;
  }

  Future create(String collection, {dynamic data}) async {
    final result = await FirebaseFirestore.instance
        .collection(collection)
        .add(data.toJson());
//     await Firestore.instance.collection(collection).document().collection(collectionPath).add(data);
// final databaseReference = Firestore.instance;
// databaseReference.collection('main collection name').document( unique id).collection('string name').document().setData(); // your answer missing **.document()**  before setDat
    return result;
  }

  Future update(String collection, {dynamic data}) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(data.id)
        .set(data.toJson());

    return data;
  }

  Future createOrderCollection(
      {String collection, dynamic data, String dataId}) async {
    data = data.toJson();

    final items = data['items'];

    data.remove('items');
    collection = 'orders';
    // await Firestore.instance
    //     .collection('orders').document().collection('items').add(data);
    final result =
        await FirebaseFirestore.instance.collection('orders').add(data);
    items.forEach((item) async {
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(result.id)
          .collection('items')
          .add(item.toJson());
    });

    return data;
  }

  Future<void> delete(String collection, String id) async {
    await FirebaseFirestore.instance.collection(collection).doc(id).delete();
  }

  Stream getStreamSecondCollection(
      {String docId1, String collection1, String collection2}) {
    final result = FirebaseFirestore.instance
        .collection(collection1)
        .doc(docId1)
        .collection(collection2)
        .snapshots();

    return result;
  }
}

//? archive
//   //? Used by FutureBuilder only
// Future getListById(String collection, String id) async {
//   final QuerySnapshot result = await Firestore.instance
//       .collection(collection)
//       .where('userid==$id')
//       .getDocuments();

//   return result;
// }

//? mock data
// data = Restaurant(
//     description: 'none',
//     image:
//         "https://simsolutions.com.sg/wp-content/uploads/2014/10/burger-king-logo.jpg",
//     name: "Fatsha",
//     rate: 5.6,
//     status: "open");11
