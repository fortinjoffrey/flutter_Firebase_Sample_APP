import 'package:cloud_firestore/cloud_firestore.dart';

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
}
