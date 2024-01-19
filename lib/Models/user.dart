import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String pseudo;
  final String Datedenaissance;
  final String phoneNumber;
  final String pharmacy;
  final String ville;
  final List followers;
  final List following;
  final String Verified;




  const User(
      {required this.pseudo,
        required this.uid,
        required this.photoUrl,
        required this.email,
        required this.ville,
        required this.phoneNumber,
        required this.pharmacy,
        required this.Datedenaissance,
        required this.followers,
        required this.following,
        required this.Verified,

      });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      pseudo: snapshot["pseudo"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      Datedenaissance: snapshot["Datedenaissance"],
      pharmacy: snapshot["pharmacy"],
      phoneNumber: snapshot["phoneNumber"],
      ville: snapshot["ville"],
      photoUrl: snapshot["photoUrl"],
      followers: snapshot["followers"],
      following: snapshot["following"],
      Verified :snapshot["Verified"],


    );
  }

  Map<String, dynamic> toJson() => {
    "pseudo": pseudo,
    "uid": uid,
    "email": email,
    "photoUrl": photoUrl,
    "Datedenaissance": Datedenaissance,
    "ville": ville,
    "pharmacy": pharmacy,
    "phoneNumber": phoneNumber ,
    "followers": followers,
    "following": following,
    "Verified": Verified,


  };
}
