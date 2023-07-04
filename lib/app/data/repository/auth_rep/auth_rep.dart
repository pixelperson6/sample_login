// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
// import '../../exceptions/auth/email_signin_exception.dart';
// import '../../exceptions/auth/email_signup_exception.dart';


class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  // variables
  // final _auth = FirebaseAuth.instance;

  // final _db = FirebaseFirestore.instance;

  var verificationId = ''.obs;

  //user

  // late final Rx<User?> firebaseUser;

  //Geting user details


  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {
    Get.offAllNamed(Routes.WELCOME);

    // firebaseUser = Rx<User?>(_auth.currentUser);

    // firebaseUser.bindStream(_auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
  }

  logout() {
    Get.offAllNamed(Routes.WELCOME);
  }
  

  /// If we are setting initial screen from here
  /// then in the main.dart => App() add CircularProgressIndicator()
  // _setInitialScreen(User? user) async {
  //   if (user == null) {
  //     bookReader = null;
  //     Get.offAllNamed(Routes.WELCOME);
  //   } else {
  //     await getCurrentUser();
  //     Get.offAllNamed(Routes.HOME);
  //   }
  // }

  //FUNC

  // Future<String?> createUserWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     final ex = SignupEmailWithFirebaseFailure.code(e.code);
  //     return ex.message;
  //   } catch (e) {
  //     const ex = SignupEmailWithFirebaseFailure();
  //     return ex.message;
  //   }
  //   return null;
  // }

  // Future<String?> loginUserWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     final ex = EmailSigninWithFirebaseException.code(e.code);
  //     return ex.message;
  //   } catch (_) {
  //     const ex = EmailSigninWithFirebaseException();
  //     return ex.message;
  //   }
  //   return null;
  // }

  // Future<void> phoneAuthentication(String phoneNo) async {
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: phoneNo,
  //     verificationCompleted: (phoneAuthCredential) async {
  //       await _auth.signInWithCredential(phoneAuthCredential);
  //     },
  //     codeSent: (verificationId, forceResendingToken) {
  //       this.verificationId.value = verificationId;
  //     },
  //     codeAutoRetrievalTimeout: (verificationId) {
  //       this.verificationId.value = verificationId;
  //     },
  //     verificationFailed: (error) {
  //       throw error;
  //     },
  //   );
  // }

  // Future<bool> verifyOTP(String otp) async {
  //   var credentials = await _auth.signInWithCredential(
  //       PhoneAuthProvider.credential(
  //           verificationId: verificationId.value, smsCode: otp));

  //   return credentials.user != null ? true : false;
  // }

  // Future<void> logout() async => await _auth.signOut();
}
