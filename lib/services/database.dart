import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasee/models/Brew.dart';
import 'package:firebasee/models/Userr.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

  List<Brews> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brews(
          name: doc.data()['name'] ?? " ",
          strength: doc.data()['strength'] ?? 0,
          sugars: doc.data()['sugars'] ?? " ");
    }).toList();
  }

  Stream<List<Brews>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      sugars: snapshot.data()['sugars'],
      strength: snapshot.data()['strength'],
    );
  }

  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
