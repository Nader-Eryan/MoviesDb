import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveProfileImageToFirebase(
    {required String path, required String uid}) async {
  CollectionReference profilePicRef =
      FirebaseFirestore.instance.collection('imagePath');

  profilePicRef.doc().set({'path': path, 'uid': uid});
}
