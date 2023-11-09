import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatelessWidget {
  final String documentId;

  GetData(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('user');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          ( context,snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("USER_EMAIL : ${data['Email']} ");
        }

        return Text("loading...");
      },
    );
  }
}