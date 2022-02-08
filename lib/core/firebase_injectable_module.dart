
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



abstract class FirebaseInjectableModule {

  GoogleSignIn get googleSignIn => GoogleSignIn();

  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

 // FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
