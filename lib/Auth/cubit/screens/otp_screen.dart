
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:myapp/Auth/cubit/auth_cubit.dart';
import 'package:myapp/onboarding/cubit/screens/email_screen.dart';

class OTPScreen extends StatefulWidget {
 final String phone;
  const OTPScreen({super.key, required this.phone});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
late final authCubit = BlocProvider.of<AuthCubit>(context);

String smsCode = '';
@override
  void initState() {

    super.initState();
  }

  
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
      
      body: 
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
            "What's your verification code?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
            "We have sent a verification code to ",
            style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  VerificationCode(
                    
                    fullBorder: true,
            length: 6,
            
            textStyle: const TextStyle(fontSize: 20, color: Colors.black),
            underlineColor: Colors.black,
            onCompleted: (code) {
          setState(() {
            smsCode = code;
          });
            }, onEditing: (bool value) {  },
                  ),
                                    const SizedBox(height: 40,),

          // Spacer(),
                  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Didn't receive a code?"),
              SizedBox(width: 10,),
              InkWell(
                
                onTap: ()  {}, child:  Text("Resend",style: TextStyle(color: Colors.blue),)),
            ],
                  ),
                       MaterialButton(color: Colors.blue,
            minWidth: double.infinity,
            
            onPressed: () async{
          //  await authCubit.phoneAuth(widget.phone,smsCode: smsCode);
        
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return EmailScreen();
            },));
            },
            child: const Text('Continue',style: TextStyle(color: Colors.white),),
          ),
        //  SizedBox(height: 30,),
                ],
              ),
          ),
        )
    );
  }
}


