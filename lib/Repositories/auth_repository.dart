
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {



static Future<void> phoneAuth(String phoneNumber,{String? smsCode}) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      await FirebaseAuth.instance.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      print(e.message);
    },
    codeSent: (String verificationId, int? resendToken) async{

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode!);

    await FirebaseAuth.instance.signInWithCredential(credential);
    },
    codeAutoRetrievalTimeout: (String verificationId) {
    },
  );
}


}