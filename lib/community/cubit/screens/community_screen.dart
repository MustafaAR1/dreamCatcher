import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/community/cubit/community_cubit.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
late  final communityCubit = BlocProvider.of<CommunityCubit>(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text("Discover ",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Communities",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
          ],
        ),
      ),
      
      body:Column(
        children: [
Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    if(communityCubit.communityList[index].communityImage!=null)
                    Image.asset(communityCubit.communityList[index].communityImage!),
                 
                 if(communityCubit.communityList[index].communityName!=null)
                    Text(communityCubit.communityList[index].communityName!),
                  ],
                ),
              );
            },
          ),
        ),


        ],
      ) );
  }
}