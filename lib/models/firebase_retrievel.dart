import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRetrieval {
  String entityName = '';
  late CollectionReference<Map<String, dynamic>> entity;
  QuerySnapshot<Map<String, dynamic>>? snapshot;
  Map<String, dynamic>? userData;
  String password = '';
  String firebaseEmail = '';
  String userType = '';

  retrieveEntity(String entityName) {
    this.entityName = entityName;
    entity = FirebaseFirestore.instance.collection(this.entityName);
  }

  findUserByEmail(String email) async {
    firebaseEmail = email;
    snapshot = await entity.where('Email', isEqualTo: email).get();
    return snapshot;
  }

  retrieveUserData() {
    userData = snapshot?.docChanges.first.doc.data();
  }

  getUserData() {
    return userData;
  }

  comparePassword(String password) {
    int match = password.compareTo(getSingleData(
        'Password')); // 0 indicates the values are equal. Other values doesn't mean the values are equal.
    return match;
  }

  getSingleData(String field) {
    for (final entry in userData!.entries) {
      if (entry.key == field) {
        return entry.value;
      }
    }
  }

  checkIfTeacherOrStudent() {
    String userType = getSingleData('UserType');
    return userType;
  }
}
