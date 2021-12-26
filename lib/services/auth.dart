import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';


/*-----------------------------------------------------------------------------------------------*/
/*-------------------------------------- auth abstract class ------------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
abstract class AuthBase {
  User get currentUser;
  Future <User> signInAnonymously();
  Future <void> signOut();
  Stream <User> authStateChanges();
  Future <User> signInWithGoogle() ;
  Future<User> signInWithFacebook();
  Future <User> signInWithEmailAndPassword (String email, String password);
  Future <User> createUserWithEmailAndPassword (String email, String password);
}


/*-----------------------------------------------------------------------------------------------*/
/*-------------------------------------- auth functions class ------------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
class Auth implements AuthBase  {
  /*---------------------------  firebaseAuth variable  ----------------------------*/
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream <User> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User get currentUser => FirebaseAuth.instance.currentUser;

/*-----------------------------------------------------------------------------------------------*/
/*-------------------------------------- sign in anonymously  ------------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
  @override
  Future <User> signInAnonymously() async{
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }


/*-----------------------------------------------------------------------------------------------*/
/*------------------------------------- sign in email & pass  -----------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
  @override
  Future <User> signInWithEmailAndPassword (String email, String password)  async{
    final userCredential =  await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user;
  }

/*-----------------------------------------------------------------------------------------------*/
/*------------------------------------- sign up email & pass  -----------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
  @override
  Future <User> createUserWithEmailAndPassword (String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    return userCredential.user;
  }


/*-----------------------------------------------------------------------------------------------*/
/*------------------------------------- sign in/up  with google  --------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
  @override
  Future <User> signInWithGoogle() async{
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser !=null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken!=null){
        final userCredential = await _firebaseAuth
            .signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));
        return userCredential.user;
      }
      else{
        throw FirebaseAuthException(
            code:  "Error missing google id token",
            message: "Missing Google Id token"
        );
      }
    }
    else {
      throw FirebaseAuthException(
        code: "Error Aborted by user",
        message: "Sign in aborted by user",
      );
    }
  }


/*-----------------------------------------------------------------------------------------------*/
/*----------------------------------- sign in/up with facebook  ---------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
  @override
  Future<User> signInWithFacebook() async{
    final fb = FacebookLogin();
    final response = await fb.logIn( permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (response.status) {
      case FacebookLoginStatus.Success :
        final accessToken = response.accessToken;
        final userCredential = await _firebaseAuth.signInWithCredential(
            FacebookAuthProvider.credential(accessToken.token)
        );

        return userCredential.user;

      case FacebookLoginStatus.Cancel :
        throw FirebaseAuthException(
            code: "Error Aborted by user",
            message: "Sign In Aborted by User"
        );
      case FacebookLoginStatus.Error :
        throw FirebaseAuthException(
          code: "Error Facebook Login Failed",
          message: response.error.developerMessage,
        );
      default :
        throw UnimplementedError();
    }
  }


/*-----------------------------------------------------------------------------------------------*/
/*---------------------------------------- logout function  -------------------------------------*/
/*-----------------------------------------------------------------------------------------------*/
  @override
  Future <void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    await _firebaseAuth.signOut();
  }
}