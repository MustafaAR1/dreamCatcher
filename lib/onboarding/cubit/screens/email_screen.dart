import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Auth/cubit/auth_cubit.dart';
import 'package:myapp/community/cubit/screens/community_screen.dart';
import 'package:myapp/onboarding/cubit/onboarding_cubit.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
 late final onboardingCubit = BlocProvider.of<OnboardingCubit>(context);
  late final authCubit = BlocProvider.of<AuthCubit>(context);

  final emailController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 80,
        leading: 
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          
          margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
         decoration: BoxDecoration(
        
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
              ),
        
          child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios,size: 20,),
                 ),
        ),
      )


      
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What\'s your email?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Please enter your phone number, we will send you a verification code.',
                style: TextStyle(fontSize: 16,color: Colors.grey),
              ),
              const SizedBox(height: 16),
           
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter email address',
                  border: OutlineInputBorder(
        
        
                    // borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
        SizedBox(height: 30,),
        MaterialButton(color: Colors.blue,
          minWidth: double.infinity,
          
          onPressed: () async{
        //    await onboardingCubit.setUserEmail(authCubit.getUser.uid, emailController.text).then((value) {
             
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //       return const CommunityScreen();
        //     },));
        //    },);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const CommunityScreen();
            },));        
            
          },
          child: const Text('Continue',style: TextStyle(color: Colors.white),),
        ),
        
        
        
          ],
        
        
            
          ),
        ),
      ),
    );
    }
}