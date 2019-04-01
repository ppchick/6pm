//CLEARS MATCHEDSESSION, UNMATCHEDSESSION, PROFILE
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClearDBWidget extends StatelessWidget {
  final CollectionReference profileCollection =
      Firestore.instance.collection('Profile');
  final CollectionReference unmatchedCollection =
      Firestore.instance.collection('UnmatchedSession');
  final CollectionReference matchedCollection =
      Firestore.instance.collection('MatchedSession');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50, 20, 0, 0),
      height: 50,
      width: 100,
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Colors.blueAccent,
        color: Colors.blue,
        elevation: 7.0,
        child: InkWell(
          onTap: () {
            //Delete everything in Profile, Unmatched Session, Matched Session
            profileCollection.getDocuments().then((snapshot) {
              List<DocumentSnapshot> profileDocs = snapshot.documents;
              for (int i = 0; i < profileDocs.length; i++) {
                Firestore.instance
                    .runTransaction((Transaction myTransaction) async {
                  await myTransaction.delete(profileDocs[i].reference);
                });
              }
            });

            unmatchedCollection.getDocuments().then((snapshot) {
              List<DocumentSnapshot> unmatchedDocs = snapshot.documents;
              for (int i = 0; i < unmatchedDocs.length; i++) {
                Firestore.instance
                    .runTransaction((Transaction myTransaction) async {
                  await myTransaction.delete(unmatchedDocs[i].reference);
                });
              }
            });

            matchedCollection.getDocuments().then((snapshot) {
              List<DocumentSnapshot> matchedDocs = snapshot.documents;
              for (int i = 0; i < matchedDocs.length; i++) {
                Firestore.instance
                    .runTransaction((Transaction myTransaction) async {
                  await myTransaction.delete(matchedDocs[i].reference);
                });
              }
            });
          },
          child: Center(
              child: Text(
            'clearDB',
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontFamily: 'Montserrat'),
          )),
        ),
      ),
    );
  }
}
