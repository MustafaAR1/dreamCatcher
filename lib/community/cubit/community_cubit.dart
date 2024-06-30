import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:myapp/models/community_model.dart';

part 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit() : super(CommunityInitial());

List<CommunityModel> communityList = [];
  
Future<void> fetchCommunityList(bool fetch,) async{
try {
  if(fetch = false) return;
  emit(CommunityLoading());
  final posts = FirebaseFirestore.instance.collection('posts');
  
  await posts.get().then(
    (value) {
      for (var element in value.docs) {
          communityList.add(CommunityModel.fromJson(element.data()));
          
          }
    },
  );
    emit(CommunitySuccess());

}  catch (e) {
emit(CommunityError(message: e.toString()));
}
}



}
