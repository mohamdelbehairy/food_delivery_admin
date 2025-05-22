import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firebaseFirestore;
  FirebaseFirestoreService(this._firebaseFirestore);

  Future<void> addData(
      {required String collectionName,
      required docID,
      required Map<String, dynamic> data}) async {
    await _firebaseFirestore.collection(collectionName).doc(docID).set(data);
  }

  void getData(
      {required String collectionName,
      required void Function(QuerySnapshot<Map<String, dynamic>>)? onData}) {
    _firebaseFirestore.collection(collectionName).snapshots().listen(onData);
  }

  Future<Map<String, dynamic>?> getFutureData(
      {required String collectionName, required String docID}) async {
    final snapshot =
        await _firebaseFirestore.collection(collectionName).doc(docID).get();
    return snapshot.data();
  }

  Future<void> updataData(
      {required String collectionName,
      required String docID,
      required Map<Object, Object?> data}) async {
    await _firebaseFirestore.collection(collectionName).doc(docID).update(data);
  }

  Future<void> deleteData(
      {required String collectionName, required String docID}) async {
    await _firebaseFirestore.collection(collectionName).doc(docID).delete();
  }
}
