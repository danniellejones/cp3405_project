import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cp3405_project/models/FirebaseRetrievel.dart';

class Student {
  String name = ''; 
  String email = ''; 
  String DOB = '';
  List classes = []; 
  FirebaseRetrieval firebaseRetrieval = FirebaseRetrieval(); 
  int points = 0; 
  String avatar = ''; 

  Student(Map<String, dynamic>? userData, QuerySnapshot<Map<String, dynamic>>? snapshot) {
    firebaseRetrieval.userData = userData; 
    firebaseRetrieval.snapshot = snapshot; 
  }

  getName () {  // returns full name
    this.name = firebaseRetrieval.getSingleData('FirstName') + ' ' + firebaseRetrieval.getSingleData('LastName');
    return this.name;  
  }

  getEmail() {
    this.email = firebaseRetrieval.getSingleData('Email');
    return this.email;  
  }

  getDOB() {
    this.DOB = firebaseRetrieval.getSingleData('DOB');
    return this.DOB;  
  }

  getClasses() {
    this.classes = firebaseRetrieval.getSingleData('Classes');
    return this.classes;
  }

  getPoints() {
    this.points = firebaseRetrieval.getSingleData('Points'); 
    return this.points; 
  }

  getAvatar() {
    this.avatar = firebaseRetrieval.getSingleData('Avatar').toString().toLowerCase();
    return this.avatar; 
  }

  addPoints(int number) {
    FirebaseFirestore.instance.collection('Users').doc(firebaseRetrieval.snapshot!.docs.first.id).update({'Points': getPoints() + number});
    return this.points; 
  }
  


}