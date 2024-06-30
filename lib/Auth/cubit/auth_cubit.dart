import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:myapp/Repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  User? user;


User get getUser {
  return user!;
}

Future<void> phoneAuth(String phoneNumber,{String? smsCode}) async{
  try {
 emit(AuthLoading());
  await AuthRepository.phoneAuth(phoneNumber, smsCode: smsCode);
  if(FirebaseAuth.instance.currentUser!=null){
         user = FirebaseAuth.instance.currentUser;

       await  setUserToFireStore();
     

        emit(AuthSuccess());
      }
      else {
         emit(AuthError(message: "No User Found"));

      }
}  catch (e) {
   emit(AuthError(message: e.toString()));
}
}


Future<void> setUserToFireStore()
async
{
  
  try {
    OnboardingHomeLoading();
  await FirebaseFirestore.instance.collection('userDetails').doc(user!.uid).set({
  'id':user?.uid,
  'phoneNumber': user?.phoneNumber,
  'createdAt': DateTime.now(),
  });
  emit(OnboardingHomeSuccess());
} on Exception catch (e) {
  emit(OnboardingHomeError(message: e.toString()));

}
}


}
