import 'package:firebase_database/firebase_database.dart';

class HomeVM {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  Stream<Event> getAllFunds() {
    return _database.child('funds').onValue.map((event) => event);
  }
}
