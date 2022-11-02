import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addUserDetails(String phone, String street, String city,
    String pinCode, String state) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  User authUser = FirebaseAuth.instance.currentUser!;
  CollectionReference users = db.collection('users');
  await users.doc(authUser.uid).set({
    'phone': phone,
    'address': {
      'street': street,
      'city': city,
      'pinCode': pinCode,
      'state': state,
    }
  }, SetOptions(merge: true));
}
