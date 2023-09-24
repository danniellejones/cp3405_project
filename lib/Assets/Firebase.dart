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
    this.entity = FirebaseFirestore.instance.collection(entityName);
    return this.entity; 
  }

  findUserByUsername(String username) async {
    this.username = username; 
    this.snapshot = await this.entity.where('Username', isEqualTo: this.username).get(); 
    return this.username; 
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
