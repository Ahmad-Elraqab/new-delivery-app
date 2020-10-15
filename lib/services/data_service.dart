import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_app/dependencies/constants.dart';

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
    final data = [];
    result.forEach((element) {
      Map x = element.data();
      x["id"] = element.id;
      data.add(x);
    });

    return data;
  }

  Future create(String collection, {dynamic data}) async {
    final result = await FirebaseFirestore.instance
        .collection(collection)
        .add(data.toJson());

    return result;
  }

  Future update(String id, String collection, {dynamic data}) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .set(data, SetOptions(merge: true));

    return data;
  }

  Future<void> delete(String collection, String id) async {
    await FirebaseFirestore.instance.collection(collection).doc(id).delete();
  }

  Future getMenu(String id) async {
    print(id);
    var result = (await FirebaseFirestore.instance
            .collection("restaurant")
            .doc(id)
            .collection("menu")
            .get())
        .docs;

    return result;
  }

  Future getFeedback(String id) async {
    print(id);
    var result = (await FirebaseFirestore.instance
            .collection("restaurant")
            .doc(id)
            .collection("feedback")
            .get())
        .docs;
    return result;
  }

  Future getCart() async {
    var carts = (await FirebaseFirestore.instance
            .collection("cart")
            .where("userid", isEqualTo: userIdConst)
            .get())
        .docs;

    return carts;
  }

  Future<dynamic> getCartItems() async {
    var items = (await FirebaseFirestore.instance
            .collection("users")
            .doc('Ikpfx9o03W1nD168LFfQ')
            .collection("cart")
            .get())
        .docs;
    return (items).map((e) => e.data()).toList();
  }

  Future createOrderCollection({String collection, dynamic data}) async {
    data = data.toJson();

    // final items = [];
    final items = [...data['items']];

    data.remove('items');

    final result =
        await FirebaseFirestore.instance.collection(collection).add(data);

    items.forEach((item) async {
      await FirebaseFirestore.instance
          .collection(collection)
          .doc(result.id)
          .collection('items')
          .add(item.toJson());
    });

    return data;
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

  Future checkExist(String collection, {String id}) async {
    final data = await FirebaseFirestore.instance
        .collection("cart")
        .where("userid", isEqualTo: id)
        .get();

    if (data.docs.isEmpty) return true;
    return false;
  }

  Future checkItemExistInDoc(String cartId, String itemId) async {
    final data = await FirebaseFirestore.instance
        .collection("cart")
        .doc(cartId)
        .collection('items')
        .where("id", isEqualTo: itemId)
        .get();

    if (data.docs.isNotEmpty) return data.docs;
    return false;
  }

  Future<void> updateRepeated(Map data, String id, String itemId) async {
    await FirebaseFirestore.instance
        .collection("cart")
        .doc(id)
        .collection("items")
        .doc(itemId)
        .set(data);
  }

  Future<void> updateDocument(Map data, String id) async {
    await FirebaseFirestore.instance
        .collection("cart")
        .doc(id)
        .collection("items")
        .add(data);
  }

  Future<void> deleteFromSubCollection(String doc1Id, String doc2Id) async {
    await FirebaseFirestore.instance
        .collection("cart")
        .doc(doc1Id)
        .collection("items")
        .doc(doc2Id)
        .delete();
  }

  Future<void> addToSubCollection(
      String doc1Id, dynamic data, String coll_1, String coll_2) async {
    await FirebaseFirestore.instance
        .collection(coll_1)
        .doc(doc1Id)
        .collection(coll_2)
        .add(data);
  }
}
