import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseRetrieval {
  String entityName = '';
  late CollectionReference<Map<String, dynamic>> entity;
  QuerySnapshot<Map<String, dynamic>>? snapshot; 
  Map<String, dynamic>? userData; 
  String password = ''; 
  String firebaseUsername = ''; 
  String userType = ''; 

  RetrieveEntity(String entityName) {
    this.entityName = entityName; 
    this.entity = FirebaseFirestore.instance.collection(this.entityName);
  }

  findUserByUsername(String username) async {
    this.firebaseUsername = username; 
    this.snapshot = await this.entity.where('Username', isEqualTo: username).get(); 
    return this.snapshot; 
  }

  retrieveUserData() {
    this.userData = this.snapshot?.docChanges.first.doc.data();
  }

  getUserData() {
    return this.userData; 
  }

  comparePassword(String password) {
    int match = password.compareTo(getSingleData('Password')); // 0 indicates the values are equal. Other values doesn't mean the values are equal. 
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
