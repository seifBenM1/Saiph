import 'package:cloud_firestore/cloud_firestore.dart';

class PuzzleGameService {

  final CollectionReference _usersCollection = FirebaseFirestore.instance
      .collection('user');


  Future<User> getUser(String userId) async {
    var snapshot = await _usersCollection.doc(userId).get();
    final userData = snapshot.data() as Map<String, dynamic>;
    var retriveduser=User(id: userId,
        firstname: userData['firstname'] ?? 'Unknown',
        lastname: userData['lastname'] ?? 'Unknown',
        score: userData['puzzle_score'] ?? 0);
    print(retriveduser.score);
    return  retriveduser;
  }

  Future<void> setNewScore(int newScore,String userId) async {
     await _usersCollection.doc(userId).update({
      'puzzle_score':newScore,
    });
  }

}

class User {
  String id;
  String firstname;
  String lastname;
  int score;
  User(
      {required this.id, required this.firstname, required this.lastname, required this.score});
}
