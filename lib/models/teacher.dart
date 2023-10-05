import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cp3405_project/models/firebase_retrievel.dart';

class Teacher {
  String name = '';
  String email = '';
  String dob = '';
  List classes = [];
  FirebaseRetrieval firebaseRetrieval = FirebaseRetrieval();
  int points = 0;

  Teacher(Map<String, dynamic>? userData,
      QuerySnapshot<Map<String, dynamic>>? snapshot) {
    firebaseRetrieval.userData = userData;
    firebaseRetrieval.snapshot = snapshot;
  }

  getName() {
    // returns full name
    name = firebaseRetrieval.getSingleData('FirstName') +
        ' ' +
        firebaseRetrieval.getSingleData('LastName');
    return name;
  }

  getEmail() {
    email = firebaseRetrieval.getSingleData('Email');
    return email;
  }

  getDob() {
    dob = firebaseRetrieval.getSingleData('dob');
    return dob;
  }

  getClasses() {
    classes = firebaseRetrieval.getSingleData('Classes');
    return classes;
  }
}
