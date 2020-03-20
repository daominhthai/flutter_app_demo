import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseServices{

  CollectionReference _collectionReference;
  DocumentReference _documentReference;
  FirebaseAuth _auth;

  Future updateUserProfile(data) async{
    var user = getCurrentUser();
    _collectionReference = Firestore.instance.collection('profile');
    return await _collectionReference.document(user).setData(data);
  }
  
   getCurrentUser() async{
    FirebaseUser user = await _auth.currentUser();
    return user.uid;
  }

  Stream<DocumentSnapshot> get profile {
    var user = getCurrentUser();
    _documentReference = Firestore.instance.collection('profile').document(user);
    return _documentReference.snapshots();
  }
}