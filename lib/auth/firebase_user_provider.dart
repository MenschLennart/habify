import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HabifyFirebaseUser {
  HabifyFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

HabifyFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HabifyFirebaseUser> habifyFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<HabifyFirebaseUser>((user) => currentUser = HabifyFirebaseUser(user));
