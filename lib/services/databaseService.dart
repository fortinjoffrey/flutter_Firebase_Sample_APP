import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample_app/models/brew.dart';

class DatabaseService {
  final String uid;

  DatabaseService({
    this.uid,
  });

  final CollectionReference brewCollection =
      Firestore.instance.collection("brews");

  Future updateUserData(String sugars, String username, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'username': username,
      'strength': strength,
    });
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '',
      );
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
