import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());


  Future<void> setUserEmail(String userId,String email) async{

    
  
  try {
    OnboardingEmailLoading();

await FirebaseFirestore.instance.collection('Userdetails').doc(userId).set({
"email":email,
});

    OnboardingEmailSuccess();




}  catch (e) {
OnboardingEmailError(message: e.toString());

}


  }


}
