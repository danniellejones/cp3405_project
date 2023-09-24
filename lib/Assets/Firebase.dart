import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseRetrieval {
  String entityName = '';
  late CollectionReference<Map<String, dynamic>> entity;
  QuerySnapshot<Map<String, dynamic>>? snapshot; 
  late Map<String, dynamic>? userData; 
  String password = ''; 
  String username = ''; 

  RetrieveEntity(String entityName) {
    this.entityName = entityName; 
    this.entity = FirebaseFirestore.instance.collection(this.entityName);
  }

  findUserByUsername(String username) async {
    return this.entity;
    this.username = username; 
    final snapshot = await this.entity.where('Username', isEqualTo: 'username1').get(); 
    return snapshot; 
  }

  retrieveUserData() {
    this.userData = this.snapshot?.docChanges.first.doc.data();
  }

  getUserData() {
    return this.userData; 
  }

  getSingleData(String field) {
    for (final entry in userData!.entries) {
      if (entry.key == field) {
        return entry.value;  
      }
    }
  }

  getPassword() {
    var list = []; 
    Iterable<MapEntry<String, dynamic>> entries = this.userData!.entries; 
    for (final entry in this.userData!.entries) {
      if (entry.key == 'Password') {
        password = entry.value; 
      }
    }
    return password; 
  }



}
