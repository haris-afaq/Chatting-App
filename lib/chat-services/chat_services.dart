import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatServices{

  final FirebaseFirestore _firestore= FirebaseFirestore.instance;


  //get user stream
Stream<List<Map<String, dynamic>>> getUserStream(){
  return _firestore.collection("Users").snapshots().map((snapshot){
    return snapshot.docs.map((doc){
      final user=doc.data();
      return user;

    }).toList();

  });
}
}